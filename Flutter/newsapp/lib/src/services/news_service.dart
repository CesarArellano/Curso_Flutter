import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:http/http.dart' as http;
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/models/news_models.dart';

final _urlNews = 'https://newsapi.org/v2';
final _apikey = 'e29217facc864b0a920bffe5d4b0adab';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'bussiness';
  List<Category> categories = [
    Category( FontAwesomeIcons.building, 'bussiness'),
    Category( FontAwesomeIcons.tv, 'entertainment'),
    Category( FontAwesomeIcons.addressCard, 'general'),
    Category( FontAwesomeIcons.headSideVirus, 'health'),
    Category( FontAwesomeIcons.vials, 'science'),
    Category( FontAwesomeIcons.volleyballBall, 'sports'),
    Category( FontAwesomeIcons.memory, 'technology'),
  ];
  Map<String, List<Article>> categoryArticles ={};

  NewsService() {
    this.getTopHeadLines();
    categories.forEach(( item ) {
      this.categoryArticles[item.name] = [];
    });
  }
  get selectedCategory => this._selectedCategory;

  set selectedCategory(String value) {
    this._selectedCategory = value;
    this.getArticlesByCategory(value);
    notifyListeners();
  }

  getTopHeadLines() async {
    final url = Uri.parse('$_urlNews/top-headlines?apiKey=$_apikey&country=mx');
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    this.headlines.addAll(newsResponse.articles);
    notifyListeners();    
  }

  getArticlesByCategory(String category) async {
    if( this.categoryArticles[category].length > 0 ) {
      return this.categoryArticles[category];
    }
    
    final url = Uri.parse('$_urlNews/top-headlines?apiKey=$_apikey&country=mx&category=$category');
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    this.categoryArticles[category].addAll(newsResponse.articles);
    notifyListeners();  
  }
}