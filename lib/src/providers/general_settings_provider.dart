
import 'package:news_app/src/ui/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';


class GeneralSettingsProvider extends ChangeNotifier{

  int _currentPage = 0;
  bool _settings = false;
  bool _search = false;
  bool _isDarkMode = false;
  double _headLinesControllerOffset = 0.0;
  double _opacity = 0.0;
  String _selectedCategory = "";
  SharedPreferences sharedPreferences;
  bool preferencesDarkMode;
  final ScrollController _headlinesScrollController = ScrollController();
  final PageController _pageController = PageController(initialPage: 0);
  final ScrollController _nestedController = ScrollController();

  // getters
  int get getCurrentPage => _currentPage;
  bool get settigns => _settings;
  bool get search => _search;
  bool get darkTheme => _isDarkMode;
  double get headLinesControllerOffset => _headLinesControllerOffset;
  double get opacity => _opacity;
  String get selectedCategory => _selectedCategory;
  
  ThemeData get themeMode => _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;
  ScrollController get headlineScrollController => _headlinesScrollController;
  PageController get pageController => _pageController;
  ScrollController get nestedController => _nestedController;

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
    sharedPreferences.setBool("isDarkMode", value);
    notifyListeners();
  }

  set setOpacity(double value){
    _opacity = value;
    notifyListeners();
  }

  set setSelectedCategory(String value) {
    _selectedCategory = value;
    notifyListeners();
  }


  GeneralSettingsProvider({required this.sharedPreferences, required this.preferencesDarkMode}){
    setDarkTheme = preferencesDarkMode;
    listenHeadlinesController();
    listenPageController();
  }

  void loadDarkMode(){
    final value = sharedPreferences.getBool("isDarkMode");
    switch (value) {
      case true:
        setDarkTheme = value!;
        break;
      case false:
        setDarkTheme = value!;
      case null:
        setDarkTheme = false;
       break;
    }
  }

  void listenHeadlinesController(){
    _headlinesScrollController.addListener(() {
      _headLinesControllerOffset =  _headlinesScrollController.offset;
      switch (headLinesControllerOffset) {
        case > 0.0:
          nestedController.animateTo(_nestedController.position.maxScrollExtent, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
          break;
        case < 100.0:
          nestedController.animateTo(_nestedController.position.minScrollExtent, duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
          break;
      }
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
    _nestedController.dispose();
  }

}