import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';
import 'package:movies/features/mainLayout/home/presentation/widgets/movies_per_section.dart';
import 'package:movies/features/mainLayout/home/repositories_interface/movies_category_based_repo.dart';
import 'package:movies/features/mainLayout/home/repositories_interface/repository_interface.dart';

class MoviesListViewModel extends Cubit<MoviesListState> {
  MoviesListViewModel({required this.moviesRepository,}) : super(InitialState());
  final MoviesRepository moviesRepository;
   List<String> categories=[];
   List<String> homeSections=[];
   List<Movie> movies=[];
  final random = Random();

  getMoviesList() async {
    emit(MoviesListLoading());
    var result = await moviesRepository.getMoviesList();
    result.fold(
      (message) {
        emit(MoviesListError(errorMessage: message));
      },
      (moviesList) {
       List<String> categoriesNames=getAllCategoriesName(moviesList);
       List<String> sectionsForHome=pickRandomSections(categoriesNames, 3);
       // List<Widget> sectionsWidget=getSectionsWidget(sectionsForHome, moviesList);

       homeSections=sectionsForHome;
       categories=categoriesNames;
       movies=moviesList;
        emit(
          MoviesListLoadedSuccessfully(
              movies: moviesList,
              selectedIndex: 0,
            categories: categoriesNames,
            sections: sectionsForHome,
            // sectionsWidget: sectionsWidget


          ),
        );
      },
    );
  }


  // List<Widget>getSectionsWidget(List<String> sections,List<Movie> movies){
  //
  //   return sections.map((sectionName){
  //     List<Movie> moviesPerSection=movies.where((movie)=>(movie.genres??[]).contains(sectionName)).toList();
  //     return MoviesPerSection(sectionsName: sections, filteredMovies: moviesPerSection, sectionName: sectionName);
  //   }).toList();
  // }

  List<String> pickRandomSections(List<String> categories,int count){
    final copyList=categories;
    copyList.shuffle(random);
    return copyList.take(count).toList();

  }

  void refreshSectionsForHome() {
    final currentState = state;
    if (currentState is MoviesListLoadedSuccessfully) {
      final newSections = pickRandomSections(currentState.categories, 3);

      emit(
        currentState.copyWith(
          sections: newSections,
        ),
      );
    }
  }


  List<String> getAllCategoriesName(List<Movie> movies){
    Set<String> genres={};
    movies.forEach((movie){
      movie.genres?.forEach((genre){
        genres.add(genre);
      });

    });
    return genres.toList();
  }



  List<Movie> getFilteredMovies(String categoryName){
    List<Movie> filteredMovies=[];
    movies.forEach((movie){
      if(movie.genres!.contains(categoryName)){
        filteredMovies.add(movie);
      }
    });
    emit(FilteredMovies(filteredMovies: filteredMovies));
    return filteredMovies;
  }




  void changeBackGroundImage(int newIndex) {
    final currentState = state;
    if (currentState is MoviesListLoadedSuccessfully) {
      emit(currentState.copyWith(selectedIndex: newIndex));
    }
  }
}

class MoviesListState {}

class InitialState extends MoviesListState {}

class MoviesListLoading extends MoviesListState {}

class MoviesListError extends MoviesListState {
  final String errorMessage;
  MoviesListError({required this.errorMessage});
}

class MoviesListLoadedSuccessfully extends MoviesListState {
  final List<Movie> movies;
  final int selectedIndex;
  final List<String> categories;
  final List<String> sections;
  // final List<Widget> sectionsWidget;


  MoviesListLoadedSuccessfully({
    required this.movies,
    this.selectedIndex = 0,
    required this.categories,
    required this.sections,
    // required this.sectionsWidget


  });

  MoviesListLoadedSuccessfully copyWith({
    List<Movie>? movies,
    int? selectedIndex,
    List<String>? genres,
    List<String>? sections,
    List<Widget>? sectionsWidget
  }) {
    return MoviesListLoadedSuccessfully(
      movies: movies ?? this.movies,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      categories: genres?? this.categories,
      sections: sections?? this.sections,
      // sectionsWidget: sectionsWidget?? this.sectionsWidget,

    );
  }
}
class FilteredMovies extends MoviesListState{
  List<Movie> filteredMovies;
  FilteredMovies({required this.filteredMovies});
}






