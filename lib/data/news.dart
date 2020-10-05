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
      title:
          'NITK Surathkal has been ranked 4th globally in the list of Universities',
      author: 'NITK Admin',
      dateTime: DateTime(2020, 9, 5),
      imageUrl: 'https://www.nitk.ac.in/design-system/campus-images/beach1.jpg',
      content:
          'NITK Surathkal has been ranked fourth globally in the list of universities with the most accepted students for  Google Summer of Code (GSoC) 2020.\n\nGSoC is a global program organized by Google Open Source team with an aim to introduce students to open source software development. As many 23 students got accepted from NIT-K Surathkal in GSoC 2020. A total of 1198 students from 550 Universities globally are participating in GSoC 2020. Out of 1198 students accepted, 114 candidates are participating for the first time in GSoC.\n\nOver the past three years, there has been a voluntary and organized effort led by Mohit P Tahiliani, department of computer science and engineering and interested students from various departments of NIT-K, Surathkal to structurally plan out Open Source activities in the Institute. The first batch which was a part of the effort resulted in seven selections in GSoC and the number has only increased in the past two years, thereby showing the growth of NIT-K, Surathkal in the field of Open Source Contributions.NITK Surathkal has ranked fourth globally in the list of universities with the most accepted students for Google Summer of Code (GSoC) 2020.',
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
