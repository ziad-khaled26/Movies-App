import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';
import 'package:movies/features/movie_details/repositories_interface/movie_details_repository_interface.dart';

class MovieSuggestionsViewModel extends Cubit<MovieSuggestionsState>{
  MovieSuggestionsViewModel({required this.moviesDetailsRepositoryInterface}):super(InitialMovieSuggestionsState());
  final MoviesDetailsRepositoryInterface moviesDetailsRepositoryInterface;

  getMovieSuggestions(int movieId)async{
    emit(MovieSuggestionsLoading());
    var result=await moviesDetailsRepositoryInterface.getMovieSuggestions(movieId);
    result.fold(
            (errorMessage){
              emit(MovieSuggestionsError(errorMessage: errorMessage));
            }
        ,(movies){
              emit(MovieSuggestionsSuccess(moviesSuggestions: movies));
    } );
  }
}




class MovieSuggestionsState{}
class InitialMovieSuggestionsState extends MovieSuggestionsState{}
class MovieSuggestionsLoading extends MovieSuggestionsState{}
class MovieSuggestionsError extends MovieSuggestionsState{
  final String errorMessage;
  MovieSuggestionsError({required this.errorMessage});
}
class MovieSuggestionsSuccess extends MovieSuggestionsState{
  final List<Movie> moviesSuggestions;
  MovieSuggestionsSuccess({required this.moviesSuggestions});
}