import 'package:flutter/material.dart';
import 'package:products_app/widgets/product_image.dart';


class ProductScreen extends StatelessWidget {

  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const ProductImage(),
            Positioned(
              top: 60,
              left: 30,
              child: IconButton( 
                onPressed: () => Navigator.pop(context),
                icon: const Icon( Icons.arrow_back_ios, color: Colors.white, size: 30 )
              ),
            ),
            Positioned(
              top: 60,
              right: 30,
              child: IconButton( 
                onPressed: () {

                },
                icon: const Icon( Icons.camera_alt_outlined, color: Colors.white, size: 35, )
              ),
            ),
          ]
        )
      )
    );
  }
}