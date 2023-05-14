
import 'package:dio/dio.dart';
import 'package:news_app/src/ui/pages.dart';

class NewsService extends ChangeNotifier{

  final Dio dio = Dio();
  final String _apiKey = "9295603cfbd8479c9eb76561691a9055"; 
  bool _isLoading = false;
  List<Articles> headlines = [];

  bool get isLoading => _isLoading;

  NewsService(){
    getHeadlinesNews();
  }

  Future<List<Articles>> getHeadlinesNews() async {
    //GET TOP HEADLINES NEWS.... DEFAULT COUNTRY IS US BUT WE CAN CHANGE IT
    try {
      _isLoading = true;
      final response = await dio.get("https://newsapi.org/v2/top-headlines",queryParameters:{
        "country": 'us',
        "apiKey": _apiKey,
      });
      final News news = News.fromMap(response.data);
      headlines.addAll(news.articles);
      _isLoading = false;
      notifyListeners();
      return headlines;
    } on DioError catch(e){
      print("error trying to load news : $e");
      return [];
    }
  }


}