import 'package:flutter/material.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/features/mainLayout/home/presentation/screens/home_screen.dart';
import 'package:movies/features/mainLayout/profile/presentation/screens/profile_screen.dart';
import 'package:movies/features/mainLayout/search/presentation/screens/search_screen.dart';
import 'browse/presentation/screens/browse_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeScreen(),
    SearchScreen(),
    BrowseScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: _onTab,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(AssetsManager.homeIcon),
          label: "Home",
          activeIcon: Image.asset(
            AssetsManager.homeIcon,
            color: ColorsManager.yellow,
          ),
        ),
        BottomNavigationBarItem(
          icon: Image.asset(AssetsManager.searchIcon),
          label: "Search",
          activeIcon: Image.asset(
            AssetsManager.searchIcon,
            color: ColorsManager.yellow,
          ),
        ),
        BottomNavigationBarItem(
          icon: Image.asset(AssetsManager.browseIcon),
          label: "Browse",
          activeIcon: Image.asset(
            AssetsManager.browseIcon,
            color: ColorsManager.yellow,
          ),
        ),
        BottomNavigationBarItem(
          icon: Image.asset(AssetsManager.profileIcon),
          label: "Profile",
          activeIcon: Image.asset(
            AssetsManager.profileIcon,
            color: ColorsManager.yellow,
          ),
        ),
      ],
    );
  }

  void _onTab(newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }
}
