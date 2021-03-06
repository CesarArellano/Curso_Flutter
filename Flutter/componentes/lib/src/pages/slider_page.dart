import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorslider = 100.0;
  bool _bloquearSlider = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño imagen',
      min: 10.0,
      max: 400.0,
      value: _valorslider,
      onChanged: (_bloquearSlider)
          ? null
          : (valor) {
              setState(() {
                _valorslider = valor;
              });
            },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://static.wikia.nocookie.net/vsbattles/images/4/4c/WiiU_Wind_Waker_Link.png/revision/latest?cb=20151115121618'),
      width: _valorslider,
      fit: BoxFit.contain,
    );
  }

  Widget _checkBox() {
    /*
    return Checkbox(
      value: _bloquearSlider,
      onChanged: (valor) {
        setState(() {
          _bloquearSlider = valor;
        });
      },
    );
    */
    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _bloquearSlider,
      onChanged: (valor) {
        setState(() {
          _bloquearSlider = valor;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      activeColor: Colors.green,
      title: Text('Bloquear slider'),
      value: _bloquearSlider,
      onChanged: (valor) {
        setState(() {
          _bloquearSlider = valor;
        });
      },
    );
  }
}
