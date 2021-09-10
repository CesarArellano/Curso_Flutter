import 'package:flutter/material.dart';

import 'package:newsapp/src/models/category_model.dart';

import 'package:newsapp/src/theme/theme.dart';

import 'package:provider/provider.dart';
import 'package:newsapp/src/services/news_service.dart';

import 'package:newsapp/src/widgets/list_news.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return SafeArea(
      child: Column(
        children: <Widget>[
          _ListCategory(),
          Divider(height: 4.0, thickness: 2.0),
          (newsService.isLoading)
          ? Expanded(
            child: Center(child: CircularProgressIndicator())
          )
          : Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: NewsList(newsService.getArticlesSelectedCategory)
            ),
          )
        ],
      ),
    );
  }
}

class _ListCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 90.0,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final category = categories[index]; 
          return Container(
            width: 105,
            child: Padding(
              padding: EdgeInsets.only(top: 12.5),
              child: Column(
                children: <Widget>[
                  _CategoryButton(category),
                  SizedBox(height: 5.0),
                  Text('${category.name[0].toUpperCase()}${category.name.substring(1)}'),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {

  final Category category;

  const _CategoryButton(this.category);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return GestureDetector(
      onTap: () {
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = category.name;

      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
          category.icon,
          color: (newsService.selectedCategory == category.name) 
            ? myTheme.colorScheme.secondary 
            : Colors.black54,
        )
      ),
    );
  }
}