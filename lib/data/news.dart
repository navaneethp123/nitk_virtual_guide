import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  List<Article> _articles = [];

  News() {
    FirebaseFirestore.instance
        .collection('news')
        .snapshots()
        .listen((eventsSnapshot) {
      List<Article> articles = [];
      eventsSnapshot.docs.forEach((doc) {
        var data = doc.data();
        articles.add(Article(
          id: doc.id,
          title: data['title'],
          author: data['author'],
          content: data['content'],
          dateTime: DateTime.parse(data['dateTime']),
          imageUrl: data['imageUrl'],
        ));
      });
      _articles = articles;
      notifyListeners();
    });
  }

  int get length => _articles.length;
  List<Article> get articles => [..._articles];

  void addArticle(Article article) {
    article.dateTime = DateTime.now();
    FirebaseFirestore.instance.collection('news').add({
      'title': article.title,
      'author': article.author,
      'content': article.content,
      'imageUrl': article.imageUrl,
      'dateTime': article.dateTime.toIso8601String(),
    });
  }
}
