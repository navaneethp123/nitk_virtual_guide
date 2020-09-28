import 'package:flutter/material.dart';

import './add_news_article_screen.dart';
import '../widgets/custom-drawer.dart';

class NewsScreen extends StatefulWidget {
  static const String routeName = 'news-screen';

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('News'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>
                Navigator.of(context).pushNamed(AddNewsArticleScreen.routeName),
          ),
        ],
      ),
      body: Center(
        child: Text('News Screen'),
      ),
    );
  }
}
