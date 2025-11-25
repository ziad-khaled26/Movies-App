import 'package:flutter/material.dart';
import 'package:movies/core/resources/routes_manager.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';

class Navigation{

  static Future<void> goToMovieDetails(BuildContext context ,Movie movie)async{
    await Navigator.pushNamed(context, RoutesManager.movieDetails,arguments: movie);
  }
}

