import 'package:flutter/material.dart';
import 'package:nitk_virtual_guide/ui/screens/article-screen.dart';
import 'package:provider/provider.dart';

import '../../data/news.dart';

import '../widgets/custom-text-form-field.dart';

class AddNewsArticleScreen extends StatefulWidget {
  static const String routeName = 'add-news-article-screen';

  @override
  _AddNewsArticleScreenState createState() => _AddNewsArticleScreenState();
}

class _AddNewsArticleScreenState extends State<AddNewsArticleScreen> {
  final _form = GlobalKey<FormState>();

  String _title;
  String _author;
  String _imageUrl;
  String _content;

  Article get _article => Article(
        title: _title,
        author: _author,
        content: _content,
        imageUrl: _imageUrl.isEmpty ? null : _imageUrl,
        dateTime: DateTime.now(),
      );

  bool get _validateAndSave {
    if (!_form.currentState.validate()) return false;
    _form.currentState.save();
    return true;
  }

  void _preview(BuildContext context) {
    if (!_validateAndSave) return;
    Navigator.of(context)
        .pushNamed(ArticleScreen.routeName, arguments: _article);
  }

  void _addArticle(BuildContext context) {
    if (!_validateAndSave) return;

    Provider.of<News>(context, listen: false).addArticle(_article);
    Navigator.of(context).pop();
  }

  String _defaultValidator(String field, String value) {
    if (value.isEmpty) return '$field cannot be empty';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add News Article',
          style: TextStyle(fontSize: kToolbarHeight * 0.4),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.visibility),
            onPressed: () => _preview(context),
          ),
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () => _addArticle(context),
          ),
        ],
      ),
      body: Form(
        key: _form,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                CustomTextFormField(
                  label: 'Title',
                  onSaved: (newValue) => _title = newValue,
                  validator: (value) => _defaultValidator('Title', value),
                ),
                CustomTextFormField(
                  label: 'Author',
                  onSaved: (newValue) => _author = newValue,
                  validator: (value) => _defaultValidator('Author', value),
                ),
                CustomTextFormField(
                  label: 'Image URL',
                  onSaved: (newValue) => _imageUrl = newValue,
                ),
                CustomTextFormField(
                  label: 'Content',
                  onSaved: (newValue) => _content = newValue,
                  validator: (value) {
                    if (value.length < 50)
                      return 'Content of the article should be atleast 50 characters';
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
