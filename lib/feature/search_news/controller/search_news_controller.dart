import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/model/article.dart';
import 'package:news_app/core/repository/news_repo.dart';
import 'package:news_app/core/repository/news_repo_impl.dart';

class SearchNewsController extends GetxController{
  late NewsRepo _newsRepo;

  SearchNewsController(){
    _newsRepo = Get.find<NewsRepoImpl>();
    
    searchTextController.addListener(() { 
      if(searchTextController.text.length%3==0 && searchTextController.text.length!=0){
        searchNewsHeadline();
      }
    });
  }
  
  final searchTextController = TextEditingController();

  RxBool isLoading = false.obs;

  RxList<Article> articles = RxList();

  searchNewsHeadline() async{

    showLoading();

    final result = await _newsRepo.getSearchedNews(searchTextController.text);

    hideLoading();

    // ignore: unnecessary_null_comparison
    if(result!= null){
      articles = result.obs;
    }else{
      print("No data recieved");
    }
  }

  showLoading(){
    isLoading.toggle();
  }

  hideLoading(){
    isLoading.toggle();
  }
}
