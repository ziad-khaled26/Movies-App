import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';
import 'package:movies/features/movie_details/%20presentation/movie_suggestions_view_model.dart';
import 'package:movies/features/movie_details/%20presentation/widgets/movie_details_info_section/movie_details_info_section.dart';
import 'package:movies/features/movie_details/%20presentation/widgets/movie_details_stats_row.dart';
import 'package:movies/features/movie_details/%20presentation/widgets/screen_shots_section.dart';
import 'package:movies/features/movie_details/%20presentation/widgets/similir_movies.dart';

import '../movie_details_screen_view_model.dart';
import '../widgets/movie_details_header.dart';

class MovieDetailsScreen extends StatefulWidget {
   const MovieDetailsScreen({super.key,required this.selectedMovie});
   final Movie selectedMovie;



  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  fetchData()async{
   await context.read<MovieDetailsScreenViewModel>().getMovieDetails(widget.selectedMovie.id!);
    context.read<MovieSuggestionsViewModel>().getMovieSuggestions(widget.selectedMovie.id!);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              MovieDetailsHeader(movie: widget.selectedMovie),
              BlocBuilder<MovieDetailsScreenViewModel,MovieDetailsState>(

                //build when || all states
                builder: (context,state){
                  if(state is MovieDetailsLoading){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if(state is MovieDetailsSuccess){
                    return Column(
                      children: [
                        StatsRow(movieDetails: state.movieDetails),
                        SizedBox(height: 16.h,),
                        ScreenShotsSection(movieDetails: state.movieDetails),
                      ],
                    );
                  }
                  if(state is MovieDetailsError){
                    return Text(state.errorMessage,style: TextStyle(fontSize: 16.sp,color: Colors.deepOrange),);
                  }
                  return SizedBox.shrink();
                },
              ),
              BlocBuilder<MovieSuggestionsViewModel,MovieSuggestionsState>
                (builder: (context,state){
                  if(state is MovieSuggestionsLoading){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if(state is MovieSuggestionsError){
                    return Text(state.errorMessage,style: TextStyle(fontSize: 16.sp,color: Colors.deepOrange),);
                  }
                  if(state is MovieSuggestionsSuccess){
                    return SimilarMovies(movieSuggestions: state.moviesSuggestions);
                  }
                  return SizedBox.shrink();
              }
              ),
              //info section
              BlocBuilder<MovieDetailsScreenViewModel,MovieDetailsState>(
                builder: (context,state){
                  if(state is MovieDetailsLoading){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if(state is MovieDetailsSuccess){
                   return MovieDetailsInfoSection(movieDetails: state.movieDetails);
                  }
                  if(state is MovieDetailsError){
                    return Text(state.errorMessage,style: TextStyle(fontSize: 16.sp,color: Colors.deepOrange),);
                  }
                  return SizedBox.shrink();
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
