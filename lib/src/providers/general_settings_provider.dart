

import 'package:news_app/src/ui/pages.dart';

class GeneralSettingsProvider extends ChangeNotifier{

  int _currentPage = 0;

  // getters
  int get getCurrentPage => _currentPage;

  //setters

  set setCurrentPage(int value){
    _currentPage = value;
    notifyListeners();
  }

}