import 'package:app_news/src/services/news_services.dart';
import 'package:app_news/src/widgets/list_news.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  const Tab1Page({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _newsService = Provider.of<NewsService>(context);
    
    return Scaffold(
      body: ListNews(news: _newsService.headlines)
    );
  }
}