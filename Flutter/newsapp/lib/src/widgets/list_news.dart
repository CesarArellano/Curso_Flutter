import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/theme/theme.dart';

class NewsList extends StatelessWidget {
  final List<Article> news;
  const NewsList( this.news );
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
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
        SizedBox(height: 15.0),
        _TopBarCard(news, index),
        _TitleCard(news),
        _ImageCard(news),
        _BodyCard(news),
        _ButtonsCard(news),
        SizedBox(height: 10.0),
        Divider(thickness: 1.0),
      ]
    );
  }

  
}
class _ButtonsCard extends StatelessWidget {

  final Article news;
  const _ButtonsCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RawMaterialButton(
          onPressed: () {},
          fillColor: myTheme.accentColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Icon(Icons.star_border)
        ),
        SizedBox(width: 10.0),
        RawMaterialButton(
          onPressed: () {},
          fillColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Icon(Icons.more)
        ),
      ],
    );
  }
}

class _BodyCard extends StatelessWidget {

  final Article news;
  const _BodyCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: Text((news.description != null) ? news.description : '', textAlign: TextAlign.justify),
    );
  }
}

class _ImageCard extends StatelessWidget {

  final Article news;
  const _ImageCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          child: (news.urlToImage != null) 
          ? FadeInImage(
            placeholder: AssetImage('assets/img/giphy.gif'),
            image: NetworkImage(news.urlToImage)
          )
          : Image(image:AssetImage('assets/img/no-image.png'))
        ),
      ),
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
          Text('${index + 1}. ', style: TextStyle( color: myTheme.accentColor )),
          Text('${news.source.name}.')
        ],
      )
    );
  }
}