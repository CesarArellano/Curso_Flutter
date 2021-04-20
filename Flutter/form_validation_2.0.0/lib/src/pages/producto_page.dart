import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:form_validation/src/models/producto_model.dart';
import 'package:form_validation/src/providers/productos_provider.dart';
import 'package:form_validation/src/utils/utils.dart';

class ProductoPage extends StatefulWidget {
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();
  final ProductosProvider productoProvider = new ProductosProvider();
  ProductoModel productoModel = new ProductoModel();
  bool _guardando = false;
  File foto;

  @override
  Widget build(BuildContext context) {
    final ProductoModel prodData = ModalRoute.of(context).settings.arguments;
    if(prodData != null) {
      productoModel = prodData;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Producto'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed:() {
              _procesarImagen(ImageSource.gallery);
            }
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed:() {
              _procesarImagen(ImageSource.camera);
            }
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _mostrarFoto(),
                _crearNombre(),
                _crearPrecio(),
                _crearDisponible(),
                SizedBox(height: 20.0),
                _crearBoton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: productoModel.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto'
      ),
      onSaved: (value) => productoModel.titulo = value,
      validator: (value) {
        return (value.length < 3) ? 'Ingrese el nombre del producto' : null;
      },
    );
  }

  Widget _crearPrecio() {
    return TextFormField(
      initialValue: productoModel.valor.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Precio'
      ),
      onSaved: (value) => productoModel.valor = double.parse(value),
      validator: (value) {
        return (isNumeric(value)) ? null : 'Ingrese el precio del producto';
      },
    );
  }

  Widget _crearDisponible() {
    return SwitchListTile(
      value: productoModel.disponible, 
      title: Text('Disponible'),
      activeColor: Colors.deepPurple,
      onChanged: (value) => setState((){
        productoModel.disponible = value;
      }),
    );
  }

  Widget _crearBoton() {
    return Container(
      width: 120.0,
      height: 40.0,
      child: ElevatedButton.icon(      
        style: ElevatedButton.styleFrom(
          primary: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          )
        ),
        icon: Icon(Icons.save),
        label: Text('Guardar'),
        onPressed: _guardando ? CircularProgressIndicator() : _submit 
      ),
    );
  }

  void _submit() async {
    if( !formKey.currentState.validate() ) return;
    formKey.currentState.save();

    setState(() {
      _guardando = true;
    });

    if(foto != null) {
      productoModel.fotoUrl = await productoProvider.subirImagen(foto);
    }

    if (productoModel.id == null) {
      productoProvider.crearProducto(productoModel);
    } else {
      productoProvider.editarProducto(productoModel);
    }
    setState(() {
      _guardando = false;
    });
    showSnackBar('Registro guardado');
    Navigator.pop(context);

  }

  void showSnackBar(String mensaje) {
    final snackBar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 1500),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _mostrarFoto() {
    if (productoModel.fotoUrl != null) {
      return FadeInImage(
        image: NetworkImage(productoModel.fotoUrl),
        placeholder: AssetImage('assets/jar-loading.gif'),
        height: 300.0,
        fit: BoxFit.contain,
      );
    } else {
      return ( foto != null ) 
      ? Image.file(
          foto,
          fit: BoxFit.cover,
          height: 300.0,
        )
      : Image.asset('assets/no-image.png');
    }
  }

  _procesarImagen(ImageSource sourceImage) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: sourceImage);
    if(pickedFile != null) {
      setState(() {
        productoModel.fotoUrl = null;
        foto = File(pickedFile.path);
      });
    }
  }
}