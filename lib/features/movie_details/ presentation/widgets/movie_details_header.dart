import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';

class MovieDetailsHeader extends StatelessWidget {
  const MovieDetailsHeader({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 645.h,
          width: double.infinity,
          child: Image.network(movie.largeCoverImage ?? "",fit: BoxFit.cover,),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorsManager.black.withOpacity(.20),
                ColorsManager.black,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            ),
          ),
        ),
        Center(
          child: SizedBox(
            height: 766.h,
            child: Column(
              children: [
                Spacer(flex: 2,),
                Image.asset(ImageAssets.moviePlayer,scale: 1.3,),
                Spacer(flex: 2,),
                Expanded(
                  child: Text(movie.title??"",style: GoogleFonts.roboto(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,color: ColorsManager.white
                  ),),
                ),
                Text(movie.year.toString(),
                  style: GoogleFonts.roboto(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.gray2
                  ),
                  softWrap: true,
                ),
                Spacer(flex: 3,)
              ],
            ),
          ),
        )
      ],
    );
  }
}
