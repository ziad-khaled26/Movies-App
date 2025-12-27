import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/movie_details/data/models/movie_details_response/movie_details.dart';
import 'package:movies/features/movie_details/repositories_interface/movie_details_repository_interface.dart';
class MovieDetailsScreenViewModel extends Cubit<MovieDetailsState>{
  MovieDetailsScreenViewModel({required this.moviesDetailsRepositoryInterface}):super(InitialState());
   MoviesDetailsRepositoryInterface moviesDetailsRepositoryInterface;

  Future<void>getMovieDetails(int movieId)async{
    emit(MovieDetailsLoading());
    var result=await moviesDetailsRepositoryInterface.getMovieDetails(movieId);
    result.fold((errorMessage){
      emit(MovieDetailsError(errorMessage: errorMessage));
    }, (movieDetails){
      emit(MovieDetailsSuccess(movieDetails: movieDetails));
    });

  }


}

class MovieDetailsState{}

class InitialState extends MovieDetailsState{}

class MovieDetailsLoading extends MovieDetailsState{}

class MovieDetailsError extends MovieDetailsState{
  final String errorMessage;
  MovieDetailsError({required this.errorMessage});
}

class MovieDetailsSuccess extends MovieDetailsState{
  final MovieDetails movieDetails;
  MovieDetailsSuccess({required this.movieDetails});
}