import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';
import 'package:movies/features/mainLayout/home/presentation/widgets/movie_item.dart';
import 'package:movies/features/movie_details/data/models/movie_suggesions_response/movie_suggested.dart';

class SimilarMovies extends StatelessWidget {
  const SimilarMovies({super.key, required this.movieSuggestions});
  final List<Movie> movieSuggestions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  REdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h,),
          Text("Similar",style: GoogleFonts.roboto(fontSize: 24.sp,fontWeight: FontWeight.bold,color: ColorsManager.white),),
          SizedBox(
            child: GridView.count(
              childAspectRatio: 189/279,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
              mainAxisSpacing: 16.h,
              crossAxisSpacing: 20.w,
              children: [

                for(var movie in movieSuggestions)
                  MovieItem(movie: movie)
              ],
            ),
          )
        ],
      ),
    );
  }
}
