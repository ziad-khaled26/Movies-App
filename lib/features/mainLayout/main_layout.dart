import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/features/mainLayout/home/data/api/api_service.dart';
import 'package:movies/features/mainLayout/home/data/data_sources/movies_category_based_api_data_source.dart';
import 'package:movies/features/mainLayout/home/data/data_sources/movies_list_api_data_source.dart';
import 'package:movies/features/mainLayout/home/data/repositories_impl/movies_category_based_repo_impl.dart';
import 'package:movies/features/mainLayout/home/data/repositories_impl/movies_list_repository_impl.dart';
import 'package:movies/features/mainLayout/home/presentation/movies_category_based_view_model/movies_category_based_view_model.dart';
import 'package:movies/features/mainLayout/home/presentation/movies_list_view_model/movies_list_veiw_model.dart';
import 'package:movies/features/mainLayout/home/presentation/screens/home.dart';
import 'package:movies/features/mainLayout/home/repositories_interface/repository_interface.dart';
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
    BlocProvider(
        create: (context)=>MoviesListViewModel(
      moviesRepository:
      MoviesListRepositoryImpl(moviesListDataSource: MoviesListApiDataSource(apiService: APIService())),
    ),
    child: HomeScreen()),
    SearchScreen(),
    BrowseScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:tabs[selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: _onTab,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(ImageAssets.homeIcon),
          label: "Home",
          activeIcon: Image.asset(
            ImageAssets.homeIcon,
            color: ColorsManager.yellow,
          ),
        ),
        BottomNavigationBarItem(
          icon: Image.asset(ImageAssets.searchIcon),
          label: "Search",
          activeIcon: Image.asset(
            ImageAssets.searchIcon,
            color: ColorsManager.yellow,
          ),
        ),
        BottomNavigationBarItem(
          icon: Image.asset(ImageAssets.browseIcon),
          label: "Browse",
          activeIcon: Image.asset(
            ImageAssets.browseIcon,
            color: ColorsManager.yellow,
          ),
        ),
        BottomNavigationBarItem(
          icon: Image.asset(ImageAssets.profileIcon),
          label: "Profile",
          activeIcon: Image.asset(
            ImageAssets.profileIcon,
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
