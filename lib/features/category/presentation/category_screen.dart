import 'package:flutter/material.dart';
import 'package:wass_project1/config/colors.dart';
import 'package:wass_project1/features/category/domain/category.dart';
import 'package:wass_project1/features/category/presentation/events.dart';

class CategoryScreen extends StatefulWidget {
  final Category _category;

  const CategoryScreen(this._category, {super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  
  late Category category;
  late EventSlectorController _controller;
  late List<String> events;
  
  @override
  void initState() {
    category = widget._category;
    events = List.of(category.events.keys);
    _controller = EventSlectorController();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    
    List<String> categoryItems = category.events[events[_controller.selectedEvent]]!;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SharedColors.primary,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          category.name,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: EventSelector(events),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  itemCount: categoryItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (_, ind)  {
                    return CategoryItemDisplay(categoryItems[ind]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItemDisplay extends StatelessWidget {
  final String asset;

  const CategoryItemDisplay(this.asset, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: SharedColors.categoryHighlightBorderColor,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.asset(
          asset,
          width: 164,
          height: 164,
        ),
      ),
    );
  }
}