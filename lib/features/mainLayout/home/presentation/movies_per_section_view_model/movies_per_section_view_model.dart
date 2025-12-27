import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/mainLayout/home/repositories_interface/repository_interface.dart';

import '../../data/models/movie.dart';

//for all three sections
class MoviesPerSectionViewModel extends Cubit<MoviesPerSectionState>{
  MoviesPerSectionViewModel({required this.sectionName,required this.moviesRepository}):super(InitialState());
  final String sectionName;
  final MoviesRepository moviesRepository;
  int pageCount=1;
  List<Movie> moviesPerSection=[];
  getMoviesBasedOnSectionName()async{
    emit(MoviesPerSectionLoading());
    var result =await moviesRepository.getMoviesList(limit: 3,genre: sectionName);
    result.fold((errorMessage){},
        (moviesList){
      moviesPerSection=moviesList;
      emit(MoviesPerSectionSuccess(moviesForSection: moviesList,sectionName: sectionName));

        });
  }

  loadMoreMoviesPerSection()async{
    pageCount=pageCount+1;
    var result =await moviesRepository.getMoviesList(limit: 3,genre: sectionName,page: pageCount);
    log(pageCount.toString());
    result.fold((error){},
            (newMoviesList){
      moviesPerSection.addAll(newMoviesList);
      emit(MoviesPerSectionSuccess(moviesForSection: moviesPerSection,sectionName:sectionName));
            });

  }


}

class MoviesPerSectionState{}
class InitialState extends MoviesPerSectionState{}
class MoviesPerSectionSuccess extends MoviesPerSectionState{
  final List<Movie> moviesForSection;
  final String sectionName;
  MoviesPerSectionSuccess( {required this.moviesForSection,required this.sectionName});
}
class MoviesPerSectionLoading extends MoviesPerSectionState{}
class MoviesPerSectionError extends MoviesPerSectionState{}