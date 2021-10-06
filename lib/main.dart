import 'package:app_news/src/pages/tabs_page.dart';
import 'package:app_news/src/themes/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      home: const TabsPage()
    );
  }
}