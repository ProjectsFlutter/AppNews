import 'package:app_news/src/models/category_model.dart';
import 'package:app_news/src/services/news_services.dart';
import 'package:app_news/src/widgets/list_news.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _serviceProvider = Provider.of<NewsService>(context);
    return Scaffold(
      body: Column(
        children: [
          _ListCategories(),
          Expanded(
            child: ListNews(news: _serviceProvider.getCategoryArticleSelected)
          )
        ],
      ),
    );
  }
}

class _ListCategories extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _categories = Provider.of<NewsService>(context).categories;
    return SizedBox(
      height: 80.0,
      width: double.infinity,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (_, int i){
          final nameCategory = _categories[i].name;
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                _CategoruButton(_categories[i]),
                const SizedBox(height: 5.0,),
                Text("${nameCategory[0].toUpperCase()}${nameCategory.substring(1)}")
              ],
            ),
          );
        }
      ),
    );
  }
}

class _CategoruButton extends StatelessWidget {
  final Category _category;
  const _CategoruButton(this._category);

  @override
  Widget build(BuildContext context) {
    final _serviceProvider = Provider.of<NewsService>(context, listen: false);

    return GestureDetector(
      onTap: (){
         _serviceProvider.selectedCategory = _category.name;
      },
      child: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: (_serviceProvider.selectedCategory == _category.name) ? Colors.red : Colors.white
        ),
        child: Icon(_category.icon, color: Colors.black)
      ),
    );
  }
}