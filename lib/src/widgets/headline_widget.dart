import 'package:news_app/src/ui/pages.dart';

class HeadlineNews extends StatefulWidget {
  const HeadlineNews({
    super.key,
    required this.headlines,
    required this.newsService,
    required this.generalSettingsProvider,
  });
  final List<Articles> headlines;
  final NewsService newsService;
  final GeneralSettingsProvider generalSettingsProvider;

  @override
  State<HeadlineNews> createState() => _HeadlineNewsState();
}

class _HeadlineNewsState extends State<HeadlineNews> with AutomaticKeepAliveClientMixin {
  final double _expandedHeight = 50.0;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final size = MediaQuery.of(context).size;
    return NestedScrollView(
      controller: Provider.of<GeneralSettingsProvider>(context).nestedController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) { 
        return [
          SliverAppBar(
            actions: [
                Expanded(
                  child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Categories.categories.length,
                  itemBuilder: (context, index) {
                    final Categories category = Categories.categories[index];
                    return GestureDetector(
                      onTap: () async  {
                        widget.generalSettingsProvider.setSelectedCategory = category.categoryName;
                        await widget.newsService.filterByCategory(category.categoryName);
                      },
                      child: Container(
                        width: 100,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.grey.shade600,
                        ),
                        margin: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${category.categoryName[0].toUpperCase()}${category.categoryName.substring(1)}", 
                              style: TextStyle( 
                                fontSize: widget.generalSettingsProvider.selectedCategory == category.categoryName ? 12 : 10,
                                color: widget.generalSettingsProvider.selectedCategory == category.categoryName ? Colors.amber : Colors.white
                              )
                            ),
                            Icon(
                              category.icon, 
                              size: widget.generalSettingsProvider.selectedCategory == category.categoryName ? 20 : 15,
                              color: widget.generalSettingsProvider.selectedCategory == category.categoryName ? Colors.amber : Colors.white,
                            )
                          ]
                        ),
                      ),
                    );
                  } ,
                                  ),
                ),
            ],
            expandedHeight: _expandedHeight,
          ),
        ];
      },
      body: RefreshIndicator.adaptive(
        onRefresh: () => widget.newsService.getHeadlinesNews(),
        child: !widget.newsService.isLoading ? 
          ListView.separated(
            controller: Provider.of<GeneralSettingsProvider>(context).headlineScrollController,
            itemCount: widget.headlines.length,
            itemBuilder: (context, index) {
              final Articles headline = widget.headlines[index];
              return Container(
                margin: const EdgeInsets.all(5.0),
                width: double.infinity,
                height: size.height * 0.35,
                child: Hero(
                  tag: headline.urlToImage ?? "no_image",
                  child: GestureDetector(
                    onTap: () => Navigator.pushReplacementNamed(context, 'see_new', arguments: headline),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            color: headline.urlToImage == null ? Colors.grey.shade800 : null,
                            width: size.width,
                            height: size.height,
                            child: headline.urlToImage != null 
                            ? FadeInImage(
                                image: NetworkImage(headline.urlToImage!),
                                placeholderFit: BoxFit.cover,
                                placeholder: const NetworkImage('https://placehold.co/600x400/000000/FFFFFF/png'),
                                placeholderErrorBuilder: (context, error, stackTrace) =>const CircularProgressIndicator.adaptive(),
                                imageErrorBuilder: (context, error, stackTrace) {
                                  return Text("Error:$error");
                                },
                                fit: BoxFit.cover,
                              ) 
                            : null
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: SizedBox(
                            height: size.height * 0.15,
                            width: size.width,
                            child: Text(headline.title!, 
                            textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Colors.white, 
                                fontWeight: FontWeight.w600, 
                                fontSize: 20, 
                                overflow: TextOverflow.ellipsis,
                              ),maxLines: 2,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              );
            },
            separatorBuilder: (context, index) => Divider(color: Colors.grey.shade300,),
          )
        : const Center(
          child: CircularProgressIndicator.adaptive(),
        )
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}