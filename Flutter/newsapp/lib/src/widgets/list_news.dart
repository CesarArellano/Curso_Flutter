import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/theme/theme.dart';

class NewsList extends StatelessWidget {
  final List<Article> news;

  const NewsList({
    Key? key,
    required this.news
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
        return _News(news: news[index], index: index);
      },
    );
  }
}

class _News extends StatelessWidget {
  final Article news;
  final int index;
  
  const _News({
    required this.news,
    required this.index 
  });

  @override
  Widget build(BuildContext context) {
    return Column(      
      children: <Widget>[
        const SizedBox(height: 15.0),
        _TopBarCard(news, index),
        _TitleCard(news),
        _ImageCard(news),
        _BodyCard(news),
        _ButtonsCard(news),
        const SizedBox(height: 10.0),
        const Divider(thickness: 1.0),
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
          fillColor: myTheme.colorScheme.secondary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.star_border)
        ),
        const SizedBox(width: 10.0),
        RawMaterialButton(
          onPressed: () {},
          fillColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.more)
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
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Text(
        (news.description != null) ? news.description! : '',
        textAlign: TextAlign.justify
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {

  final Article news;
  const _ImageCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          child: (news.urlToImage != null) 
          ? FadeInImage(
            placeholder: const AssetImage('assets/img/giphy.gif'),
            image: NetworkImage(news.urlToImage!)
          )
          : const Image(image:AssetImage('assets/img/no-image.png'))
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
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(news.title!, style: const TextStyle( fontSize: 20.0, fontWeight: FontWeight.w700)),
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
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: <Widget>[
          Text('${index + 1}. ', style: TextStyle( color: myTheme.colorScheme.secondary )),
          Text('${news.source!.name}.')
        ],
      )
    );
  }
}