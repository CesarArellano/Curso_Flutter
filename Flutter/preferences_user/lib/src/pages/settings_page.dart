import 'package:flutter/material.dart';
import 'package:preferences_user/src/share_prefs/user_preferences.dart';
import 'package:preferences_user/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final prefs = new UserPreferences();
  bool? _colorSecundario;
  int? _genero;

  TextEditingController? _inputNameController;

  @override
  void initState() {
    super.initState();
    prefs.ultimaPagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _inputNameController = new TextEditingController(text: prefs.nombreUsuario);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajustes"),
        backgroundColor: prefs.colorSecundario ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10.0),
            child: Text("Settings", style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold))
          ),
          Divider(thickness: 1.0),
          SwitchListTile(
            value: _colorSecundario!,
            title: Text("Color secundario"),
            onChanged: (value) {              
              setState(() {
                prefs.colorSecundario = value;
                _colorSecundario = value;
              });
            }
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _inputNameController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el teléfono',
              ),
              onChanged: (value) {
                prefs.nombreUsuario = value;
              },

            ),
          )
        ],
      )
    );
  }

  _setSelectedRadio(int? valor) async {
    _genero = valor;
    prefs.genero = valor ?? 0;
    setState(() {});
  }
}