import 'package:app_news/src/models/category_model.dart';
import 'package:app_news/src/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

const urlNews   = "https://newsapi.org/v2";
const apiKey    = "c9ad3355a18644ef9a1c04d5dee4d998";
const country   = "mx";

class NewsService with ChangeNotifier{
  List<Article> headlines = [];
  Map<String, List<Article>> categoryArticle = {};
  String _selectedCategory = "business";

  List<Category> categories = [
    Category(FontAwesomeIcons.building, "business"),
    Category(FontAwesomeIcons.tv, "entertainment"),
    Category(FontAwesomeIcons.addressCard, "general"),
    Category(FontAwesomeIcons.headSideVirus, "health"),
    Category(FontAwesomeIcons.vials, "science"),
    Category(FontAwesomeIcons.volleyballBall, "sports"),
    Category(FontAwesomeIcons.memory, "technology"),
  ];
   
  NewsService(){
    getTopHeadlines();
    for (var category in categories) {
      categoryArticle[category.name] = [];
    }
  }

  String get selectedCategory => _selectedCategory;
  set selectedCategory(String category){
    _selectedCategory = category; 
    getArticlesByCategory(category);
    notifyListeners();
  }

  getTopHeadlines()async{
    const url = "$urlNews/top-headlines?apiKey=$apiKey&country=$country";
    final resp = await http.get(Uri.parse(url));
    final newsResponse = NewsResponse.fromJson(resp.body);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  } 

  getArticlesByCategory(String category)async{
    if (categoryArticle[category]!.isNotEmpty) return categoryArticle[category];
    final url = "$urlNews/top-headlines?apiKey=$apiKey&country=$country&category=$category";
    final resp = await http.get(Uri.parse(url));
    final newsResponse = NewsResponse.fromJson(resp.body);
    categoryArticle[category]!.addAll(newsResponse.articles);
    notifyListeners();
  } 
}