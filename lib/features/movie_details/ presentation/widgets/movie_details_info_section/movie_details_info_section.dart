import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';
import 'package:movies/features/movie_details/%20presentation/widgets/movie_details_info_section/sections/cast_section/cast_section.dart';
import 'package:movies/features/movie_details/%20presentation/widgets/movie_details_info_section/sections/genres_section/genres_section.dart';
import 'package:movies/features/movie_details/%20presentation/widgets/movie_details_info_section/sections/summary_section.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response/movie_details.dart';

class MovieDetailsInfoSection extends StatelessWidget {
  const MovieDetailsInfoSection({super.key, required this.movieDetails});
  final MovieDetails movieDetails;
  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SummarySection(movieDescription: movieDetails.descriptionFull==null? "Null Description":movieDetails.descriptionFull!.isEmpty?"No Description Available":movieDetails.descriptionFull),
          SizedBox(height: 16.h,),
          CastSection(cast: movieDetails.cast,),
          SizedBox(height: 16.h,),
          GenresSection(genres: movieDetails.genres??[],)
        ],
      ),
    );
  }
}
