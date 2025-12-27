import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/features/movie_details/%20presentation/widgets/movie_details_info_section/sections/cast_section/cast_item.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response/cast_member.dart';

import '../../../../../data/models/movie_details_response/cast.dart';

class CastSection extends StatelessWidget {
  const CastSection({super.key, required this.cast});
  final List<CastMember>? cast;

  @override
  Widget build(BuildContext context) {
    bool isNullCast =cast==null;
    return Padding(
      padding:  REdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Cast",style: GoogleFonts.roboto(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: ColorsManager.white
          ),),
          SizedBox(height: 12.h,),
          if(isNullCast)
             Text("No Data Available",style: GoogleFonts.roboto(
             fontSize: 16.sp,
             fontWeight: FontWeight.w400,
             color: ColorsManager.white
             ),),
          if(!isNullCast)
            ListView.separated(
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index)=>CastItem(castMember: cast![index]),
                separatorBuilder: (context,index)=>SizedBox(height: 8.h,),
                itemCount: cast!.length)

        ],
      ),
    );
  }
}
