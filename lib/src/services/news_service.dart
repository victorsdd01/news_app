
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app/src/ui/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum BasePaths{
  headlines("top-headlines"),
  everything("everything"),
  sources("sources"),
  baseUrl("https://newsapi.org/v2/"),
  apiKey("e23877faa1694146aae5079d3ca7f399");
  final String path;
  const BasePaths(this.path);
}
class NewsService extends ChangeNotifier{

  final Dio dio = Dio();
  SharedPreferences sharedPreferences;
  bool _isLoading = false;
  List<Articles> headlines = [];
  List<Articles> headlinesFilteredByQuery = [];
  List<Sources> everythingNewsList = [];
  String country;
  String _selectedCountry = "";

  // getters
  bool get isLoading => _isLoading;
  String get selectedCountry => _selectedCountry; 

  //setters
    set setSelectedCountry(String value) {
    _selectedCountry = value;
    sharedPreferences.setString("selectedCountry", value);
    notifyListeners();
  }

  NewsService({ required this.country, required this.sharedPreferences}){
    setSelectedCountry = country;
    getHeadlinesNews();
    everythingNews();
  }

  Future<List<Articles>> getHeadlinesNews() async {
    try {
      _isLoading = true;
      final response = await dio.get("${BasePaths.baseUrl.path}${BasePaths.headlines.path}",
        queryParameters:{
            "country": selectedCountry,
            "apiKey": BasePaths.apiKey.path,
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
      final response = await dio.get("${BasePaths.baseUrl.path}${BasePaths.headlines.path}", queryParameters:{
        "country": selectedCountry,
        "apiKey": BasePaths.apiKey.path,
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

  Future<List<Articles>> filterByQuery(String query, String? category) async {
    try {
      _isLoading = true;
      final response =  await dio.get("${BasePaths.baseUrl.path}${BasePaths.headlines.path}", queryParameters: {
        "country": selectedCountry,
        "apiKey": BasePaths.apiKey.path,
        "category": category ?? "",
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

  Future<List<Articles>> getNewsByCountry(String country) async {
    try {
      headlines = [];
      _isLoading = true;
      final response = await dio.get("${BasePaths.baseUrl.path}${BasePaths.headlines.path}",
        queryParameters:{
            "country": country,
            "apiKey": BasePaths.apiKey.path,
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

  Future<List<Sources>> everythingNews() async {
    try {
      _isLoading = true;
      final response = await dio.get("${BasePaths.baseUrl.path}${BasePaths.headlines.path}/${BasePaths.sources.path}",
        queryParameters:{
            "apiKey": BasePaths.apiKey.path,
        });
      final EverythingNews news = EverythingNews.fromMap(response.data);
      everythingNewsList =  news.sources;
      _isLoading = false;
      notifyListeners();
      return everythingNewsList;
    } on DioError catch(e){
      final ErrorResponse error = ErrorResponse.fromMap(e.response!.data);
      if (kDebugMode) {
        print("‼️${error.message}");
      }
      return [];
    }
  }


}