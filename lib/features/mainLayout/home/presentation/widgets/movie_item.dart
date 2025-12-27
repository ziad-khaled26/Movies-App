import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/navigate_to_movie_details.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigation.goToMovieDetails(context, movie);
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: CachedNetworkImage(
                imageUrl: "${movie.mediumCoverImage}",
              fit: BoxFit.cover,
              placeholder: (context,url){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
              },
              errorWidget: (context,url,_){
                  return Center(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                        child: Icon(Icons.error,color: Colors.red)),
                  );
              },
            ),
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
      ),
    );
  }
}
