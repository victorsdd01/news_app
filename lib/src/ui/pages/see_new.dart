import 'package:news_app/src/ui/pages.dart';

class SeeNew extends StatelessWidget {
  const SeeNew({super.key});

  @override
  Widget build(BuildContext context) {

    final Articles articles =  ModalRoute.of(context)!.settings.arguments as Articles;

    return  Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: _Header(articles: articles,),
            pinned: true,
            floating: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Text(articles.content ?? '''Proident sint laboris cillum quis magna sit nostrud dolore non velit aliquip voluptate ad proident. Cupidatat id incididunt pariatur sunt sit consequat deserunt Lorem exercitation. Qui irure ullamco aliquip ea ex deserunt ex cupidatat et velit. Veniam sunt duis occaecat dolor ea reprehenderit cupidatat amet. Laboris duis tempor exercitation enim nulla commodo proident proident culpa eiusmod cillum ea anim. Minim duis Lorem mollit enim reprehenderit consequat dolor tempor aute laborum ut ipsum Lorem minim.

                Cupidatat mollit cillum Lorem labore consequat. Ullamco reprehenderit anim fugiat in sunt. Eu elit et nostrud incididunt id nulla exercitation laboris. Occaecat quis incididunt ut exercitation non ullamco minim irure adipisicing pariatur excepteur.

                Deserunt nostrud incididunt est occaecat esse. Adipisicing ad nisi ex labore amet. Nostrud ea incididunt consectetur nostrud. Elit magna ullamco irure elit quis incididunt incididunt. Do proident reprehenderit officia cillum magna consectetur velit amet enim enim culpa exercitation ea. Minim proident laboris do proident pariatur eu tempor ullamco in culpa aliquip et irure dolor.

                Est ad esse Lorem cillum irure elit exercitation mollit esse occaecat. Eu commodo qui nostrud ut reprehenderit nulla minim ad ex exercitation elit Lorem culpa ex. Quis est dolore magna incididunt excepteur id ea labore fugiat eu laborum tempor mollit. Qui consequat officia aliqua irure elit incididunt amet dolore non quis mollit do.

                Adipisicing voluptate do dolore quis officia esse minim proident enim proident culpa dolor duis minim. Adipisicing cillum labore pariatur ea nisi excepteur fugiat fugiat nisi mollit adipisicing reprehenderit consequat. Veniam reprehenderit minim nisi ut reprehenderit quis anim dolor eu commodo laboris eu. Qui in ut consequat et enim anim laboris qui deserunt do veniam.

                Culpa magna Lorem amet ipsum aliquip veniam sint minim est aliqua ea nisi. Enim sint do cupidatat deserunt adipisicing duis elit culpa pariatur ut. Sint voluptate ullamco fugiat aute. Aute aute amet id proident reprehenderit irure pariatur reprehenderit. Amet eu culpa Lorem veniam reprehenderit ea. Adipisicing in exercitation cillum veniam voluptate eiusmod aute consectetur do cillum occaecat laborum. Sit ea sint id exercitation.

                Mollit eu excepteur ipsum ipsum est sit ad. Ullamco in et in irure ad do id id magna fugiat esse et Lorem. Anim nisi duis velit minim eiusmod exercitation. Consequat ea minim cupidatat eiusmod dolore reprehenderit ea esse non adipisicing. Culpa commodo culpa aliquip nisi aute in. Deserunt ea laborum irure Lorem pariatur aliquip laborum anim anim culpa. Velit sunt minim mollit aliqua magna incididunt ad occaecat cillum nisi pariatur ut.

                Aliqua cupidatat adipisicing exercitation non tempor non laboris quis cillum. Exercitation aliqua exercitation Lorem est incididunt. Culpa sunt consequat ipsum in fugiat in consequat magna Lorem nulla deserunt id. Reprehenderit ex magna velit non esse officia anim. Minim mollit reprehenderit id amet velit consectetur ex. Aliquip eu proident mollit aute proident cillum culpa reprehenderit cupidatat non irure reprehenderit consectetur fugiat.

                Reprehenderit eu eu magna reprehenderit est quis nisi laborum sunt cupidatat occaecat do. Ea sit minim minim ullamco quis. Nisi sit exercitation dolore tempor commodo proident officia reprehenderit. Dolor tempor ipsum mollit occaecat nulla sunt magna aliqua excepteur consequat irure.

                Est aliqua consectetur commodo exercitation sint sunt irure non Lorem velit nulla esse velit non. Nostrud reprehenderit esse aliquip ad cillum consectetur reprehenderit ut excepteur ea reprehenderit. Culpa est qui dolore velit nulla do dolor amet anim laborum. In consectetur consequat commodo do ex eiusmod enim in tempor consequat nostrud tempor. Sit labore est non proident minim dolor commodo dolor nisi velit nostrud. Voluptate duis aliquip nisi commodo velit aute id quis. Nostrud aliquip labore ad cupidatat tempor et duis amet nostrud consectetur magna sint tempor.  
              '''),
            ),
          ),
        ],
      ),
    );
  }
}

const _maxExtendsHeader =  350.0;
const _minExtendsHeader =  80.0;

class _Header extends SliverPersistentHeaderDelegate{
  const _Header({
    required this.articles,
    // required this.page
  });
  final Articles articles;
  // final String page;
  
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / _maxExtendsHeader;
    final GeneralSettingsProvider generalSettingsProvider = Provider.of<GeneralSettingsProvider>(context);
    return  Hero(
      tag: articles.title ?? "no?image",
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: Colors.grey.shade300,
            height: _maxExtendsHeader,
            width: double.infinity,
          
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: percent == 0.0 ? 1 : ( 1 - percent * 1),
              child: Image(
                image: NetworkImage(
                  articles.urlToImage ?? "https://placehold.co/600x400/000000/FFFFFF/png",
                ), 
                fit: BoxFit.cover,
                height: _maxExtendsHeader,
              ),
            )
          ),
          Positioned(
            top: 50,
            left: 10,
            child: GestureDetector(
              onTap: () async {
                 generalSettingsProvider.setCurrentPage = 0;
                 await Navigator.pushReplacementNamed(context, "home");
              },
              child: const Icon(Icons.arrow_back, color: Colors.white, size: 20,)
            )
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => _maxExtendsHeader;

  @override
  double get minExtent => _minExtendsHeader;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}