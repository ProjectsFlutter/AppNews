import 'package:app_news/src/services/news_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: _ListCategories())
        ],
      ),
    );
  }
}

class _ListCategories extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _categories = Provider.of<NewsService>(context).categories;
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: _categories.length,
      itemBuilder: (_, int i){
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Icon(_categories[i].icon),
              const SizedBox(height: 5.0,),
              Text(_categories[i].name)
            ],
          ),
        );
      }
    );
  }
}