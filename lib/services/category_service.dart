// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:assgn_digia_tech/models/category_model.dart';
import 'package:http/http.dart' as http;

class categoryService {
  List<CategoryModel> apiNews2 = [];

  Future<void> getCategoryNews() async {
    String apiUrl2 =
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=4e3474bb91ec49eda31b75e2daf6da3c';

    var response = await http.get(Uri.parse(apiUrl2));

    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          CategoryModel article = CategoryModel(
            categoryName: element['title'] ?? "",
          );
          apiNews2.add(article);
        }
      });
    }
  }
}
