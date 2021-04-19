import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:form_validation/src/models/producto_model.dart';

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
}