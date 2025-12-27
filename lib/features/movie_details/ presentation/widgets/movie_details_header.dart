import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies/features/movie_details/%20presentation/widgets/watch_now_button.dart';

class MovieDetailsHeader extends StatelessWidget {
  const MovieDetailsHeader({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  REdgeInsets.all(16),
      child: Stack(
        children: [
          SizedBox(
            height: 645.h,
            width: double.infinity,
            // child: CachedNetworkImage(
            //
            //     imageUrl: '${movie.largeCoverImage}',
            //   imageBuilder: (context,provider)=>Image.network(movie.largeCoverImage??""),
            //   // placeholder: (context,error){
            //   //     return Center(child: Text("Movie ImageNot Found",style: TextStyle(fontSize: 38,color: ColorsManager.white),),);
            //   // },
            //    ),,
            child: CachedNetworkImage(
              imageUrl: '${movie.largeCoverImage}',
              placeholder: (context,url){
                  return CircularProgressIndicator();
              },
              errorWidget: (context,url,_){
                  return CachedNetworkImage(imageUrl: "${movie.mediumCoverImage}",
                    placeholder: (context,url){
                      return CircularProgressIndicator();
                    },
                    errorWidget: (context,url,_){
                    return Icon(Icons.error,color: ColorsManager.red,);
                    },
                  );
              },
            ),
          ),
          Container(
              height: 645.h,
              width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.red,
              gradient: LinearGradient(
                colors: [
                  ColorsManager.black.withOpacity(.20),
                  ColorsManager.black,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0,1],
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
                  SizedBox(height: 8.h,),
                  WatchNowButton(movieTorrentUrl: (movie.torrents)!=null?movie.torrents![0].url??"":""),
                  // Spacer(flex: 3,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
