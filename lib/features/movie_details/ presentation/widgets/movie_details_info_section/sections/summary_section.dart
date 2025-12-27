import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/resources/colors_manager.dart';

class SummarySection extends StatelessWidget {
  const SummarySection({super.key, required this.movieDescription});
  final String? movieDescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Description",style: GoogleFonts.roboto(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),),
          SizedBox(height: 8.h,),
          Text(movieDescription!,softWrap: true,style: GoogleFonts.roboto(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: ColorsManager.white
          ),)
        ],
      ),
    );
  }
}
