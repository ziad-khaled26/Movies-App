import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';
import 'package:movies/features/mainLayout/home/repositories_interface/repository_interface.dart';

class BrowseViewModel extends Cubit<BrowseViewModelState>{
  BrowseViewModel({required this.moviesRepository,required this.allMovies,required this.categories}):super(InitialState());
  final MoviesRepository moviesRepository;
  final List<Movie> allMovies;
  final List<String> categories;
  late String currentCategory=categories[0];
   List<Movie> filteredMoviesForEachCategory=[];
   int pageCount=1;


  List<Movie> getFilteredMoviesForEachCategory(){
    List<Movie> filteredMovies=[];
    allMovies.forEach((movie){
      if(movie.genres!.contains(currentCategory)){
        filteredMovies.add(movie);
      };

    });
    filteredMoviesForEachCategory=filteredMovies;
    emit(GetFilteredMovies(filteredMoviesForEachCategory: filteredMoviesForEachCategory));
    return filteredMovies;
  }
  Future<void> forceLoadMoreOnEntry() async {
    while(filteredMoviesForEachCategory.length < 6) {
      await getMoreFilteredMovieForEachCategory();
      emit(GetFilteredMovies(filteredMoviesForEachCategory: filteredMoviesForEachCategory));
    }
  }

  getMoreFilteredMovieForEachCategory()async{
    pageCount=pageCount+1;
    var result=  await moviesRepository.getMoviesList(page: pageCount);
    log(pageCount.toString());
    result.fold((error){},
      (newMovies){
      List<Movie>moreFilteredMovies=filteredMoviesForEachCategory;
      newMovies.forEach((newMovie){
        if(newMovie.genres!.contains(currentCategory)){
          moreFilteredMovies.add(newMovie);

        }
      });
      filteredMoviesForEachCategory=moreFilteredMovies;
      emit(GetFilteredMovies(filteredMoviesForEachCategory: moreFilteredMovies));

      }
    );

  }







}

class BrowseViewModelState{}
class InitialState extends BrowseViewModelState{}
class InitialFilteredMovies extends BrowseViewModelState{
   final List<Movie> initialFilteredMovie;
   InitialFilteredMovies({required this.initialFilteredMovie});

}
class MoreMoviesSuccess extends BrowseViewModelState{

}
class GetFilteredMovies extends BrowseViewModelState{
  final List<Movie> filteredMoviesForEachCategory;
  GetFilteredMovies({required this.filteredMoviesForEachCategory});
}
class MoviesTapped extends BrowseViewModelState{
  final List<Movie> filteredList;
  MoviesTapped({required this.filteredList});

}