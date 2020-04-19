import 'package:flutter/material.dart';
import 'package:prefs_usuario/utilidades/settings.dart';
import 'package:prefs_usuario/widgets/menu_lateral.dart';

class HomePage extends StatelessWidget {
  // const HomePage({Key key}) : super(key: key);
  static final String routeName = 'home';
  final pref = PrefsUsuario();

  @override
  Widget build(BuildContext context) {
    pref.pagina = routeName;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pref.getColor(context),
        title: Text('Preferencias'),
      ),
      drawer: MenuLateral(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario ${pref.colorSecundario}'),
          Divider(),
          Text('Género ${pref.sexo}'),
          Divider(),
          Text('Nombre de usuario ${pref.nombre}'),
          Divider(),
        ],
      ),
    );
  }
}
