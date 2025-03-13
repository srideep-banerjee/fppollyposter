import 'package:flutter/material.dart';
import 'package:wass_project1/config/colors.dart';
import 'package:wass_project1/features/dashboard/home/presentation/home.dart';
import 'package:wass_project1/features/notifications/presentation/notification_screen.dart';

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
      appBar: AppBar(
        backgroundColor: SharedColors.primary,
        actions: [
          const IconButton(
            iconSize: 20,
            onPressed: search,
            icon: Icon(Icons.search, color: Colors.white),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const NotificationScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
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
              ),
            ),
          ),
        ],
      ),
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

void search() {
  
}