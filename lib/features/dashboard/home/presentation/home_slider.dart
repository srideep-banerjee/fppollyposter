import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int itemCount = 7;
  List<String> images = [];
  
  @override
  void initState() {
    for (int i = 0; i < itemCount; i++) {
      images.add("assets/images/home_slide1.png");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: itemCount,
      options: CarouselOptions(
        height: 123,
        enlargeCenterPage: true,
        enlargeFactor: 0.15,
        aspectRatio: 340 / 123,
        initialPage: 1,
        autoPlay: false,
        
      ),
      itemBuilder: (context, ind, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              images[ind],
              height: 123,
              width: 340,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        );
      },
    );
  }
}