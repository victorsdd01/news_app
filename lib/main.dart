import 'package:news_app/src/ui/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
  Country.getCountryList();
  final bool? darkMode = sharedPreferences.getBool("isDarkMode");  
  final String? selectedCountry = sharedPreferences.getString("selectedCountry");
  final double? currentCountryScrollPosition = sharedPreferences.getDouble("currentCountryScrollPosition");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GeneralSettingsProvider(
            sharedPreferences: sharedPreferences, 
            preferencesDarkMode: darkMode ?? false,
            currentposition: currentCountryScrollPosition ?? 0.0,
          )
        ),
        ChangeNotifierProvider(create: (_) => NewsService(
            sharedPreferences: sharedPreferences,
            country: selectedCountry ?? "us"
          )
        ),
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
      theme: Provider.of<GeneralSettingsProvider>(context).themeMode,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      themeAnimationCurve: Curves.easeIn,
      themeAnimationDuration: const Duration(seconds: 1),
    );
  }
}

