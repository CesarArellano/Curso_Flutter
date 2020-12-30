import 'package:flutter/material.dart';

import 'package:peliculas/src/models/peliculas_model.dart';

class PeliculaDetalle extends StatelessWidget {
  const PeliculaDetalle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;
    return Container(
      child: Scaffold(
          body: Center(
        child: Text(pelicula.title),
      )),
    );
  }
}
