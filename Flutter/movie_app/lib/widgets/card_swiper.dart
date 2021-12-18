import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';

import 'package:movie_app/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  const CardSwiper({
    Key? key,
    required this.movies
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if( movies.isEmpty ) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.7,
        itemBuilder: ( _ , int index ) {
          final movie = movies[index];
          final posterUrl = movie.fullPosterImg;

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: movie ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/images/no-image.jpg'),
                image: NetworkImage( posterUrl ),
                fit: BoxFit.cover,
              ),
            ),
          );

        },
      ),
    );
  }
}