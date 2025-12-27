import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/resources/colors_manager.dart';

class GenreItem extends StatelessWidget {
  const GenreItem({super.key, required this.genre});
  final String genre;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: REdgeInsets.all(8),
      decoration: BoxDecoration(
          color: ColorsManager.gray,

          borderRadius: BorderRadius.circular(12.r)
      ),
      child: Text(genre,style: GoogleFonts.roboto(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.white
      ),),
    );
  }
}
