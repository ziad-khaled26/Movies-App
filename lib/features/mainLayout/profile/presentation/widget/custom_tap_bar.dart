import 'package:flutter/material.dart';
import 'package:movies/core/resources/colors_manager.dart';
import '../../data/model/category_model.dart';
import 'custom_tap_item.dart';

class CustomTapBar extends StatefulWidget {
  final List<CategoryModel> categories;
  int selectedCategoryIndex;
  final Color selectedBgColor;
  final Color selectedFgColor;
  final Color unSelectedBgColor;
  final Color unSelectedFgColor;
  final void Function(CategoryModel)? onCategoryItemSelected;

  CustomTapBar({
    super.key,
    required this.categories,
    required this.selectedBgColor,
    required this.selectedFgColor,
    required this.unSelectedBgColor,
    required this.unSelectedFgColor,
    this.onCategoryItemSelected, required this.selectedCategoryIndex,
  });

  @override
  State<CustomTapBar> createState() => _CustomTapBarState();
}
class _CustomTapBarState extends State<CustomTapBar> {
  int selectedIndex=0;
  @override
  void initState() {
    selectedIndex = widget.selectedCategoryIndex;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categories.length,
      child: TabBar(
        onTap: (index) {
          widget.onCategoryItemSelected!(widget.categories[index]);
          setState(() {
            selectedIndex = index;
          });
        },
        indicatorColor:ColorsManager.yellow,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 2,
        dividerColor: Colors.transparent,
        tabs: widget.categories
            .map(
              (category) => CustomTabItem(
            category: category,
            isSelected:
            selectedIndex == widget.categories.indexOf(category),
            selectedBgColor: widget.selectedBgColor,
            selectedFgColor: widget.selectedFgColor,
            unSelectedBgColor: widget.unSelectedBgColor,
            unSelectedFgColor: widget.unSelectedFgColor,
          ),
        )
            .toList(),
      ),
    );
  }
}