import 'package:news_app/src/ui/pages.dart';

class SeeNew extends StatelessWidget {
  const SeeNew({super.key});

  @override
  Widget build(BuildContext context) {

    final Articles headlineData = ModalRoute.of(context)!.settings.arguments as Articles;

    return  Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: _Header(headline: headlineData),
            pinned: true,
            floating: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Text('''${headlineData.content!}Duis commodo in pariatur nostrud commodo sunt do irure aliquip occaecat laborum pariatur sint. Ad eiusmod eu aliqua velit amet ea do velit nostrud. Elit amet velit ex dolor Lorem. Et ad eu dolor labore officia consequat amet laboris non cupidatat voluptate duis consequat. Excepteur consequat eu ut laboris voluptate. Dolore proident deserunt aliqua minim mollit amet cupidatat est minim non. Fugiat veniam reprehenderit eiusmod aliqua minim excepteur nostrud.

Mollit consectetur sint ea laborum. Excepteur voluptate reprehenderit nulla veniam cillum deserunt fugiat veniam exercitation sit. Consectetur cillum laborum tempor veniam. Ex velit sint enim incididunt. Ad in esse id ut dolor cupidatat ex voluptate commodo laboris dolor sit. Commodo sit ut fugiat eiusmod nostrud amet duis do mollit laboris eiusmod laborum.

Magna incididunt dolor eiusmod cillum non dolore nisi minim quis culpa ullamco excepteur sunt. Lorem anim culpa voluptate in anim occaecat mollit id in cupidatat magna reprehenderit sit. Ipsum mollit sint duis amet pariatur dolore consequat nisi elit ea.

Magna eu fugiat reprehenderit cillum adipisicing irure incididunt fugiat non. Incididunt adipisicing aliquip voluptate in anim ea consectetur occaecat pariatur do ea incididunt non eiusmod. Nulla ex sit ea occaecat sint mollit nostrud magna. Veniam adipisicing ea labore minim sint quis minim occaecat velit. Culpa et ipsum sunt ad dolore enim ut commodo laboris dolor incididunt aute. Aute adipisicing deserunt consectetur ullamco.

Fugiat sint magna in commodo laborum proident sint eu ullamco laborum aute reprehenderit minim qui. Minim officia id veniam consequat ut duis duis proident est cillum sunt occaecat mollit. Duis enim dolore irure do voluptate non magna deserunt enim nostrud voluptate laborum in officia. Exercitation commodo fugiat cillum sunt aute sit consequat. Consequat sint occaecat proident qui consectetur occaecat. Do exercitation sit veniam ut nisi occaecat qui. Sunt eiusmod sint labore aliquip dolor.

Ut excepteur magna excepteur occaecat ipsum reprehenderit dolor et pariatur labore non officia sint nisi. Et consectetur tempor exercitation aliquip consequat ea cillum. Reprehenderit officia ad ad proident non est sint adipisicing aute. Qui exercitation duis non fugiat exercitation officia exercitation laboris elit. Ipsum non ut reprehenderit consectetur duis. Eiusmod pariatur veniam aute fugiat tempor Lorem et esse quis id.

Quis anim ut tempor consectetur sunt amet sunt. Qui ullamco eu in ex aliquip do excepteur do. Occaecat magna laborum sit id occaecat excepteur enim non in ut nostrud. Nisi ex do in fugiat exercitation laboris aliquip officia.

Ad non qui duis reprehenderit sint et magna consequat est tempor anim. Nisi labore ad nisi do. Est ea ea aliquip ut amet. Ullamco fugiat anim duis ut.

Mollit excepteur culpa culpa dolore amet laboris ea et. Eiusmod adipisicing consequat ipsum ipsum incididunt sint. Veniam excepteur laborum cillum culpa quis ipsum minim amet magna velit. Labore nostrud ut ullamco ea elit elit quis incididunt ipsum nulla.

Sint ullamco incididunt ex ut cupidatat consectetur. Amet est velit qui tempor laboris proident quis cillum eu dolore. Veniam et cillum in incididunt nulla. Do commodo qui nostrud fugiat incididunt quis veniam eu proident. Et aliqua proident labore reprehenderit sint. Laboris laboris deserunt aliquip occaecat aute esse aute reprehenderit enim est culpa do. Ad excepteur tempor tempor ut velit ipsum consequat dolore duis dolore velit.'''),
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
    required this.headline
  });
  final Articles headline;
  
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / _maxExtendsHeader;
    return Hero(
      tag: headline.urlToImage ?? "no_image",
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
                  headline.urlToImage!,
                ), 
                fit: BoxFit.cover,
                height: _maxExtendsHeader,
              ),
            )
          ),
          Positioned(
            top: 30,
            left: 1,
            child: AnimatedOpacity(
              duration: const Duration(seconds: 2),
              opacity: (percent >= 0.0 && percent < 0.3) ? 0.3 * percent : 1,
              curve: Curves.bounceOut,
              child: Material(
                shadowColor: Colors.transparent,
                color: Colors.transparent,
                child: IconButton(
                  splashColor: Colors.transparent,
                  splashRadius: null,
                  onPressed: () => percent == 1.0 ? Navigator.pushReplacementNamed(context, 'home') : null, 
                  icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20,)
                ),
              ),
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