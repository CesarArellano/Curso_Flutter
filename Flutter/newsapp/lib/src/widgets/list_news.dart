import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';

class ListNews extends StatelessWidget {
  final List<Article> news;
  const ListNews( this.news );
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.news.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(this.news[index].title);
      },
    );
  }
}