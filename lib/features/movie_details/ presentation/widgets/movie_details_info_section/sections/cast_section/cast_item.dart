import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response/cast_member.dart';

class CastItem extends StatelessWidget {
  const CastItem({super.key, required this.castMember});
  final CastMember castMember;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.only(left: 11,top: 11,bottom: 11),
      decoration: BoxDecoration(
        color: ColorsManager.gray,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
              imageUrl: castMember.urlSmallImage??"",
            imageBuilder: (context,url)=>ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.network(castMember.urlSmallImage??""),
            ),
            placeholder: (cotext,url)=>CircularProgressIndicator(),
            errorWidget: (context,url,_)=>Icon(Icons.error,color: Colors.red,),
          ),
          SizedBox(width: 10.w,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name : ${castMember.name}",
                  softWrap: true,
                  style: GoogleFonts.roboto(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorsManager.white
                ),),
                Text("Character : ${castMember.characterName}",
                  softWrap: true,
                  style: GoogleFonts.roboto(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorsManager.white,
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
