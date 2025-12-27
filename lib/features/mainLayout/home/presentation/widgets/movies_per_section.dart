import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';
import 'package:movies/features/mainLayout/home/presentation/movies_per_section_view_model/movies_per_section_view_model.dart';
import 'package:movies/features/mainLayout/home/presentation/widgets/movie_item.dart';

import '../../../../../core/resources/colors_manager.dart';

class MoviesPerSection extends StatefulWidget {
  const MoviesPerSection({super.key});

  @override
  State<MoviesPerSection> createState() => _MoviesPerSectionState();
}

class _MoviesPerSectionState extends State<MoviesPerSection> {
  late String sectionName;
  @override
  void initState() {
    super.initState();
    context.read<MoviesPerSectionViewModel>().getMoviesBasedOnSectionName();
    sectionName=context.read<MoviesPerSectionViewModel>().sectionName;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [

            Text(sectionName,style: GoogleFonts.roboto(fontSize: 20.sp,color: ColorsManager.white),),
            TextButton(
                onPressed: (){
                  context.read<MoviesPerSectionViewModel>().loadMoreMoviesPerSection();
                },
                child: Text("See More",style: GoogleFonts.roboto(fontSize: 18.sp,color: ColorsManager.yellow,fontWeight: FontWeight.w400))),
          ],
        ),
        SizedBox(height: 12.h,),
        SizedBox(height: 220.h,
          child: BlocBuilder<MoviesPerSectionViewModel,MoviesPerSectionState>(
             builder: (context,state){
               if (state is MoviesPerSectionLoading){
                 return Center(child: CircularProgressIndicator(color: ColorsManager.yellow,),);
               }
               if(state is MoviesPerSectionSuccess){
                 return ListView.separated(
                     scrollDirection:Axis.horizontal,

                     itemBuilder: (context,index){
                       return SizedBox(
                           width: 146.w,
                           child: MovieItem(movie: state.moviesForSection[index],));
                     },
                     separatorBuilder: (context,index)=>SizedBox(width: 10.w,),
                     itemCount: state.moviesForSection.length);

               }
               return SizedBox.shrink();
             }

          ),

        )
      ],
    );
  }
}
