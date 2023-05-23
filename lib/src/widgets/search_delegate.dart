import 'package:news_app/src/ui/pages.dart';

class MySearchDelegate extends SearchDelegate<String>{

  GeneralSettingsProvider generalSettingsProvider;
  NewsService newsService;
  List<String> recentSearchs = [];
  final Debouncer debouncer = Debouncer(milliseconds: 500);
  MySearchDelegate({ required this.newsService, required this.generalSettingsProvider});

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
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) => TextButton(
    onPressed: () {
      Navigator.pop(context);
      generalSettingsProvider.setSearch = false;
    }, 
    child: const Text("Cancel", style: TextStyle(fontSize: 12),)
  );
  
  @override
  Widget buildResults(BuildContext context) {

    generalSettingsProvider.addRecentSearch(query);
    return FutureBuilder<List<Articles>>(
      future: newsService.filterByQuery(query),
      builder: (context, AsyncSnapshot<List<Articles>> snapshot) {
        if(snapshot.hasData){
          return ListView.separated(
            itemCount: snapshot.data!.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (_, index) {
              final Articles headline = snapshot.data![index];
              return ListTile(
                title: Text(headline.title!),
              );
            },
          );
        }else{
          return const Center(
            child: CircularProgressIndicator.adaptive()
          );
        }
      },
    );
    // return 
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    // debouncer.run(() async => query.isNotEmpty ? await newsService.filterByQuery(query) :  null);

    final size = MediaQuery.of(context).size;
    return generalSettingsProvider.loadRecentSearches().isNotEmpty 
      ? NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child:  Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                  width: size.width,
                  child: const Text("Recent", style: TextStyle(fontSize: 16),),
                ),
            ),
          ),
        ], 
        body: ListView.builder(
          itemCount: generalSettingsProvider.loadRecentSearches().length,
          itemBuilder: (context, index) {
            final String name =  generalSettingsProvider.loadRecentSearches()[index];
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              background: Container(
                width: size.width,
                color: Colors.red.shade400,
                child: Icon(Icons.delete_forever, color: Colors.red.shade200,),
              ),
              onDismissed: (_) => generalSettingsProvider.deleteRecentSearch(name),
              child: ListTile(
                leading: const Icon(Icons.search) ,
                title: Text(name),
              ),
            );
          },
        ),
      )
      : const SizedBox();
  }
}