import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:http/http.dart' as http;
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/models/news_models.dart';

const _urlNews = 'https://newsapi.org/v2';
const _apikey = 'e29217facc864b0a920bffe5d4b0adab';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';
  List<Category> categories = [
    Category( FontAwesomeIcons.building, 'business'),
    Category( FontAwesomeIcons.tv, 'entertainment'),
    Category( FontAwesomeIcons.addressCard, 'general'),
    Category( FontAwesomeIcons.headSideVirus, 'health'),
    Category( FontAwesomeIcons.vials, 'science'),
    Category( FontAwesomeIcons.volleyballBall, 'sports'),
    Category( FontAwesomeIcons.memory, 'technology'),
  ];
  Map<String, List<Article>> categoryArticles ={};
  bool _isLoading = true;
  NewsService() {
    getTopHeadLines();

    for (Category item in categories ) {
      categoryArticles[item.name] = [];
    }
    
    getArticlesByCategory( _selectedCategory );
  }

  bool get isLoading => _isLoading;

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String value) {
    _selectedCategory = value;
    _isLoading = true;
    getArticlesByCategory(value);
    notifyListeners();
  }

  List<Article> get getArticlesSelectedCategory 
    => categoryArticles[selectedCategory]!;

  getTopHeadLines() async {
    final url = Uri.parse('$_urlNews/top-headlines?apiKey=$_apikey&country=mx');
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    headlines.addAll(newsResponse.articles!);
    notifyListeners();    
  }

  getArticlesByCategory(String category) async {
    if( categoryArticles[category]!.isNotEmpty ) {
      _isLoading = false;
      notifyListeners();
      return categoryArticles[category];
    }

    final url = Uri.parse('$_urlNews/top-headlines?apiKey=$_apikey&country=mx&category=$category');
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    categoryArticles[category]!.addAll(newsResponse.articles!);
    _isLoading = false;
    notifyListeners();  
  }
}