import 'package:flutter/material.dart';

import 'package:peliculas/src/widgetsPersonalizados/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
          child: Column(
        children: [
          _swipeTarjetas(),
        ],
      )),
    );
  }

  Widget _swipeTarjetas() {
    return CardSwiper(
      peliculas: [1, 2, 3, 4, 5],
    );
  }
}
