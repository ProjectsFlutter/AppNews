import 'package:app_news/src/services/news_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _newsService = Provider.of<NewsService>(context);
    
    return const Scaffold(
      body: Center(
        child: Text('Page1'),
      ),
    );
  }
}