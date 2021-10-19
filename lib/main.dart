import 'dart:io';

import 'package:app_news/src/pages/tabs_page.dart';
import 'package:app_news/src/services/news_services.dart';
import 'package:app_news/src/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main(){
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService())
      ],
      child: MaterialApp(
        title: 'News App',
        theme: myTheme,
        debugShowCheckedModeBanner: false,
        home: const TabsPage()
      ),
    );
  }
}
