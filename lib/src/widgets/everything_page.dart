import 'package:news_app/src/ui/pages.dart';
import 'package:url_launcher/url_launcher.dart';

class EverythingPage extends StatefulWidget {
  const EverythingPage({
    super.key,
    required this.everythingNews,
  });

  final List<Sources> everythingNews;

  @override
  State<EverythingPage> createState() => _EverythingPageState();
}

class _EverythingPageState extends State<EverythingPage> with AutomaticKeepAliveClientMixin{
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: ListView.builder(
        addAutomaticKeepAlives: true,
        itemCount: widget.everythingNews.length,
        itemBuilder: (context, index) {
          final Sources news =  widget.everythingNews[index];
          final String flag = Country.getFlagPath(news.country);
          return  ListTile(
            onTap: ()  async => await launchUrl(Uri.parse(news.url)),
            subtitle: Row(
              children: [
                const Text("Category "),
                Text(news.category,),
              ],
            ),
            title: Text(news.description, style: const TextStyle(fontSize: 14.0),maxLines: 2,),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Language", style: TextStyle(fontSize: 10),),
                const SizedBox(height: 5,),
                flag != "no-flag" 
                ? 
                  CircleAvatar(backgroundImage: AssetImage(flag), radius: 8.0,) 
                : 
                  const CircleAvatar(radius: 8.0,child: Icon(Icons.no_photography, size: 10.0,),),
              ],
            ),
          );
        },
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}