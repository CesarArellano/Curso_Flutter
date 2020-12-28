import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:peliculas/src/models/peliculas_model.dart';

class PelicularProvider {
  String _apikey = '62e55e873b3d4db86782226591ef48ae';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apikey,
      'language': _language,
    });
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;
  }
}
