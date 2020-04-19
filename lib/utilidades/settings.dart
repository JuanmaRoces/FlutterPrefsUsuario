import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsUsuario {
  static final PrefsUsuario _singleton = PrefsUsuario._();
  SharedPreferences _prefs;
  bool _colorSecundario;
  int _sexo;
  String _nombre;
  String _pagina;

  factory PrefsUsuario() {
    return _singleton;
  }

  PrefsUsuario._();

  Future initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
    _colorSecundario = _prefs.getBool('color')??false;
    _sexo = _prefs.getInt('sexo')??3;
    _nombre = _prefs.getString('nombre')??'<desconocido>';
    _pagina = _prefs.getString('pagina')??'home';
  }

  bool get colorSecundario => _colorSecundario;
  int get sexo => _sexo;
  String get nombre => _nombre;
  String get pagina => _pagina;

  set colorSecundario (bool value) {
    _prefs.setBool('color', value);
    _colorSecundario = value;
  }
  set sexo(int value) {
    _prefs.setInt('sexo', value);
    _sexo = value;
  }
  set nombre(String value) {
    _prefs.setString('nombre', value);
    _nombre = value;
  }
  set pagina(String value) {
    _prefs.setString('pagina', value);
    _pagina = value;
  }
  Color getColor(BuildContext context) {
    return this._colorSecundario ?
      Color(Theme.of(context).secondaryHeaderColor.value) :
      Color(Theme.of(context).primaryColor.value);
  }
}