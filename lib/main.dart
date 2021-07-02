import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:news_app/feature/news_headline/binding/news_headline_binding.dart';
import 'package:news_app/feature/news_headline/view/news_headline_view.dart';
import 'package:news_app/feature/search_news/binding/search_news_binding.dart';
import 'package:news_app/feature/search_news/view/search_news_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      getPages: [
        GetPage(
            name: "/news_headline",
            page: () => NewsHeadlineView(),
            binding: NewsHeadlineBinding()),
        GetPage(
            name: "/search_news",
            page: () => SearchNewsView(),
            binding: SearchNewsBinding())
      ],
      initialRoute: "/news_headline",
    );
  }
}
