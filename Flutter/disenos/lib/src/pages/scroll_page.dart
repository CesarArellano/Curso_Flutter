import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _paginaUno(),
          _paginaDos(),
        ],
      ),
    );
  }

  Widget _paginaUno() {
    return Center(
      child: Text('Página 1'),
    );
  }

  Widget _paginaDos() {
    return Center(
      child: Text('Página 2'),
    );
  }
}
