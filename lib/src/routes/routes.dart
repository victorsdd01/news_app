import 'package:news_app/src/ui/pages.dart';


class AppRoutes{
  static const String initialRoute = "home";

  static Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
    'home':(context) => const HomePage(),
  };
}