import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: SizedBox(
        width: double.infinity,
        height: 450,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20)
          ),
          child: FadeInImage(
            placeholder: AssetImage('assets/images/jar-loading.gif'),
            image: AssetImage('assets/images/no-image.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}