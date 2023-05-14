import 'package:news_app/src/ui/pages.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => GeneralSettingsProvider()),
          ChangeNotifierProvider(create: (context) => NewsService()),
        ],
        child: const MyApp(),
      )
    );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News app',
      theme: Provider.of<GeneralSettingsProvider>(context).themeMode,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    );
  }
}