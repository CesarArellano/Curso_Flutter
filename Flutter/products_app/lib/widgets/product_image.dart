import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String? urlProduct;
  
  const ProductImage({
    Key? key,
    this.urlProduct 
  }) : super( key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 450,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20)
        ),
        child: urlProduct == null
          ? Image.asset('assets/images/no-image.png', fit: BoxFit.cover)
          : FadeInImage(
            placeholder: const AssetImage('assets/images/jar-loading.gif'),
            image: NetworkImage(urlProduct!),
            fit: BoxFit.cover,
            imageErrorBuilder: ( _, __, ___ ) => Image.asset('assets/images/no-image.png', fit: BoxFit.cover),
          ),
      ),
    );
  }
}