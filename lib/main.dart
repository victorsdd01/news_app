import 'package:news_app/src/ui/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
  final darkMode = sharedPreferences.getBool("isDarkMode");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GeneralSettingsProvider(sharedPreferences: sharedPreferences, preferencesDarkMode: darkMode!)),
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News app',
      theme: Provider.of<GeneralSettingsProvider>(context).themeMode,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      themeAnimationCurve: Curves.easeIn,
      themeAnimationDuration: const Duration(seconds: 1),
    );
  }
}

