import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:newsapp/src/services/news_service.dart';

import 'package:newsapp/src/widgets/list_news.dart';

// Aplicando Keep Alive para que no pierda el estado y se mantenga en la noticia anterior.
class Tab1Page extends StatefulWidget {
  
  const Tab1Page({Key? key}) : super(key: key);

  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    final headlines = Provider.of<NewsService>(context).headlines;
    return (headlines.isEmpty)
      ? const Center( child: CircularProgressIndicator() )
      : Container( 
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: NewsList(news: headlines)
    );
  }

  @override
  bool get wantKeepAlive => true;
}