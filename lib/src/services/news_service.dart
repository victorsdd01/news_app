
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app/src/ui/pages.dart';

enum BasePaths{
  headlines("top-headlines"),
  everything("everything");

  final String path;
  const BasePaths(this.path);

}

class NewsService extends ChangeNotifier{

  final Dio dio = Dio();
  final String _apiKey = "45119af68cf94b10807dd88e2ae04430";
  final baseUrl = "https://newsapi.org/v2/";
  bool _isLoading = false;
  List<Articles> headlines = [];
  List<Articles> headlinesFilteredByQuery = [];
  bool get isLoading => _isLoading;

  NewsService(){
    getHeadlinesNews();
  }

  Future<List<Articles>> getHeadlinesNews() async {
    try {
      _isLoading = true;
      final response = await dio.get("$baseUrl${BasePaths.headlines.path}",queryParameters:{
        "country": 'us',
        "apiKey": _apiKey,
      });
      final News news = News.fromMap(response.data);
      headlines.addAll(news.articles);
      _isLoading = false;
      notifyListeners();
      return headlines;
    } on DioError catch(e){
      final ErrorResponse error = ErrorResponse.fromMap(e.response!.data);
      if (kDebugMode) {
        print("‼️${error.message}");
      }
      return [];
    }
  }

  Future<List<Articles>> filterByCategory(String category) async {
    try {
      headlines = [];
      _isLoading = true;
      final response = await dio.get("$baseUrl${BasePaths.headlines.path}", queryParameters:{
        "country": 'us',
        "apiKey": _apiKey,
        "category": category,
      });
      final News news = News.fromMap(response.data);
      headlines.addAll(news.articles);
      _isLoading = false;
      notifyListeners();
      return headlines;
    } on DioError catch (e) {
      final ErrorResponse error = ErrorResponse.fromMap(e.response!.data);
      if (kDebugMode) {
        print("‼️${error.message}");
      }
      return [];
    }
  }

  Future<List<Articles>> filterByQuery(String query) async {
    try {
      _isLoading = true;
      final response =  await dio.get("$baseUrl${BasePaths.headlines.path}", queryParameters: {
        "country": "us",
        "apiKey": _apiKey,
        "q": query,
      });
      final News news = News.fromMap(response.data);
      headlinesFilteredByQuery.addAll(news.articles);
      _isLoading = false;
      notifyListeners();
      return headlines;
    } on DioError catch (e) {
      final ErrorResponse error = ErrorResponse.fromMap(e.response!.data);
      if (kDebugMode) {
        print("‼️${error.message}");
      }
      return [];
    }
  }


}