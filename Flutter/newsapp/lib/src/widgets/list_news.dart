import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/theme/theme.dart';

class ListNews extends StatelessWidget {
  final List<Article> news;
  const ListNews( this.news );
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.news.length,
      itemBuilder: (BuildContext context, int index) {
        return _News(news: this.news[index], index: index);
      },
    );
  }
}

class _News extends StatelessWidget {
  final Article news;
  final int index;
  
  const _News( { @required this.news, @required this.index });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TopBarCard(news, index),
        _TitleCard(news),
        _ImageCard(news),
      ]
    );
  }

  
}

class ImageCard extends StatelessWidget {

  final Article news;
  const ImageCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(news.urlToImage),
    );
  }
}
class _TitleCard extends StatelessWidget {
  
  final Article news;
  const _TitleCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(news.title, style: TextStyle( fontSize: 20.0, fontWeight: FontWeight.w700)),
    );
  }
}

class _TopBarCard extends StatelessWidget {
  final Article news;
  final int index;

  const _TopBarCard( this.news, this.index );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: <Widget>[
          Text('${index + 1}.', style: TextStyle( color: myTheme.accentColor )),
          Text('${news.source.name}.')
        ],
      )
    );
  }
}