import 'package:flutter/material.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';
import 'package:movies/features/movie_details/%20presentation/widgets/movie_details_header.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key,required this.selectedMovie});
  final Movie selectedMovie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MovieDetailsHeader(movie: selectedMovie),
      ),
    );
  }
}
