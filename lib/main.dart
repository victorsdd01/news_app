import 'package:news_app/src/ui/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GeneralSettingsProvider(sharedPreferences: sharedPreferences)),
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
    GeneralSettingsProvider generalSettingsProvider = Provider.of<GeneralSettingsProvider>(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => generalSettingsProvider.loadDarkMode());
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

