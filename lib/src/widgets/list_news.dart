import 'package:app_news/src/models/news_model.dart';
import 'package:app_news/src/themes/theme.dart';
import 'package:flutter/material.dart';

class ListNews extends StatelessWidget {
  final List<Article>? news;
  const ListNews({required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news!.length,
      itemBuilder:(_, int i){
        return _News(news: news![i], index:i);
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
        _TargetImage(url: news.urlToImage),
        _TargetBody(news),
        _TargetBottons(),
        const SizedBox(height: 10.0),
        const Divider()



      ],
    );
  }
}

class _TargetBottons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RawMaterialButton(
          onPressed:(){},
          fillColor: Colors.red,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: const Icon(Icons.star_border),
        ),
        const SizedBox(width: 10.0,),
        RawMaterialButton(
          onPressed:(){},
          fillColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: const Icon(Icons.animation_sharp),
        )
      ],
    );
  }
}

class _TargetBody extends StatelessWidget {
  final Article news;
  const _TargetBody(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text((news.description != null) ? news.description! : ''),
    );
  }
}

class _TargetImage extends StatelessWidget {
  final String? url;
  const _TargetImage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(50.0), bottomRight: Radius.circular(50.0)),
        child: Container(
          child: (url != null) ? FadeInImage(
            placeholder: const AssetImage('assets/giphy.gif'),
            image: NetworkImage(url!),
          ): const Image(image: AssetImage('assets/no-image.png')),
        ),
      ),
    );
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