import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

getAppDrawer() {
  return Drawer(
    child: ListView(
      children: [
        ListTile(
          title: Text("News Headlines"),
          onTap: () {
            Get.toNamed("/news_headline");
          },
          leading: Icon(Icons.menu_book_outlined),
        ),
        ListTile(
          title: Text("Search News"),
          onTap: () {
            Get.toNamed("/search_news");
          },
          leading: Icon(Icons.search),
        )
      ],
    ),
  );
}
