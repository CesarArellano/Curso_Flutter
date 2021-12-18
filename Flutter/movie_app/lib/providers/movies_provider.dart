import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:movie_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '62e55e873b3d4db86782226591ef48ae';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];

  MoviesProvider() {
    getNowPlayingMovies();
  }

  getNowPlayingMovies() async {
    final url = Uri.https( _baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });
    final resp = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson( resp.body );
    onDisplayMovies = [ ...nowPlayingResponse.results ];

    notifyListeners();
  }
}