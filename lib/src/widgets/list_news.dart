import 'package:app_news/src/models/news_model.dart';
import 'package:flutter/material.dart';

class ListNews extends StatelessWidget {
  final List<Article> news;
  const ListNews({required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder:(_, int index){
        return Text(news[index].title);
      }
    );
  }
}