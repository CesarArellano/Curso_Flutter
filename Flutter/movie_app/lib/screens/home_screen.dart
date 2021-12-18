import 'package:flutter/material.dart';
import 'package:movie_app/providers/movies_provider.dart';
import 'package:movie_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas en cines'),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              tooltip: 'Búsqueda',
              splashRadius: 24,
              icon: const Icon( Icons.search ),
              onPressed: () {
                debugPrint('Search...');
              }, 
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CardSwiper( movies : moviesProvider.onDisplayMovies ),
            const SizedBox(height: 20),
            const MovieSlider(),
            const MovieSlider(),
            const MovieSlider(),
          ],
        )
      )
    );
  }
}