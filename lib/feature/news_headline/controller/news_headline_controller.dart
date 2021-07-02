import 'package:get/get.dart';
import 'package:news_app/core/model/article.dart';
import 'package:news_app/core/repository/news_repo.dart';
import 'package:news_app/core/repository/news_repo_impl.dart';

class NewsHeadlineController extends GetxController {
  late NewsRepo _newsRepo;

  NewsHeadlineController() {
    _newsRepo = Get.find<NewsRepoImpl>();
    loadNewsHeadline();
  }

  RxBool isLoading = false.obs;

  late RxList<Article> articles;

  loadNewsHeadline() async {
    showLoading();
    final result = await _newsRepo.getNewsHeadline();
    hideLoading();

    if (result != null) {
      articles = result.obs;
    } else {
      print("No Data Received");
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  //For readability
  hideLoading() {
    isLoading.toggle();
  }
}
