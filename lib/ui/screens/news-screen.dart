import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../data/news.dart';

import './add_news_article_screen.dart';
import './article-screen.dart';
import '../widgets/custom-drawer.dart';
import '../widgets/info-tile.dart';

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
          return InfoTile(
            title: articles[index].title,
            subtitle: articles[index].author,
            leading: CircleAvatar(
              child: articles[index].imageUrl?.isNotEmpty ?? false
                  ? Image.network(articles[index].imageUrl)
                  : Text(articles[index].title[0]),
            ),
            trailing: Text(DateFormat.MMMd().format(articles[index].dateTime)),
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
