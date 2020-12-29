import 'package:flutter/material.dart';
import 'package:peliculas/src/models/peliculas_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;

  MovieHorizontal({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height * 0.25,
      child: PageView(
        pageSnapping: false,
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3, //  Se verán 3 imágenes
        ),
        children: _tarjetas(context),
      ),
    );
  }

  List<Widget> _tarjetas(context) {
    return peliculas.map((pelicula) {
      return Container(
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
    }).toList();
  }
}
