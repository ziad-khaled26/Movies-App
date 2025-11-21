import 'package:flutter/material.dart';
import 'package:movies/features/mainLayout/main_layout.dart';

abstract class RoutesManagers{
  static const String mainLayout = "MainLayout";
  static Map<String,WidgetBuilder> routes={
    mainLayout:(context)=>const MainLayout(),
  };
}