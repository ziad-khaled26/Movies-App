import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String name;
  IconData iconData;

  CategoryModel({
    required this.id,
    required this.name,
    required this.iconData,
  });

  static List<CategoryModel> category(BuildContext context) {
    return [
      CategoryModel(
        id: "0",
        name: "Watch List",
        iconData: Icons.list_rounded,
      ),
      CategoryModel(
        id: "1",
        name: "History",
        iconData: Icons.folder_rounded,
      ),
    ];
  }

}