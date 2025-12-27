import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response/movie_details.dart';

class MovieStatItem extends StatelessWidget {
  const MovieStatItem({super.key, required this.statIcon, required this.stat});
  final IconData statIcon;
  final String? stat;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.gray,
        borderRadius: BorderRadius.circular(16.r)
      ),
      padding: REdgeInsets.all(8),
      margin: REdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(statIcon,color:ColorsManager.yellow),
          SizedBox(width: 8.w,),
          Expanded(child: Text(stat??"",style: GoogleFonts.roboto(fontSize: 24.sp,fontWeight: FontWeight.bold,color: ColorsManager.white),))
        ],
      ),
    );
  }
}
