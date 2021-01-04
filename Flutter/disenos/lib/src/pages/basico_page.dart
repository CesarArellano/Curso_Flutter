import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);
  final estiloSubtitulo = TextStyle(fontSize: 16.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        _crearImagen(),
        _crearTitulo(),
        _crearAcciones(),
        _crearTexto(),
      ],
    ));
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://lh3.googleusercontent.com/qsm1GPWNVY0D2IADaRmDKkQrOmZeDahaAOjuHcW7iZ8XTTJiFNj5nfSa8-2D4RGewn7av_FpEipYlCMQFoQsGjz3=w640-h400-e365-rj-sc0x00ffffff'),
      fit: BoxFit.cover,
    );
  }

  Widget _crearTitulo() {
    return Container(
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
    );
  }

  Widget _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion(Icons.call, 'CALL'),
        _accion(Icons.near_me, 'ROUTE'),
        _accion(Icons.share, 'SHARE'),
      ],
    );
  }

  Widget _accion(IconData icon, String texto) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 35.0,
        ),
        Text(texto, style: TextStyle(fontSize: 15.0, color: Colors.blue)),
      ],
    );
  }

  Widget _crearTexto() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Text(
        'It has been more than a century since the Ashokan Reservoir was put into service, and more than 30 years since completion of the Cannonsville Reservoir, the last in the series of water infrastructures on the Catskill and Delaware watersheds in upstate New York.',
        textAlign: TextAlign.justify,
      ),
    );
  }
}
