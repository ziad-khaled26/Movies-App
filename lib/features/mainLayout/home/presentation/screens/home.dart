import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/resources/navigate_to_movie_details.dart';
import 'package:movies/features/mainLayout/home/presentation/movies_list_view_model/movies_list_veiw_model.dart';
import 'package:movies/features/mainLayout/home/presentation/widgets/home_three_section.dart';
import 'package:movies/features/mainLayout/home/presentation/widgets/movie_item.dart';

import '../../../../../core/resources/colors_manager.dart';
import '../../data/models/movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  fetchData()async{
    await context.read<MoviesListViewModel>().getMoviesList();

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          BlocBuilder<MoviesListViewModel, MoviesListState>(
            builder: (context, state) {
              if (state is MoviesListLoadedSuccessfully &&
                  state.movies.isNotEmpty &&
                  state.movies[state.selectedIndex].largeCoverImage != null) {
                final movie = state.movies[state.selectedIndex];
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        movie.largeCoverImage!,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }
              return CircularProgressIndicator();
            },
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorsManager.black.withOpacity(.30),
                  ColorsManager.black.withOpacity(.60),
                  ColorsManager.black,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, .47, 1],
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(ImageAssets.availableNow),

                  BlocBuilder<MoviesListViewModel, MoviesListState>(
                    builder: (context, state) {
                      if (state is MoviesListLoading) {
                        return CircularProgressIndicator();
                      }
                      if (state is MoviesListLoadedSuccessfully) {
                        return InkWell(
                          onTap: (){

                            Navigation.goToMovieDetails(context,state.movies[state.selectedIndex]);
                          },
                          child: CarouselSlider(
                            options: CarouselOptions(
                              height: 351.h,
                              viewportFraction: .6,
                              enlargeCenterPage: true,
                              autoPlay: false,
                              onPageChanged: (newIndex, _) {
                                context
                                    .read<MoviesListViewModel>()
                                    .changeBackGroundImage(newIndex);
                              },
                            ),
                            items: List.generate(
                              state.movies.length,
                                  (index) =>
                                  MovieItem(movie: state.movies[index]),
                            ),
                          ),
                        );
                      }
                      if (state is MoviesListError){
                        return Text(state.errorMessage);
                      }
                      return Container(
                        height: 200,
                        color: Colors.red,
                        width: double.infinity,
                      );
                    },
                  ),
                  Image.asset(ImageAssets.watchNow, scale: 1.1),
                  BlocBuilder<MoviesListViewModel,MoviesListState>(
                      builder: (context,state){
                        if(state is MoviesListLoading){
                          return const Center(child: CircularProgressIndicator(),);
                        }
                        if(state is MoviesListError){
                          return Text(state.errorMessage,style: TextStyle(color: ColorsManager.white),);
                        }
                        if(state is MoviesListLoadedSuccessfully){

                          return HomeThreeSection();


                        }
                        return SizedBox.shrink();
                      }
                  )
                 
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
