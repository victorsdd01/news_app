import 'package:news_app/src/ui/pages.dart';

class MySearchDelegate extends SearchDelegate<String>{

  late GeneralSettingsProvider generalSettingsProvider;
  final Debouncer debouncer = Debouncer(milliseconds: 500);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
       IconButton(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        disabledColor: Colors.grey.shade700,
        splashColor: Colors.transparent,
        splashRadius: 1,
        onPressed: () => query = "",
        icon: const Icon(Icons.close)
       )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    generalSettingsProvider = Provider.of<GeneralSettingsProvider>(context);
    return IconButton(
      splashColor: Colors.transparent,
      splashRadius: 1,
      onPressed: () {
          generalSettingsProvider.setSearch = !generalSettingsProvider.search;
          Navigator.pop(context);
      }, 
      icon: const Icon(Icons.chevron_left)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("buildResults");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // debouncer.run((){
    //   print("searching:$query");
    // });
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Text("BuildSuggestion:$query"),
    );
  }
}