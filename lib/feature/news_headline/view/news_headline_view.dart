import 'package:flutter/material.dart';
import 'package:news_app/core/widget/drawer.dart';

class NewsHeadlineView extends StatelessWidget {
  const NewsHeadlineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Headline"),
      ),
      body: Container(),
      drawer: getAppDrawer(),
    );
  }
}
