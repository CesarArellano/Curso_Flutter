import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:peliculas/src/models/peliculas_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  const CardSwiper({ Key? key, this.peliculas = const [] }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: peliculas.length,
      itemBuilder: (context, index, realIndex) => MoviePosterImage(peliculas[index]),
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        height: 250.0
      ),
    );
  }

}

class MoviePosterImage extends StatelessWidget {
  final Pelicula pelicula;

  const MoviePosterImage(this.pelicula, { Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'detalle', arguments: pelicula),
      child: FadeInImage(
        image: NetworkImage(pelicula.getBackgroundImg()),
        placeholder: const AssetImage('assets/img/loading.gif'),
        fit: BoxFit.cover,
      ),
    );
  }
}
