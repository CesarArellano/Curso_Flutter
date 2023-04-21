import 'package:flutter/material.dart';
import 'package:peliculas/src/models/peliculas_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Pelicula>? peliculas;
  final Function siguientePagina;

  MovieHorizontal({ Key? key, required this.peliculas, required this.siguientePagina }) : super(key: key);

  final _pageController = PageController(
    viewportFraction: 0.3,
  );

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        siguientePagina();
      }
    });
    return SizedBox(
      height: _screenSize.height * 0.28,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        itemCount: peliculas!.length,
        itemBuilder: (BuildContext context, int i) {
          return _tarjeta(context, peliculas![i]);
        },
      ),
    );
  }

  Widget _tarjeta(BuildContext context, Pelicula pelicula) {
    final peliculaTarjeta = Container(
      margin: const EdgeInsets.only(left: 15.0),
      child: Column(
        children: <Widget>[
          Hero(
            tag: pelicula.uniqueIdCard,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder: const AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
                height: 160.0,
              ),
            ),
          ),
          const SizedBox( height: 5.0 ),
          SizedBox(
            width: 120.0,
            child: Text(pelicula.title!,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall),
          ),
        ],
      ),
    );
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'detalle',
              arguments: pelicula); // Mandar a la otra pantala
        },
        child: peliculaTarjeta);
  }
}
