import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Producto'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
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
        onPressed: _submit
      ),
    );
  }

  void _submit() async {
    if( !formKey.currentState.validate() ) return;
    formKey.currentState.save();
    print('Válido');
    print(productoModel.titulo);
    print(productoModel.valor);
    final resp = await productoProvider.crearProducto(productoModel);
    print(resp);
  }
}