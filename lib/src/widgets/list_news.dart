import 'package:app_news/src/models/news_model.dart';
import 'package:app_news/src/themes/theme.dart';
import 'package:flutter/material.dart';

class ListNews extends StatelessWidget {
  final List<Article> news;
  const ListNews({required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder:(_, int i){
        return _News(news: news[i], index:i);
      }
    );
  }
}

class _News extends StatelessWidget {
  final Article news;
  final int index;

  const _News({ required this.news, required this.index });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TargetTopBar(news, index),
        _TargetTitle(news),
        _TargetImage(url: news.url),

      ],
    );
  }
}

class _TargetImage extends StatelessWidget {
  final String url;

  const _TargetImage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Text(url);
  }
}

class _TargetTitle extends StatelessWidget {
  final Article news;
  const _TargetTitle(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(news.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
    );
  }
}

class _TargetTopBar extends StatelessWidget {
  final Article news;
  final int index;
  const _TargetTopBar(this.news, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin:  const EdgeInsets.only(bottom: 5.0),
      child: Row(
        children: [
          Text('${index + 1}', style: TextStyle(color: myTheme.primaryColor)),
          const SizedBox(width: 20.0),
          Text('${news.source.name}.')
        ],
      ),
    );
  }
}