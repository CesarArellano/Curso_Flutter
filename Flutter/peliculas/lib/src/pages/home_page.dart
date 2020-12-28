import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

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
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      width: double.infinity,
      height: 200.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            "http://via.placeholder.com/650x300",
            fit: BoxFit.fill,
          );
        },
        itemCount: 3,
        layout: SwiperLayout.STACK,
        itemWidth: 200.0,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }
}
