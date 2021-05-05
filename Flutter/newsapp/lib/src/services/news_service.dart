import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:newsapp/src/models/news_models.dart';

final _urlNews = 'https://newsapi.org/v2/';
final _apikey = 'e29217facc864b0a920bffe5d4';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  NewsService() {
    this.getTopHeadLines();
  }

  getTopHeadLines() async {
    final url = Uri.parse('$_urlNews/top-headlines?apiKey=$_apikey&country=mx');
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    this.headlines.addAll(newsResponse.articles);
    notifyListeners();    
  }
}