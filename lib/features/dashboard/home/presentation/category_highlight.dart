import 'package:flutter/material.dart';
import 'package:wass_project1/config/colors.dart';
import 'package:wass_project1/features/category/domain/category.dart';
import 'package:wass_project1/features/category/presentation/category_screen.dart';

class CategoryHighlightDisplay extends StatelessWidget {
  final Category category;

  const CategoryHighlightDisplay(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  category.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  viewAll(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: SharedColors.viewAllButtonColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: const Text(
                    "VIEW ALL",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 114,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: category.highlights.length,
              itemBuilder: (_, ind) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: SharedColors.categoryHighlightBorderColor,
                      ),
                    ),
                    child: Image.asset(
                      category.highlights[ind],
                      height: 112,
                      width: 112,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(width: 4,),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
  
  void viewAll(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return CategoryScreen(category);
        },
      ),
    );
  }
}
