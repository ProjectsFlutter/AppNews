import 'package:app_news/src/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const urlNews   = "https://newsapi.org/v2";
const apiKey    = "c9ad3355a18644ef9a1c04d5dee4d998";
const country   = "mx";

class NewsService with ChangeNotifier{
  List<Article> headlines = [];
  NewsService(){
    getTopHeadlines();
  }
  getTopHeadlines()async{
    const url = "$urlNews/top-headlines?apiKey=$apiKey&country=$country";
    final resp = await http.get(Uri.parse(url));
    final newsResponse = NewsResponse.fromJson(resp.body);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  } 
}