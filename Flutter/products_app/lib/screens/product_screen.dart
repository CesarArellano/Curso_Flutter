import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:products_app/helpers/card_decoration.dart';
import 'package:products_app/ui/input_decorations.dart';
import 'package:products_app/widgets/product_image.dart';


class ProductScreen extends StatelessWidget {

  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Stack(
                children: [
                  const ProductImage(),
                  Positioned(
                    top: 60,
                    left: 20,
                    child: IconButton( 
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon( Icons.arrow_back_ios, color: Colors.white, size: 30 )
                    ),
                  ),
                  Positioned(
                    top: 60,
                    right: 20,
                    child: IconButton( 
                      onPressed: () {
                      },
                      icon: const Icon( Icons.camera_alt_outlined, color: Colors.white, size: 35, )
                    ),
                  ),
                ]
              ),
              const _ProductForm()
            ],
          ),
        )
      )
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: CardDecoration.createCardShapeInBottom(),
      child: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextFormField(
                cursorColor: Colors.deepPurple,
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre del producto',
                  labelText: 'Nombre',
                  icon: Icons.shop,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                keyboardType: TextInputType.number,
                cursorColor: Colors.deepPurple,
                decoration: InputDecorations.authInputDecoration(
                  hintText: '\$1500',
                  labelText: 'Precio',
                  icon: Icons.price_check,
                ),
              ),
              const SizedBox(height: 20),

              SwitchListTile.adaptive(
                value: true,
                title: const Text('Disponible'),
                activeColor: Colors.deepPurple,
                onChanged: (value) {

                }
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}