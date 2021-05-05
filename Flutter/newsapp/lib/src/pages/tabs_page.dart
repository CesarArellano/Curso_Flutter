import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Pages(),
      bottomNavigationBar: NavigationBar(),
    );
  }
}

class _Pages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return PageView(
      //physics: BouncingScrollPhysics()
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          color: Colors.red
        ),
        Container(
          color: Colors.green
        ),
      ]
    );
  }
}

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon( Icons.person_outline ),
          label: 'Para ti'
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.public ),
          label: 'Encabezados'
        ),
      ],
    );
  }
}