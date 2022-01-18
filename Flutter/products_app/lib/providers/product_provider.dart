import 'package:flutter/material.dart';
import 'package:products_app/models/models.dart';

class ProductProvider extends ChangeNotifier {
  final String _baseUrl = "https://flutter-varios-1f0b2-default-rtdb.firebaseio.com/productos.json";

  final List<Product> products = [];
  
}