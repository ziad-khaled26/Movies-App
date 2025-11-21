import 'package:flutter/material.dart';
import 'package:movies/core/resources/colors_manager.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
    );
  }
}
