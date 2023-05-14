import 'package:news_app/src/ui/pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
  
    final generaSettingsProvider = Provider.of<GeneralSettingsProvider>(context);
    final newServices = Provider.of<NewsService>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Switch(
          activeColor: Colors.blueGrey.shade500,
          inactiveThumbColor: Colors.amber.shade100,
          inactiveTrackColor: Colors.amber.shade100,
          activeThumbImage: const AssetImage('assets/icons/full-moon.png'),
          inactiveThumbImage: const AssetImage('assets/icons/sun.png'),
          value: generaSettingsProvider.darkTheme, 
          onChanged: (value) => generaSettingsProvider.setDarkTheme = value,
        ),
        actions:  <Widget>[
          IconButton(
            splashRadius: 0.1,
            splashColor: Colors.transparent,
            onPressed: () => generaSettingsProvider.setSearch = !generaSettingsProvider.search, 
            icon: Icon(Icons.search, color: generaSettingsProvider.search ? Colors.amber : Colors.white)
          ),
        ],
      ),
      body: PageView(
        controller: generaSettingsProvider.pageController,
        children: <Widget>[
          HeadlinesPage(
            child: HeadlineNews(
              headlines: newServices.headlines,
              newsService: newServices,
              generalSettingsProvider: generaSettingsProvider,
            )
          ),
          const EverythingPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.amber.shade100,
        currentIndex: generaSettingsProvider.getCurrentPage,
        onTap: (value) {
          generaSettingsProvider.setCurrentPage = value;
          switch (generaSettingsProvider.getCurrentPage) {
            case 0:
              generaSettingsProvider.pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInBack);
              break;
            case 1:
            generaSettingsProvider.pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
              break;
      }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_4_outlined),
            label: "Para ti",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.multiline_chart),
            label: "android"
          ),
        ]
      ),
    );
  }
}