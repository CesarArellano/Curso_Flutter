import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:peliculas/src/models/peliculas_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  CardSwiper(this.peliculas);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: peliculas.length,
      itemBuilder: (context, index, realIndex) => MoviePosterImage(peliculas[index]),
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true
      ),
    );
  }

}

class MoviePosterImage extends StatelessWidget {
  final Pelicula pelicula;

  MoviePosterImage(this.pelicula);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'detalle', arguments: pelicula),
      child: FadeInImage(
        image: NetworkImage(pelicula.getBackgroundImg()),
        placeholder: AssetImage('assets/img/loading.gif'),
        fit: BoxFit.cover,
      ),
    );
  }
}
