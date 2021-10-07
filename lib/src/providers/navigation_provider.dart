import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier{
  int _paginaActual = 0;

  int get paginaActual => this._paginaActual;
  set paginaActual(int valor){
    this._paginaActual = valor;
    notifyListeners();
  }
}