import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier{
  int _paginaActual = 0;
  final PageController _pageController = PageController();

  int get paginaActual => _paginaActual;
  PageController get pageController => _pageController;

  set paginaActual(int valor){
    _paginaActual = valor;
    _pageController.animateToPage(valor, duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }
}