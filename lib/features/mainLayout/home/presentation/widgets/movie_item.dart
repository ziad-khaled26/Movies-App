import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Image.network(movie.mediumCoverImage ?? ""),
        ),
        Positioned(
          top: 11.h,
          left: 9.w,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 6.w),
            decoration: BoxDecoration(
              color: ColorsManager.black.withValues(alpha: .7),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                Text("${movie.rating}",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: ColorsManager.white
                  ),
                ),
                Icon(Icons.star,color: ColorsManager.yellow, size: 24.r,)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
