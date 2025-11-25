import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';
import 'package:movies/features/mainLayout/home/presentation/screens/home.dart';
import 'package:movies/features/mainLayout/main_layout.dart';
import 'package:movies/features/movie_details/%20presentation/screens/movie_details.dart';

abstract class RoutesManager{
  static const String mainLayout = "/mainLayout";
  static const String movieDetails="/movieDetails";

  static  Route? getRoute(RouteSettings settings){
    switch(settings.name){
      case mainLayout:{
        return CupertinoPageRoute(
            builder: (context)=>MainLayout()
        );
      }
      case movieDetails:{
        return CupertinoPageRoute(
          settings: settings,
            builder: (context){
            final movie=ModalRoute.of(context)?.settings.arguments as Movie;
            return MovieDetails(selectedMovie: movie);
            }
        );
      }

    }
  }

}