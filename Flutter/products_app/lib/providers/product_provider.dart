import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:products_app/models/models.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  final String _baseUrl = "flutter-varios-1f0b2-default-rtdb.firebaseio.com";
  final List<Product> products = [];
  late Product selectedProduct;

  bool isLoading = true;
  bool isSaving = false;
  
  ProductProvider() {
    loadProducts();
  }

  Future loadProducts() async {

    isLoading = true;
    notifyListeners();

    final uri = Uri.https( _baseUrl, 'productos.json');
    final resp = await http.get( uri );
    final Map<String, dynamic>? decodedData = json.decode(resp.body);
    if( decodedData == null ) return;
    
    if(decodedData['error'] != null) return []; // Validación token

    decodedData.forEach((key, value) {
      final prodTemp = Product.fromMap(value);
      prodTemp.id = key;
      products.add( prodTemp );      
    });

    isLoading = false;
    notifyListeners();
    
  }

  Future saveOrCreateProduct( Product product ) async {
    isSaving = true;
    notifyListeners();

    if( product.id == null ) {
      await createProduct(product);
    } else {
      await updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product product) async {
    final uri = Uri.https( _baseUrl, 'productos/${ product.id }.json');
    await http.put( uri, body: product.toJson() );
    
    final index = products.indexWhere((element) => element.id == product.id);
    products[index] = product;
    notifyListeners();
    
    return product.id!;

  }

  Future<String> createProduct(Product product) async {
    final uri = Uri.https( _baseUrl, 'productos.json');
    final resp = await http.post( uri, body: product.toJson() );
    final decodedData = json.decode( resp.body );

    product.id = decodedData['name'];
    print(product.id);
    products.add(product);

    return product.id!;
  }
}