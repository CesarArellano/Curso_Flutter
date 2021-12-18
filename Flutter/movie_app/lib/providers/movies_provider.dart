import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:movie_app/models/models.dart';
import 'package:movie_app/models/popular_response.dart';

class MoviesProvider extends ChangeNotifier {
  
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '62e55e873b3d4db86782226591ef48ae';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  int _page = 1;

  MoviesProvider() {
    getNowPlayingMovies();
    getPopularMovies();
  }

  Future<String> getJsonData(String endpoint, [ int page = 1 ]) async {
    final url = Uri.https( _baseUrl, endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
    });
    
    final resp = await http.get(url);
    return resp.body;
  }

  void getNowPlayingMovies() async {
    final body = await getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson( body );
    onDisplayMovies = [ ...nowPlayingResponse.results ];
    notifyListeners();
  }

  void getPopularMovies() async {
    final body = await getJsonData('3/movie/popular', _page);
    final popularResponse = PopularResponse.fromJson( body );
    popularMovies = [ ...popularMovies, ...popularResponse.results ];
    _page++;
    notifyListeners();
  }
}