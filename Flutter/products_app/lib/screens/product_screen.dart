import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';
import 'package:products_app/providers/product_form_provider.dart';
import 'package:products_app/providers/product_provider.dart';

import 'package:products_app/helpers/card_decoration.dart';
import 'package:products_app/models/models.dart';
import 'package:products_app/ui/input_decorations.dart';
import 'package:products_app/widgets/product_image.dart';


class ProductScreen extends StatelessWidget {

  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<ProductProvider>(context).selectedProduct;

    return ChangeNotifierProvider(
      create: ( _ ) => ProductFormProvider(product),
      child: _ProductScreenBody(product: product),
    );
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Stack(
                children: [
                  ProductImage( urlProduct: product.fotoUrl ),
                  Container(
                    width: double.infinity,
                    height: 450,
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)
                      ),
                    ),
                  ),
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
                      onPressed: () async {
                        final picker = ImagePicker();
                        // Capture a photo
                        final XFile? file = await picker.pickImage(
                          source: ImageSource.gallery,
                          imageQuality: 100
                        );

                        if( file == null ) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('El usuario no tomó ninguna foto'),
                            )
                          );
                          return;
                        }
                        
                        productProvider.updateSelectedProductImage(file.path);
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Guardar',
        child: productProvider.isSaving 
          ? const CircularProgressIndicator( color: Colors.white )
          : const Icon( Icons.save_alt_outlined ),
        onPressed: productProvider.isSaving
          ? null
          : () async {
            FocusScope.of(context).unfocus();

            if( !productForm.validateForm() ) return;

            final String? imageUrl = await productProvider.uploadImage();
            
            if( imageUrl != null ) {
              productForm.product.fotoUrl = imageUrl;
          }

          await productProvider.saveOrCreateProduct( productForm.product );
        },
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;

    return Container(
      width: double.infinity,
      decoration: CardDecoration.createCardShapeInBottom(),
      child: Form(
        key: productForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextFormField(
                initialValue: product.titulo,
                onChanged: ( name ) => product.titulo = name,
                validator: ( name ) {
                  if( name == null || name.isEmpty ) {
                    return 'El nombre es requerido';
                  } 
                },
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
                  FilteringTextInputFormatter.allow( RegExp(r'^(\d+)?\.?\d{0,2}') )
                ],
                initialValue: '${ product.valor }',
                onChanged: ( price ) {
                  if( double.tryParse(price) == null) {
                    product.valor = 0;
                  } else {
                    product.valor = double.parse(price);
                  }
                },
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
                value: product.disponible,
                title: const Text('Disponible'),
                activeColor: Colors.deepPurple,
                onChanged: productForm.updateAvailability,
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}