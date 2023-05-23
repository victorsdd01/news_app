
import 'package:flutter/foundation.dart';
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
  double _currentCountryScrollPosition = 0.0; //currentScrollPosition from seleceted country

  //controllers
  final ScrollController _headlinesScrollController = ScrollController();
  final PageController _pageController = PageController(initialPage: 0);
  final ScrollController _nestedController = ScrollController();
  late final ScrollController _countryController = ScrollController(initialScrollOffset: currentCountryScrollPosition );


  // as parameter
  SharedPreferences sharedPreferences;
  bool preferencesDarkMode;
  double currentposition; //currentPosition
  List<String> searches;

  // getters
  int get getCurrentPage => _currentPage;
  bool get settigns => _settings;
  bool get search => _search;
  bool get darkTheme => _isDarkMode;
  double get headLinesControllerOffset => _headLinesControllerOffset;
  double get opacity => _opacity;
  String get selectedCategory => _selectedCategory;
  double get currentCountryScrollPosition => _currentCountryScrollPosition;
  
  
  ThemeData get themeMode => _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;
  ScrollController get headlineScrollController => _headlinesScrollController;
  PageController get pageController => _pageController;
  ScrollController get nestedController => _nestedController;
  ScrollController get countryController => _countryController;
  

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

  set setCurrentCountryScrollPosition(double value){
    _currentCountryScrollPosition = value;
    sharedPreferences.setDouble("currentCountryScrollPosition", value);
    notifyListeners();
  }


  GeneralSettingsProvider({
    required this.sharedPreferences, 
    required this.preferencesDarkMode,
    required this.currentposition,
    required this.searches,
  }){
    
    setDarkTheme = preferencesDarkMode;
    setCurrentCountryScrollPosition = currentposition;
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
    headlineScrollController.addListener(() {
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
    pageController.addListener(() {
      final currentControllerPage = _pageController.page!.ceil();
      _currentPage = currentControllerPage;
      notifyListeners();
    });
  }

  void listeCountryController() {
      countryController.addListener(() {});
  }


  void addRecentSearch(String query) async {
    try {
      final exist = searches.where((element) => element == query);
      if(query.isNotEmpty && exist.isEmpty){  
        searches.add(query);
        await sharedPreferences.setStringList("recentSearches",searches);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Error $e");
      }
    }
  }

  List<String> loadRecentSearches() {
    try {
      return searches;
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Error trying toload recent searches list $e");
      }
      return [];
    }
  }
  void deleteRecentSearch(String name){
    try{
      searches.remove(name);
      sharedPreferences.setStringList("recentSearches", searches);
    } on Exception catch(e){
      if (kDebugMode) {
        print("Error trying to delete recentedSearch $e");
      }
    }
  }

  void close(){
    _headlinesScrollController.dispose();
    _pageController.dispose();
    _nestedController.dispose();
    _countryController.dispose();
  }

}