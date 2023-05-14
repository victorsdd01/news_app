

import 'package:news_app/src/ui/pages.dart';

class HeadlinesPage extends StatelessWidget {
  const HeadlinesPage({
    super.key, 
    required this.child,
    this.color
  });
  final  Widget child;
  final  Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: color,
      child: child,
    );
  }
}