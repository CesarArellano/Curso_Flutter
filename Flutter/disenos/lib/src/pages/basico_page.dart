import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);
  final estiloSubtitulo = TextStyle(fontSize: 16.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Image(
          image: NetworkImage(
              'https://lh3.googleusercontent.com/qsm1GPWNVY0D2IADaRmDKkQrOmZeDahaAOjuHcW7iZ8XTTJiFNj5nfSa8-2D4RGewn7av_FpEipYlCMQFoQsGjz3=w640-h400-e365-rj-sc0x00ffffff'),
          fit: BoxFit.cover,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Paisaje Lago', style: estiloTitulo),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text('Un lago que se encuentra en Alemania',
                        style: estiloSubtitulo),
                  ],
                ),
              ),
              Icon(Icons.star, color: Colors.red, size: 30.0),
              Text('41', style: TextStyle(fontSize: 20.0)),
            ],
          ),
        ),
      ],
    ));
  }
}
