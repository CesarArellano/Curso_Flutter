import 'package:flutter/material.dart';
import 'package:movie_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: const [
          CardSwiper(),
        ],
      )
    );
  }
}