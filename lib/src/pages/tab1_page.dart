import 'package:app_news/src/services/news_services.dart';
import 'package:app_news/src/widgets/list_news.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
   const Tab1Page({Key? key}) : super(key: key);

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    final _newsService = Provider.of<NewsService>(context);
    
    return Scaffold(
      body: (_newsService.headlines.isEmpty) 
      ? Container(
        alignment: Alignment.center,
        child: const CircularProgressIndicator()
      ) 
      : ListNews(news: _newsService.headlines)
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}