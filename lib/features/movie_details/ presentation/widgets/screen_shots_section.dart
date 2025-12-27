import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response/movie_details.dart';

class ScreenShotsSection extends StatelessWidget {
  const ScreenShotsSection({super.key, required this.movieDetails});
  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  REdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Screen Shots",
            style: GoogleFonts.roboto(fontSize: 24.sp,fontWeight: FontWeight.bold,color: ColorsManager.white),

          ),
          SizedBox(height: 10.h,),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.network(movieDetails.mediumScreenShot1??""),

          ),
          SizedBox(height: 13.h,),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.network(movieDetails.mediumScreenShot2??""),

          ),
          SizedBox(height: 13.h,),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.network(movieDetails.mediumScreenShot3??""),

          ),
        ],
      ),
    );
  }
}
