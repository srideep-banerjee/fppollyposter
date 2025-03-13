import 'package:flutter/material.dart';
import 'package:wass_project1/config/colors.dart';

class TopBanner extends StatelessWidget {
  const TopBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      alignment: Alignment.centerRight,
      color: SharedColors.primary,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            iconSize: 20,
            onPressed: search,
            icon: const Icon(Icons.search, color: Colors.white),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: SharedColors.primaryDark,
              border: Border.all(
                color: SharedColors.buttonBorderColor,
                width: 0.5,
              ),
              shape: BoxShape.circle
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.notifications_outlined,
              color: Colors.white,
              size: 16,
            ),
          )
        ],
      ),
    );
  }
  
  void search() {
    
  }
}