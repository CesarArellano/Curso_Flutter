import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/provider.dart';
import 'package:form_validation/src/models/producto_model.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final productsBloc = Provider.productsBloc(context);
    productsBloc.loadProducts();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),     
      ),
      body: _crearListado(productsBloc),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon( Icons.add ),
      backgroundColor: Colors.deepPurple,
      onPressed: () => Navigator.pushNamed(context, 'producto').then((value) {
        setState(() {});
      }),
    );
  }

  Widget _crearListado(ProductsBloc productsBloc) {
    
    return StreamBuilder(
      stream: productsBloc.productosStream,
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (snapshot.hasData) {
          final productos = snapshot.data;
          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (BuildContext context, int index) => _crearItem(context, productos[index], productsBloc),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context,ProductoModel producto, ProductsBloc productsBloc) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: AlignmentDirectional.centerEnd,
        color: Colors.red,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      onDismissed: (direction) => productsBloc.deleteProduct(producto.id),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
        child: Card(
          margin: EdgeInsets.zero,
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, 'producto', arguments: producto).then((value) {
              setState(() {});
            }),
            child: Column(
              children: <Widget>[
                (producto.fotoUrl == null)
                ? Image(image: AssetImage('assets/no-image.png'))
                : FadeInImage(
                  image: NetworkImage(producto.fotoUrl),
                  placeholder: AssetImage('assets/jar-loading.gif'),
                  height: 300.0,
                  width: double.infinity,
                  fit: BoxFit.cover
                ),
                ListTile(
                  title: Text('${producto.titulo} - ${producto.valor}'),
                  subtitle: Text((producto.disponible) ? 'Disponible' : 'Agotado'),                
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}