import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../data/news.dart';

import 'add-news-article-screen.dart';
import './article-screen.dart';
import '../widgets/custom-drawer.dart';

class NewsScreen extends StatefulWidget {
  static const String routeName = 'news-screen';

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    final articles = Provider.of<News>(context).articles;

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
      body: ListView.builder(
        itemCount: Provider.of<News>(context).length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              articles[index].title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle:
                Text(DateFormat.yMMMMd().format(articles[index].dateTime)),
            leading: articles[index].imageUrl == null
                ? CircleAvatar(
                    child: Text(articles[index].title[0]),
                  )
                : CircleAvatar(
                    backgroundImage: NetworkImage(articles[index].imageUrl),
                  ),
            onTap: () => Navigator.of(context).pushNamed(
              ArticleScreen.routeName,
              arguments: articles[index],
            ),
          );
        },
      ),
    );
  }
}
