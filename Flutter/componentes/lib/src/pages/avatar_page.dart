import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://avatars0.githubusercontent.com/u/38898501?s=460&u=3679284f108daa3e7c15d27dfe3a935e53cf920b&v=4'),
          ),
          SizedBox(
            width: 10.0,
          ),
          CircleAvatar(
            child: Text("CA"),
            backgroundColor: Colors.brown,
          ),
          SizedBox(
            width: 10.0,
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://media.redadn.es/imagenes/the-legend-of-zelda-the-wind-waker-gamecube_118664.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 100),
          height: 300.0,
        ),
      ),
    );
  }
}
