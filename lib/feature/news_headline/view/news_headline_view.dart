import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/widget/drawer.dart';
import 'package:news_app/feature/news_headline/controller/news_headline_controller.dart';

class NewsHeadlineView extends StatelessWidget {
  const NewsHeadlineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewsHeadlineController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("News Headline"),
      ),
      drawer: getAppDrawer(),
      body: Obx(() {
        if (controller.isLoading.isTrue) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container(
            margin: const EdgeInsets.all(10),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (controller.articles[index].imageUrl == null)
                        Container()
                      else
                        Image.network(controller.articles[index].imageUrl),
                      SizedBox(height: 8),
                      Text(
                        controller.articles[index].title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 4),
                      Text(
                        controller.articles[index].desc,
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: controller.articles.length),
          );
        }
      }),
    );
  }
}
