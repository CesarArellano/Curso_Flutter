import 'package:flutter/material.dart';
import 'package:products_app/models/product.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Product product;

  ProductFormProvider( this.product );

  void updateAvailability(bool value) {
    product.disponible = value;
    notifyListeners();
  }
  
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }
}