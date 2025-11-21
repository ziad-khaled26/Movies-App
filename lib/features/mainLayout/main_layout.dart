import 'package:flutter/material.dart';
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
  int selectedIndex=0;
  List<Widget> tabs = [
    HomeScreen(),
    BrowseScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
  Widget _buildBottomNavigationBar(){
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: _onTab,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: "Home"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.open_in_browser_rounded),
          label: "Browse"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded),
          label: "Search"
        ),
        BottomNavigationBarItem(
          icon:Icon(Icons.person_rounded,),
          label: "Profile"
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
