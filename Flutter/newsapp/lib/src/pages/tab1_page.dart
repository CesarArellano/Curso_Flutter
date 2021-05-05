import 'package:flutter/material.dart';
import 'package:newsapp/src/widgets/list_news.dart';

import 'package:provider/provider.dart';
import 'package:newsapp/src/services/news_service.dart';

class Tab1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<NewsService>(context).headlines;
    return Container(
      child: ListNews(headlines)
    );
  }
}