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
    final notificationProvider = Provider.of<NavigationProvider>(context);
    return BottomNavigationBar(
      currentIndex: notificationProvider.paginaActual,
      onTap: (i) => notificationProvider.paginaActual = i,
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
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(color: Colors.red),
        Container(color: Colors.green)
      ],
    );
  }
}