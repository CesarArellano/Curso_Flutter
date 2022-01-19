import 'package:flutter/material.dart';
import 'package:products_app/helpers/card_decoration.dart';
import 'package:products_app/models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        height: 400,
        margin: const EdgeInsets.only(top: 20, bottom: 10),
        decoration: CardDecoration.createCardShape(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage( product.fotoUrl ),
            _ProductDetails( product: product ),
            Positioned(
              top: 0,
              right: 0,
              child: _PriceTag( price: product.valor ,),
            ),
            if( !product.disponible )
              const Positioned(
                top: 0,
                left: 0,
                child: _NotAvailable(),
              )
          ],
        ),
      ),
    );
  }
}

class _NotAvailable extends StatelessWidget {
  const _NotAvailable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 70,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          topLeft: Radius.circular(20)
        )
      ),
      child: const Text(
        'No Disponible',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
  final double price;

  const _PriceTag({
    Key? key,
    required this.price
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 120,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric( horizontal: 10.0 ),
          child: Text(
            '\$$price',
            style: const TextStyle(color: Colors.white, fontSize: 20)
          ),
        ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final Product product;
  const _ProductDetails({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: width * 0.8,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.titulo,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            product.id!,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)
          ),
        ],
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  final String? urlProduct;
  
  const _BackgroundImage(this.urlProduct);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
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