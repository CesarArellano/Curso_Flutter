import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:form_validation/src/models/producto_model.dart';
import 'package:mime_type/mime_type.dart';

class ProductosProvider {
  final String _url = 'https://flutter-varios-1f0b2-default-rtdb.firebaseio.com';
  
  Future<bool> crearProducto(ProductoModel producto) async {
    final url = Uri.parse('$_url/productos.json');
    final resp = await http.post(url, body: productoModelToJson(producto));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }

  Future<List<ProductoModel>> cargarProductos() async {
    final url = Uri.parse('$_url/productos.json');
    final resp = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<ProductoModel> productos = [];
    if(decodedData == null) return [];
    decodedData.forEach((id, prod) {  // Key y Value
      final prodTemp = ProductoModel.fromJson(prod);
      prodTemp.id = id;
      productos.add(prodTemp);      
    });
    return productos;
  }

  Future<int> borrarProducto(String id) async {
    final url = Uri.parse('$_url/productos/$id.json');
    final resp = await http.delete(url);
    print(json.decode(resp.body));
    return 1;
  }

  Future<bool> editarProducto(ProductoModel producto) async {
    final url = Uri.parse('$_url/productos/${ producto.id }.json');
    final resp = await http.put(url, body: productoModelToJson(producto));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }

  Future<String> subirImagen( File imagen ) async {
    final url = Uri.parse('https://api.cloudinary.com/v1_1/dpvsseupu/image/upload?upload_preset=fvps6qmz');
    final mimeType = mime(imagen.path).split('/'); //image/jpeg

    final imageUploadRequest = http.MultipartRequest( 'POST', url );

    final file = await http.MultipartFile.fromPath(
      'file', 
      imagen.path, 
      contentType: MediaType(mimeType[0], mimeType[1])
    );
    imageUploadRequest.files.add(file);
    final streamedResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamedResponse);
    
    if(resp.statusCode != 200 && resp.statusCode != 201) {
      print('Algo salío mal');
      return null;
    }
    final respData = json.decode(resp.body);
    print(respData);
    return respData['secure_url'];
  }
}