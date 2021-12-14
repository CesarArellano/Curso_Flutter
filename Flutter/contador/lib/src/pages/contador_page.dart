import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  const ContadorPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ContadorPageState();
  }
}

class _ContadorPageState extends State<ContadorPage> {
  final TextStyle _estiloTexto = const TextStyle(fontSize: 25);
  int _conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Número de taps:',
              style: _estiloTexto,
            ),
            Text('$_conteo', style: _estiloTexto),
          ],
        ),
      ),
      floatingActionButton: _crearBotones(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(width: 30.0),
        FloatingActionButton(
          child: const Icon(Icons.exposure_zero),
          onPressed: _reset,
        ),
        const Expanded( child: SizedBox() ),
        FloatingActionButton(
          child: const Icon(Icons.remove),
          onPressed: _sustraer,
        ),
        const Expanded( child: SizedBox() ),
        FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: _agregar,
        )
      ],
    );
  }

  void _reset() {
    setState(() {
      _conteo = 0;
    });
  }

  void _agregar() {
    setState(() => _conteo++);
  }

  void _sustraer() {
    setState(() {
      if (_conteo > 0) {
        _conteo--;
      }
    });
  }
}
