import 'package:get/get_core/src/get_main.dart';
import 'package:news_app/core/model/article.dart';
import 'package:news_app/core/model/news_response_model.dart';
import 'package:news_app/core/repository/news_repo.dart';
import 'package:news_app/service/http_service.dart';
import 'package:news_app/service/http_service_impl.dart';
import 'package:get/get.dart';

class NewsRepoImpl implements NewsRepo {
  late HttpService _httpService;

  NewsRepoImpl() {
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }
  @override
  Future<List<Article>> getNewsHeadline() async {
    try {
      final response =
          await _httpService.getRequest("/v2/top-headlines?country=in");
      final parsedResponse = NewsResponse.fromJson(response.data);
      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e);
      throw UnimplementedError();
    }
  }

  @override
  Future<List<Article>> getSearchedNews(String query) async {
    try {
      final response = await _httpService.getRequest("/v2/everything?q=$query");
      final parsedResponse = NewsResponse.fromJson(response.data);
      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e);
      throw UnimplementedError();
    }
  }
}
