import 'dart:convert';
import 'package:newsapp/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];
  Future<void> getName() async {
    String url =
        "newsapi.org/v2/everything?q=tesla&from=2024-04-30&sortBy=publishedAt&apiKey=7a895e9c46424dffa6b35bdbdd92f824";
    var response = await http.get(url as Uri);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element['author'],
              description: element['"description'],
              url: element['url'],
              urlTOImage: element['urlToImage'],
              publishAt: element['"publishedAt'],
              content: element['content']);

          news.add(articleModel);
        }
      });
    }
  }
}
class CategoriesNews {
  List<ArticleModel> news = [];
  Future<void> getName(String category ) async {
    String url ="https://newsapi.org/v2/top-headlines?country=de&category=$category&apiKey=7a895e9c46424dffa6b35bdbdd92f824";
    var response = await http.get(url as Uri);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element['author'],
              description: element['"description'],
              url: element['url'],
              urlTOImage: element['urlToImage'],
              publishAt: element['"publishedAt'],
              content: element['content']);

          news.add(articleModel);
        }
      });
    }
  }
}
