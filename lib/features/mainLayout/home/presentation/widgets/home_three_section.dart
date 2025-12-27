import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/features/mainLayout/home/data/api/api_service.dart';
import 'package:movies/features/mainLayout/home/data/data_sources/movies_list_api_data_source.dart';
import 'package:movies/features/mainLayout/home/data/repositories_impl/movies_list_repository_impl.dart';
import 'package:movies/features/mainLayout/home/presentation/movies_list_view_model/movies_list_veiw_model.dart';
import 'package:movies/features/mainLayout/home/presentation/movies_per_section_view_model/movies_per_section_view_model.dart';
import 'package:movies/features/mainLayout/home/presentation/widgets/movies_per_section.dart';

class HomeThreeSection extends StatelessWidget {
  const HomeThreeSection({super.key});

  @override
  Widget build(BuildContext context) {
    var homeSectionsNames=context.read<MoviesListViewModel>().homeSections;
    log("${homeSectionsNames}");
    log("${context.read<MoviesListViewModel>().categories}");
    return Column(
      children: [
        BlocProvider(
          create:(context) =>MoviesPerSectionViewModel(sectionName: homeSectionsNames[0],moviesRepository: MoviesListRepositoryImpl(moviesListDataSource: MoviesListApiDataSource(apiService: APIService()))),

            child: MoviesPerSection()),
        BlocProvider(
            create:(context) =>MoviesPerSectionViewModel(sectionName: homeSectionsNames[1],moviesRepository: MoviesListRepositoryImpl(moviesListDataSource: MoviesListApiDataSource(apiService: APIService()))),

            child: MoviesPerSection()),
        BlocProvider(
            create:(context) =>MoviesPerSectionViewModel(sectionName: homeSectionsNames[2],moviesRepository: MoviesListRepositoryImpl(moviesListDataSource: MoviesListApiDataSource(apiService: APIService()))),

            child: MoviesPerSection())

      ],
    );
  }
}
