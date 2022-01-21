import 'package:flutter/material.dart';
import 'package:products_app/models/models.dart';
import 'package:products_app/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import 'package:products_app/providers/product_provider.dart';

import 'package:products_app/screens/screens.dart';
import 'package:products_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    
    if( productProvider.isLoading ) {
      return const LoadingScreen();    
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          Padding(
            padding: const EdgeInsets.only( right: 5 ),
            child: IconButton(
              splashRadius: 24,
              icon: const Icon( Icons.logout ),
              onPressed: () async {
                final authProvider = Provider.of<AuthProvider>(context, listen: false);
                await authProvider.logOut();
                Navigator.pushReplacementNamed(context, 'login');
              },
            )
          ),
        ],
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: productProvider.products.length,
        itemBuilder: ( _, int i) => GestureDetector(
          onTap: () {
            productProvider.selectedProduct = productProvider.products[i].copy();
            Navigator.pushNamed(context, 'product');
          },
          child: ProductCard( 
            product: productProvider.products[i]
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Agregar producto',
        child: const Icon( Icons.add ),
        onPressed: (){
          productProvider.selectedProduct = Product(
            disponible: true,
            titulo: '',
            valor: 0.0
          );
          Navigator.pushNamed(context, 'product');
        },
      ),
    );
  }
}