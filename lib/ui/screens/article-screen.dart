import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/news.dart';

class ArticleScreen extends StatelessWidget {
  static const String routeName = 'article-screen';

  @override
  Widget build(BuildContext context) {
    final Article article = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            DateFormat('dd MMM yyyy, E').format(article.dateTime),
            style: TextStyle(
              fontSize: kToolbarHeight * 0.25,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ),
      body: Column(
        children: [
          Text(article.title),
          Text(article.content),
        ],
      ),
    );
  }
}
