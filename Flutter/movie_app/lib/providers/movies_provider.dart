
import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier {
  
  MoviesProvider() {
    debugPrint('Hello');
    getNowPlayingMovies();
  }

  getNowPlayingMovies() async {
    debugPrint('getNowPlayingMovies');
  }
}