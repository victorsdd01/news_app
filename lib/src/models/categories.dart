

import 'package:news_app/src/ui/pages.dart';

class Categories {
  IconData icon;
  String categoryName;

  Categories({
    required this.icon,
    required this.categoryName
  });

  static List<Categories> categories = [
    Categories(icon: Icons.business, categoryName: 'business',),
    Categories(icon: Icons.accessibility_new_sharp, categoryName: 'entertainment',),
    Categories(icon: Icons.align_horizontal_left, categoryName: 'general',),
    Categories(icon: Icons.health_and_safety, categoryName: 'health',),
    Categories(icon: Icons.science, categoryName: 'science',),
    Categories(icon: Icons.sports, categoryName: 'sports',),
    Categories(icon: Icons.phone_android, categoryName: 'technology',),
  ];
}