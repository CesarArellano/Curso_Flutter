import 'package:flutter/material.dart';
import 'package:products_app/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: ( _, int index) => const ProductCard()
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Agregar producto',
        child: const Icon( Icons.add ),
        onPressed: (){},
      ),
    );
  }
}