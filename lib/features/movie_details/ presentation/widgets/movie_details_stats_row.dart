import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/features/movie_details/%20presentation/widgets/movie_stat_Item.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response/movie_details.dart';

class StatsRow extends StatelessWidget {
  const StatsRow({super.key, required this.movieDetails});
  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween ,
      children: [
        Expanded(child: MovieStatItem(statIcon: Icons.favorite, stat: movieDetails.likeCount.toString())),
        Expanded(child: MovieStatItem(statIcon: Icons.watch_later, stat: movieDetails.runtime.toString())),
        Expanded(child: MovieStatItem(statIcon: Icons.star_purple500_sharp, stat: movieDetails.rating.toString())),

      ],
    );
  }
}
