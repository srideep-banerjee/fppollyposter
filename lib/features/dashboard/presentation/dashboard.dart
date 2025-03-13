import 'package:flutter/material.dart';
import 'package:wass_project1/config/colors.dart';
import 'package:wass_project1/features/dashboard/home/presentation/home.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Builder(
          builder: (context) {
            if (_selectedIndex == 0) {
              return const HomeScreen();
            }
            return const Placeholder();
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: SharedColors.primary,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/home.png",
              width: 20,
              height: 20,
            ),
            label: "downloads",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/downloads.png",
              width: 20,
              height: 20,
            ),
            label: "downloads",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/profile.png",
              width: 20,
              height: 20,
            ),
            label: "profile",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey[500],
        unselectedItemColor: Colors.grey[600],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
