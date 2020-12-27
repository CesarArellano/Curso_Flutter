import 'package:flutter/material.dart';
import 'dart:async';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    // Método de inicializa la clase
    super.initState();
    _agregarDiez();
    _scrollController.addListener(() {
      //Traemos más imágenes cuando llegue el usuario a la última imagen cargada.
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    // Desechar la pantalla.
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listas'),
        ),
        body: Stack(
          children: <Widget>[
            _crearLista(),
            _crearLoading(),
          ],
        ));
  }

  Widget _crearLista() {
    //Elementos de lista indefinidos / ilimitados, serán renderizados en tiempo real.
    return RefreshIndicator(
      onRefresh: obtenerPaginaUno,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];
          //Pendiente: Corregir Bug Flutter NetwotkImage statusCode: 404
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            height: 300,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  void _agregarDiez() {
    for (int i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 1);
    new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 150,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250),
    );
    _agregarDiez();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
                backgroundColor: Colors.blue,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            ],
          ),
          SizedBox(height: 20.0),
        ],
      );
    } else {
      return Container();
    }
  }

  Future<void> obtenerPaginaUno() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregarDiez();
    });
    return Future.delayed(duration);
  }
}
