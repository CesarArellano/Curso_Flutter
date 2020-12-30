import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/peliculas_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemBuilder: (BuildContext context, int index) {
          return _tarjetaPelicula(context, peliculas[index]);
        },
        itemCount: peliculas.length,
        //pagination: new SwiperPagination(),
        //control: new SwiperControl(),
      ),
    );
  }

  Widget _tarjetaPelicula(BuildContext context, Pelicula pelicula) {
    pelicula.uniqueId = '${pelicula.id}-tarjeta';
    final peliculaTarjeta = Hero(
      tag: pelicula.uniqueId,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: FadeInImage(
          image: NetworkImage(pelicula.getPosterImg()),
          placeholder: AssetImage('assets/img/no-image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'detalle',
            arguments: pelicula); // Mandar a la otra pantala
      },
      child: peliculaTarjeta,
    );
  }
}
