import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prefs_usuario/pages/home_page.dart';
import 'package:prefs_usuario/pages/settings_page.dart';
import 'package:prefs_usuario/utilidades/settings.dart';

class MenuLateral extends StatelessWidget {
  // const MenuLateral({Key key}) : super(key: key);
  final prefs = PrefsUsuario();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 5.0,
                  offset: Offset.fromDirection(3)
                )
              ],
              // color: Theme.of(context).primaryColorDark,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/original.jpg'),
              )
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(prefs.nombre,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Theme.of(context).textTheme.title.fontSize,
                    ),
                  ),
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage('https://i.pinimg.com/originals/55/c7/7e/55c77ea827eb07667fb5a16683c99b06.jpg'),
                    backgroundColor: Colors.brown,
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.access_time, color: Theme.of(context).primaryColor),
            title: Text('Inicio'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, HomePage.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.people_outline, color: Theme.of(context).primaryColor),
            title: Text('Segunda opción'),
          ),
          ListTile(
            leading: Icon(Icons.computer, color: Theme.of(context).primaryColor),
            title: Text('Tercera opción'),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Theme.of(context).primaryColor),
            title: Text('Ajustes'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, SettingPage.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Theme.of(context).primaryColor),
            title: Text('Salir'),
            // onTap: () => SystemNavigator.pop(),
            onTap: () => SystemChannels.platform.invokeMethod('SystemNavigator.pop')
          )
        ],
      ),
    );
  }
}