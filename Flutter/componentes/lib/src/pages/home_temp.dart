import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final List<String> opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
          //children: _crearItems()
          children: _crearItemsCorta()),
    );
  }

  /*
  List<Widget> _crearItems() {
    List<Widget> lista = new List<Widget>(); // Lista dinámica de Widgets.

    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      lista..add(tempWidget)..add(Divider());
    }

    return lista;
  }
  */
  List<Widget> _crearItemsCorta() {
    var widgets = opciones.map((item) {
      return Column(
        children: [
          ListTile(
              title: Text(item + '!'),
              subtitle: Text('Cualquier cosa'),
              leading:
                  Icon(Icons.account_balance), // Icono al principio de la fila
              trailing:
                  Icon(Icons.keyboard_arrow_right), // Icono al final de la fila
              onTap: () {}),
          Divider(),
        ],
      );
    }).toList(); // Lista dinámica de Widgets.
    return widgets;
  }
}
