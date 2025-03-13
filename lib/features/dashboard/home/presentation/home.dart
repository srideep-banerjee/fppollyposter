import 'package:flutter/material.dart';
import 'package:wass_project1/features/category/data/category_list.dart';
import 'package:wass_project1/features/category/domain/category.dart';
import 'package:wass_project1/features/dashboard/home/presentation/category_highlight.dart';
import 'package:wass_project1/features/dashboard/home/presentation/home_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  List<Category> allCategories = [];
  
  @override
  void initState() {
    allCategories = allCategories = CategoryList.getCategoryList();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        const HomeSlider(),
        const SizedBox(height: 16,),
        Expanded(
          child: ListView.builder(
            itemBuilder: (_, ind) {
              return CategoryHighlightDisplay(allCategories[ind]);
            },
            itemCount: allCategories.length,
          ),
        )
      ],
    );
  }
  
  void search() {
    
  }
}