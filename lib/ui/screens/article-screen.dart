import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/news.dart';

class ArticleScreen extends StatelessWidget {
  static const String routeName = 'article-screen';

  @override
  Widget build(BuildContext context) {
    final Article article = ModalRoute.of(context).settings.arguments;
    final theme = Theme.of(context);
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title,
                style: theme.textTheme.headline5
                    .copyWith(fontFamily: 'SecularOne'),
              ),
              Text(
                ': ${article.author}',
                style: theme.textTheme.subtitle1.copyWith(
                  fontFamily: 'SecularOne',
                  color: Colors.black54,
                ),
              ),
              if (article.imageUrl != null) ...[
                SizedBox(height: 15),
                Image.network(article.imageUrl)
              ],
              SizedBox(height: 15),
              MarkdownBody(
                data: article.content,
                onTapLink: (url) => launch(url),
                selectable: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
