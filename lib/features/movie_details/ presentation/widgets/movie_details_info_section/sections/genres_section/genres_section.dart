import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/features/movie_details/%20presentation/widgets/movie_details_info_section/sections/genres_section/genre_item.dart';

class GenresSection extends StatelessWidget {
  const GenresSection({super.key, required this.genres});
  final List<String> genres;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  REdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Genres",style: GoogleFonts.roboto(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: ColorsManager.white
          ),),
          SizedBox(height: 13.h,),
          Wrap(
            spacing: 16.w,
            runSpacing: 11.h,
            children: [
              for(var genre in genres)
                GenreItem(genre: genre)
            ],
          )
        ],
      ),
    );
  }
}
