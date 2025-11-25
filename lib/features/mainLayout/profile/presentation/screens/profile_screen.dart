import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/features/mainLayout/profile/presentation/widget/custom_tap_bar.dart';
import '../../data/model/category_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late CategoryModel selectedCategory = CategoryModel.category(context)[0];
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            width: double.infinity,
            height: 390.h,
            color: ColorsManager.gray,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 52.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(59.r),
                      child: Image.asset(
                        ImageAssets.profileImage3,
                        width: 118.w,
                        height: 118.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      children: [
                        Text("12", style: textTheme.bodyLarge),
                        Text("Wish List", style: textTheme.bodyMedium),
                      ],
                    ),
                    Column(
                      children: [
                        Text("10", style: textTheme.bodyLarge),
                        Text("History", style: textTheme.bodyMedium),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Text("Kareem Mohamed", style: textTheme.bodyMedium),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 236.w,
                      height: 56.h,
                      decoration: BoxDecoration(
                        color: ColorsManager.yellow,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Text(
                        "Edit Profile",
                        style: textTheme.titleMedium?.copyWith(
                          color: ColorsManager.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      alignment: Alignment.center,
                      width: 135.w,
                      height: 56.h,
                      decoration: BoxDecoration(
                        color: ColorsManager.red,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Exit",
                            style: textTheme.titleMedium?.copyWith(
                              color: ColorsManager.white,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          const Icon(Icons.exit_to_app, color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: CustomTapBar(
                    onCategoryItemSelected: (category) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    categories: CategoryModel.category(context),
                    selectedBgColor: Colors.transparent,
                    selectedFgColor: ColorsManager.yellow,
                    unSelectedBgColor: Colors.transparent,
                    unSelectedFgColor: ColorsManager.white,
                    selectedCategoryIndex: 0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Center(child: Image.asset(ImageAssets.empty))),
        ],
      ),
    );
  }
}