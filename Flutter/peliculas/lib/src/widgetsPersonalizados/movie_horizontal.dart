import 'package:flutter/material.dart';
import 'package:peliculas/src/models/peliculas_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;
  final Function siguientePagina;

  MovieHorizontal({@required this.peliculas, @required this.siguientePagina});

  final _pageController = new PageController(
    initialPage: 1,
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
    return Container(
      height: _screenSize.height * 0.25,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: peliculas.length,
        itemBuilder: (BuildContext context, int i) {
          return _tarjeta(context, peliculas[i]);
        },
      ),
    );
  }

  Widget _tarjeta(BuildContext context, Pelicula pelicula) {
    final peliculaTarjeta = Container(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              image: NetworkImage(pelicula.getPosterImg()),
              placeholder: AssetImage('assets/img/no-image.jpg'),
              fit: BoxFit.cover,
              height: 160.0,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption),
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
