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
       ),
       IconButton(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        disabledColor: Colors.grey.shade700,
        splashColor: Colors.transparent,
        splashRadius: 1,
        onPressed: () {

        },
        icon: const Icon(Icons.filter_list)
       ),
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
    final NewsService newsService = Provider.of<NewsService>(context);
    return ListView.separated(
      itemCount: newsService.headlinesFilteredByQuery.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (_, index) {
        final Articles headline = newsService.headlinesFilteredByQuery[index];
        return ListTile(
          title: Text(headline.title!),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final NewsService newsService = Provider.of<NewsService>(context);
    debouncer.run(() async {
      //  final list = newsService.filterByQuery(query, null);
    });
    return !newsService.isLoading
    ? ListView.separated(
        itemCount: newsService.headlinesFilteredByQuery.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (_, index) {
          final Articles headline = newsService.headlinesFilteredByQuery[index];
          return ListTile(
            title: Text(headline.title!),
          );
        },
      )
    : const Center(
        child: CircularProgressIndicator.adaptive(),
      );
  }
}