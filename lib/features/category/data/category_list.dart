import 'package:wass_project1/features/category/domain/category.dart';

class CategoryList {
  static List<Category> getCategoryList() {
    List<String> items = [
      "assets/images/category_p1.png",
      "assets/images/category_p2.png",
      "assets/images/category_p3.png",
      "assets/images/category_p4.png",
      "assets/images/category_p5.png",
      "assets/images/category_p6.png",
      "assets/images/category_p7.png",
      "assets/images/category_p8.png",
    ];
    Map<String, List<String>> events = {
      "25 Dec Christmas": items,
      "01 Jan New Year": items,
      "01 Jan New Year(2)": items,
      "01 Jan New Year(3)": items,
    };
    List<String> highlights = [
      "assets/images/category_hl1.png",
      "assets/images/category_hl2.png",
      "assets/images/category_hl3.png",
      "assets/images/category_hl3.png",
    ];

    return [
      Category("Today Special", events: events, highlights: highlights),
      Category("Candidate Related", events: events, highlights: highlights),
      Category("Festivals", events: events, highlights: highlights),
      Category("Birth & Death Anniversaries", events: events, highlights: highlights),
      Category("Party Related", events: events, highlights: highlights),
    ];
  }
}