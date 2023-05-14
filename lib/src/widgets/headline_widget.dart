
import 'package:news_app/src/ui/pages.dart';

class HeadlineNews extends StatefulWidget {
  const HeadlineNews({
    super.key,
    required this.headlines,
    required this.newsService,
    required this.generalSettingsProvider
  });
  final List<Articles> headlines;
  final NewsService newsService;
  final GeneralSettingsProvider generalSettingsProvider;

  @override
  State<HeadlineNews> createState() => _HeadlineNewsState();
}

class _HeadlineNewsState extends State<HeadlineNews> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final size = MediaQuery.of(context).size;
    switch (widget.newsService.isLoading) {
      case true:
        return  const CircularProgressIndicator.adaptive();
      default:
        return RefreshIndicator.adaptive(
          onRefresh: () => widget.newsService.getHeadlinesNews(),
          child: ListView.separated(
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
                            child: headline.urlToImage != null ? Image.network(headline.urlToImage!, fit: BoxFit.cover,): null
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
          ),
        );
    }
  }
  
  @override
  bool get wantKeepAlive => true;
}