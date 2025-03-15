class Category {
  final String name;
  final CategoryType type;
  final Map<String, List<String>> events;
  final List<String> highlights;
  
  const Category(
    this.name, {
      required this.events,
      required this.highlights,
      this.type = CategoryType.poster
    }
  );
}

enum CategoryType {
  poster,
  story,
  video,
}