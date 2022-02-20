// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:assgn_digia_tech/models/news_model.dart';
import 'package:http/http.dart' as http;

class BusinessNewsService {
  List<NewsModel> apiBizNews = [];

  Future<void> getBusinessNews() async {
    String apiUrl =
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=4e3474bb91ec49eda31b75e2daf6da3c';

    var response = await http.get(Uri.parse(apiUrl));

    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          NewsModel article = NewsModel(
            title: element['title'] ?? "",
            description: element['description'] ?? "",
            urlToImage: element['urlToImage'] ?? "",
            content: element["content"] ?? "",
          );
          apiBizNews.add(article);
        }
      });
    }
  }
}
