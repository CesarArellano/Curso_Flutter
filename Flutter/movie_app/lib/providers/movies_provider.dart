import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/helpers/debouncer.dart';

import 'package:movie_app/models/models.dart';
import 'package:movie_app/models/search_response.dart';

class MoviesProvider extends ChangeNotifier {
  
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '62e55e873b3d4db86782226591ef48ae';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  List<Movie> topRatedMovies = [];
  List<Movie> upcomingMovies = [];
  
  Map<int, List<Cast>> movieCast = {};

  final debouncer = Debouncer(duration:  const Duration( milliseconds:  500) );
  final StreamController<List<Movie>> _suggestionStreamController = StreamController.broadcast();
  Stream<List<Movie>> get suggestionsStream => _suggestionStreamController.stream;

  int _popularPage = 1;
  int _topRatedPage = 1;
  int _upcomingPage = 1;

  MoviesProvider() {
    getNowPlayingMovies();
    getPopularMovies();
    getTopRatedMovies();
    getUpcomingMovies();
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
    final body = await getJsonData('3/movie/popular', _popularPage);
    final popularResponse = MoviesResponse.fromJson( body );
    popularMovies = [ ...popularMovies, ...popularResponse.results ];
    _popularPage++;
    notifyListeners();
  }

  void getTopRatedMovies() async {
    final body = await getJsonData('3/movie/top_rated', _topRatedPage);
    final topRatedResponse = MoviesResponse.fromJson( body );
    topRatedMovies = [ ...topRatedMovies, ...topRatedResponse.results ];
    _topRatedPage++;
    notifyListeners();
  }

  void getUpcomingMovies() async {
    final body = await getJsonData('3/movie/upcoming', _upcomingPage);
    final upomingResponse = MoviesResponse.fromJson( body );
    upcomingMovies = [ ...upcomingMovies, ...upomingResponse.results ];
    _upcomingPage++;
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {

    if( movieCast.containsKey( movieId ) ) return movieCast[movieId]!;

    final body = await getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson( body );

    movieCast[movieId] = creditsResponse.cast ?? [];

    return movieCast[movieId]!;
  }

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.https( _baseUrl, '3/search/movie', {
      'api_key': _apiKey,
      'language': _language,
      'query': query,
    });
    
    final resp = await http.get(url);
    final movies = SearchResponse.fromJson( resp.body );
    return movies.results!;
  }

  void getSuggestionsByQuery( String query ) {
    debouncer.value = '';
    debouncer.onValue = ( value ) async {
      final results = await searchMovies(value);
      _suggestionStreamController.add( results );
    };

    final timer = Timer.periodic( const Duration(milliseconds:  300), ( _ ) { 
      debouncer.value = query;
    });

    Future.delayed( const Duration( milliseconds: 301) ).then( ( _ ) => timer.cancel());
  }
}