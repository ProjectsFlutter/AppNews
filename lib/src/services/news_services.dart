import 'package:app_news/src/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const _URL_NEWS = "https://newsapi.org/v2";
const _API_KEY  = "c9ad3355a18644ef9a1c04d5dee4d998";
const _COUNTRY  = "mx";

class NewsService with ChangeNotifier{
  List<Article> headlines = [];
  NewsService(){
    getTopHeadlines();
  }
  getTopHeadlines()async{
    const url = "$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=$_COUNTRY";
    final resp = await http.get(Uri.parse(url));
    final newsResponse = NewsResponse.fromJson(resp.body);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  } 
}