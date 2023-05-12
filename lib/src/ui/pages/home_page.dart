import 'package:news_app/src/ui/pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final List<Color> colors = [Colors.black, Colors.red, Colors.blue, Colors.green, Colors.yellow, Colors.grey];
    final generaSettingsProvider = Provider.of<GeneralSettingsProvider>(context);
    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(), 
        itemCount: colors.length,
        itemBuilder: (context, __) => PageWidget(
          color: colors[generaSettingsProvider.getCurrentPage],
          child: Center(
            child: Text("${generaSettingsProvider.getCurrentPage}"),
          ),
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: generaSettingsProvider.getCurrentPage,
        onTap: (value) => generaSettingsProvider.setCurrentPage = value,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.apple),
            label: "apple",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.android),
            label: "android"
          ),
        ]
      ),
    );
  }
}