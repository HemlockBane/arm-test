import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ArticleService {
  static Future<List<Article>> getArticles() async {
    String baseUrl = "https://newsapi.org/v2/";
    String headlines = "top-headlines";
    String apiKey = "797f5cc8fcaf4f3f90064ee4ab17dfae";

    Map<String, dynamic> parameters = {
      "country": "us",
      'apiKey': apiKey,
      "pageSize": 10
    };

    Uri uri = Uri.https(baseUrl, headlines, parameters);
    print(uri);

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    List<Article> articles = [];

    try {
      final response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data);

        List<Article> articles = [];
        // for (var item in articles)

      }
    } catch (e) {}

    return articles;
  }
}

class Article {
  String title;
  String description;
  String url;

  Article({
    this.title = "",
    this.description = "",
    this.url = "",
  });

  Article.empty() : this();

  factory Article.fromJson(Map<String, dynamic> data) {
    return Article(
      title: data["title"],
      description: data["description"],
      url: data["url"],
    );
  }
}
