

import 'package:news_app/src/ui/pages.dart';

class PageWidget extends StatelessWidget {
  const PageWidget({
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
      color: color ?? Colors.amber.shade200,
      child: child,
    );
  }
}