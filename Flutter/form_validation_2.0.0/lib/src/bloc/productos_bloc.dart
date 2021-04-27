import 'dart:io';
import 'package:rxdart/rxdart.dart';

import 'package:form_validation/src/models/producto_model.dart';
import 'package:form_validation/src/providers/productos_provider.dart';

class ProductsBloc {
  final _productsController = new BehaviorSubject<List<ProductoModel>>();
  final _loadController = new BehaviorSubject<bool>();

  final _productsProvider = new ProductosProvider();

  Stream<List<ProductoModel>> get productosStream => _productsController.stream;
  Stream<bool> get load => _loadController.stream;

  void loadProducts() async {
    final products = await _productsProvider.cargarProductos();
    _productsController.sink.add( products );
  }
  
  void addProduct(ProductoModel producto) async {
    _loadController.sink.add(true);
    await _productsProvider.crearProducto(producto);
    _loadController.sink.add(false);
  }

  void editProduct(ProductoModel producto) async {
    _loadController.sink.add(true);
    await _productsProvider.editarProducto(producto);
    _loadController.sink.add(false);
  }

  void deleteProduct(String productId) async {
    await _productsProvider.borrarProducto(productId);
  }

  Future<String> uploadPhoto(File photo) async{
    _loadController.sink.add(true);
    final photoUrl = await _productsProvider.subirImagen(photo);
    _loadController.sink.add(false);
    return photoUrl;
  }
  
  dispose() {
    _productsController?.close();
    _loadController?.close();
  }
}