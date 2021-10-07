import 'package:app_news/src/models/news_model.dart';
import 'package:flutter/material.dart';

class NewsService with ChangeNotifier{
  List<Article> headLines = [];
  NewsService(){
    getTopHeadLines();
  }
  getTopHeadLines(){
    print("Cargando...");
  } 
}