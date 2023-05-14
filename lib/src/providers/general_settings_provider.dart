

import 'package:news_app/src/ui/pages.dart';

class GeneralSettingsProvider extends ChangeNotifier{

  int _currentPage = 0;
  bool _settings = false;
  bool _search = false;
  bool _isDarkMode = false;
  double _headLinesControllerOffset = 0.0;
  double _opacity = 0.0;
  final ScrollController _headlinesScrollController = ScrollController();
  final PageController _pageController = PageController(initialPage: 0);

  // getters
  int get getCurrentPage => _currentPage;
  bool get settigns => _settings;
  bool get search => _search;
  bool get darkTheme => _isDarkMode;
  double get headLinesControllerOffset => _headLinesControllerOffset;
  double get opacity => _opacity;
  
  ThemeData get themeMode => _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;
  ScrollController get headlineScrollController => _headlinesScrollController;
  PageController get pageController => _pageController;

  //setters

  set setCurrentPage(int value){
    _currentPage = value;
    notifyListeners();
  }

  set setSettings(bool value) {
    _settings = value;
    notifyListeners();
  }
  set setSearch(bool value) {
    _search = value;
    notifyListeners();
  }
  set setDarkTheme(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  set setOpacity(double value){
    _opacity = value;
    notifyListeners();
  }


  GeneralSettingsProvider(){
    listenHeadlinesController();
    listenPageController();
  }

  void listenHeadlinesController(){
    _headlinesScrollController.addListener(() {
      _headLinesControllerOffset =  _headlinesScrollController.offset;
      notifyListeners();
    });
  }

  void listenPageController(){
    _pageController.addListener(() {
      final currentControllerPage = _pageController.page!.ceil();
      _currentPage = currentControllerPage;
      notifyListeners();
    });
  }

  void close(){
    _headlinesScrollController.dispose();
    _pageController.dispose();
  }

}