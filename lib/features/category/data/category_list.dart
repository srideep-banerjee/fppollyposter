import 'package:wass_project1/features/category/domain/category.dart';

class CategoryList {
  static List<Category> getCategoryList() {
    Map<String, List<String>> events = {};
    List<String> highlights = [
      "assets/images/category_hl1.png",
      "assets/images/category_hl2.png",
      "assets/images/category_hl3.png",
      "assets/images/category_hl3.png",
    ];

    return [
      Category("Today Special", events, highlights),
      Category("Candidate Related", events, highlights),
      Category("Festivals", events, highlights),
      Category("Birth & Death Anniversaries", events, highlights),
      Category("Party Related", events, highlights),
    ];
  }
}