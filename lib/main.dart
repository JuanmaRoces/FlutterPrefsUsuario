import 'package:flutter/material.dart';
import 'package:prefs_usuario/pages/home_page.dart';
import 'package:prefs_usuario/pages/settings_page.dart';
import 'package:prefs_usuario/utilidades/settings.dart';

void main() async {

  final prefs = new PrefsUsuario();
  WidgetsFlutterBinding.ensureInitialized();

  await prefs.initPrefs();
  
  print('iniciando');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = new PrefsUsuario();
  // This widget is the rootˇ of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        secondaryHeaderColor: Colors.blue[300],

        // Define the default font family.
        // fontFamily: 'Georgia',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Georgia'),
        ),
      ),
      initialRoute: prefs.pagina,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        SettingPage.routeName: (context) => SettingPage(),
      }
    );
  }
}
