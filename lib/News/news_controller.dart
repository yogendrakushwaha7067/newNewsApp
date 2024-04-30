import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../const_string.dart';
import 'news_model.dart';

class NewsController extends GetxController{
  var newsModel=NewsModel().obs;
  var isLoading = true.obs;
  var  listFav=<Articles?>[].obs;
  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }
  void fetchNews() async {
    try {
      isLoading(true);
      var response = await http.get(
          Uri.parse('https://newsapi.org/v2/everything?q=tesla&sortBy=publishedAt&apiKey=8aa8f4f91bb5414cbe669cd59f08092a'));

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        newsModel.value=NewsModel.fromJson(jsonResponse);

      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (error) {
      print('Request failed with error: $error.');
    } finally {
      isLoading(false);
    }
  }
  addToFavorites(int index){
    listFav.add(newsModel.value.articles?[index]);
  }

}