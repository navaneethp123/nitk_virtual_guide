import 'package:flutter/material.dart';

class Article {
  String id;
  String title;
  String author;
  DateTime dateTime;
  String imageUrl;
  String content;

  Article({
    this.id,
    this.title,
    this.author,
    this.dateTime,
    this.imageUrl,
    this.content,
  });
}

class News with ChangeNotifier {
  final _articles = [];

  News() {
    _articles.add(Article(
      id: '1',
      title: 'Some title',
      author: 'me',
      dateTime: DateTime.now(),
      imageUrl: null,
      content: 'Some content a;dfiejdjfasijdfsdkfjasoijs;df;ewjf',
    ));

    _articles.add(Article(
      id: '2',
      title: 'Some title 2',
      author: 'me',
      dateTime: DateTime.now(),
      imageUrl: null,
      content: 'Some content a;dfiejdjfasijdfsdkfjasoijs;df;ewjf',
    ));
  }

  int get length => _articles.length;
  List<Article> get articles => [..._articles];

  void addArticle(Article article) {
    article.dateTime = DateTime.now();
    article.id = article.dateTime.toIso8601String();
    _articles.add(article);
    notifyListeners();
  }
}
