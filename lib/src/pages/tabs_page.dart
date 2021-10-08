import 'package:app_news/src/pages/tab1_page.dart';
import 'package:app_news/src/pages/tab2_page.dart';
import 'package:app_news/src/providers/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _navigationProvider = Provider.of<NavigationProvider>(context);
    return BottomNavigationBar(
      currentIndex: _navigationProvider.paginaActual,
      onTap: (i) => _navigationProvider.paginaActual = i,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.access_alarm),label: "Title 1" ),
        BottomNavigationBarItem(icon: Icon(Icons.public),label: "Title 2" ),
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _navigationProvider = Provider.of<NavigationProvider>(context);
    return PageView(
      controller: _navigationProvider.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        Tab1Page(),
        Tab2Page()
      ],
    );
  }
}