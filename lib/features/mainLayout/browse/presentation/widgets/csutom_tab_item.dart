import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/colors_manager.dart';

class CustomTabItem extends StatelessWidget {
  const CustomTabItem({super.key, required this.category,required this.isSelectedTab, required this.selectedTextStyle, required this.unSelectedTextStyle, required this.selectedContainerColor, required this.unSelectedContainerColor});
  final String category;
  final bool isSelectedTab;
  final TextStyle selectedTextStyle;
  final TextStyle unSelectedTextStyle;
  final Color selectedContainerColor;
  final Color unSelectedContainerColor;


  @override
  Widget build(BuildContext context) {
    return Container(

      padding: REdgeInsets.all(8),
      decoration: BoxDecoration(
          color: isSelectedTab? selectedContainerColor:unSelectedContainerColor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
              color: ColorsManager.yellow
          )
      ),
      child: Text(category,style: isSelectedTab? selectedTextStyle: unSelectedTextStyle,),

    );
  }
}
