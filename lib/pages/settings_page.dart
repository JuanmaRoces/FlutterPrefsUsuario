import 'package:flutter/material.dart';
import 'package:prefs_usuario/utilidades/settings.dart';
import 'package:prefs_usuario/widgets/menu_lateral.dart';

class SettingPage extends StatefulWidget {
  // const HomePage({Key key}) : super(key: key);
  static final String routeName = 'settings';

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  PrefsUsuario prefs = PrefsUsuario();
  TextEditingController _ctrl = TextEditingController();

  @override
  void initState() { 
    super.initState();
    _ctrl.value = TextEditingValue(text: prefs.nombre);
  }

  @override
  Widget build(BuildContext context) {
    prefs.pagina = 'settings';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: prefs.getColor(context),
        title: Text('Ajustes'),
      ),
      drawer: MenuLateral(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Settings',
              style: TextStyle(
                fontSize: 40.0, 
                fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          SwitchListTile(
            value: prefs.colorSecundario,
            onChanged: (bool valor) {
              setState(() {
                // _colorSecundario = !_colorSecundario;
                prefs.colorSecundario = !prefs.colorSecundario;
              });
            },
            title: Text('Color secundario'),
          ),
          Divider(),
          RadioListTile(
            title: Text('Masculino'),
            value: 1, 
            groupValue: prefs.sexo, 
            onChanged: (int valor) {
              setState(() {
                prefs.sexo=valor;
              });
            },
          ),
          RadioListTile(
            title: Text('Femenino'),
            value: 2, 
            groupValue: prefs.sexo, 
            onChanged: (int valor) {
              setState(() {
                prefs.sexo=valor;
              });
            },
          ),
          RadioListTile(
            title: Text('Neutro'),
            value: 3, 
            groupValue: prefs.sexo, 
            onChanged: (int valor) {
              setState(() {
                prefs.sexo=valor;
              });
            },
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _ctrl,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                labelText: 'Nombre de la persona',
                helperText: 'Introduzca el nombre completo del propietario de la licencia'
              ),
              onChanged: (String value) {
                prefs.nombre = value;
              },
            )
          )
        ],
      ),
    );
  }
}
