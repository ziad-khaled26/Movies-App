import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/routes_manager.dart';

class WatchNowButton extends StatelessWidget {
  const WatchNowButton({super.key,required this.movieTorrentUrl});
  final String movieTorrentUrl;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: REdgeInsets.symmetric(vertical: 12),
        backgroundColor: ColorsManager.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r)
        )
      ),
        onPressed: (){
          Navigator.pushNamed(context, RoutesManager.movieStreamScreen,arguments: movieTorrentUrl);

        },
        child: Center(
          child: Text(
            "Watch Now",
            style: GoogleFonts.roboto(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: ColorsManager.white
            ),
          ),
        ));
  }


}
