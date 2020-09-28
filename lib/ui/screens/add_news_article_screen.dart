import 'package:flutter/material.dart';

class AddNewsArticleScreen extends StatefulWidget {
  static const String routeName = 'add-news-article-screen';

  @override
  _AddNewsArticleScreenState createState() => _AddNewsArticleScreenState();
}

class _AddNewsArticleScreenState extends State<AddNewsArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add News Article',
          style: TextStyle(fontSize: kToolbarHeight * 0.4),
        ),
      ),
      body: Center(
        child: Text('Add News Article Screen'),
      ),
    );
  }
}
