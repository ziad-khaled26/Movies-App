import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/mainLayout/home/data/api/api_service.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';
import 'package:movies/features/mainLayout/home/presentation/screens/home.dart';
import 'package:movies/features/mainLayout/main_layout.dart';
import 'package:movies/features/movie_details/%20presentation/movie_details_screen_view_model.dart';
import 'package:movies/features/movie_details/%20presentation/movie_suggestions_view_model.dart';
import 'package:movies/features/movie_details/%20presentation/screens/movie_details_screen.dart';
import 'package:movies/features/movie_details/data/data_sources/movie_details_api_data_source/movie_details_api_data_source.dart';
import 'package:movies/features/movie_details/data/repositories_impl/movie_details_repository_impl.dart';
import 'package:movies/features/torrent_player_secreen/presentation/movie_stream_view_model/movie_stream_view_model.dart';
import 'package:movies/features/torrent_player_secreen/presentation/screens/movie_stream_screen.dart';

import '../../features/mainLayout/home/data/data_sources/movies_list_api_data_source.dart';
import '../../features/mainLayout/home/data/repositories_impl/movies_list_repository_impl.dart';
import '../../features/mainLayout/home/presentation/movies_list_view_model/movies_list_veiw_model.dart';

abstract class RoutesManager {
  static const String mainLayout = "/mainLayout";
  static const String movieDetails = "/movieDetails";
  static const String movieStreamScreen = "/movieStreamScreen";

  static Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainLayout:
        {
          return CupertinoPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => MoviesListViewModel(
                moviesRepository: MoviesListRepositoryImpl(
                  moviesListDataSource: MoviesListApiDataSource(
                    apiService: APIService(),
                  ),
                ),
              ),
              child: MainLayout(),
            ),
          );
        }
      case movieDetails:
        {
          return CupertinoPageRoute(
            settings: settings,
            builder: (context) {
              final movie = ModalRoute.of(context)?.settings.arguments as Movie;
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => MovieDetailsScreenViewModel(
                      moviesDetailsRepositoryInterface:
                          MovieDetailsRepositoryImpl(
                            dataSource: MovieDetailsApiDataSource(
                              apiService: APIService(),
                            ),
                          ),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => MovieSuggestionsViewModel(
                      moviesDetailsRepositoryInterface:
                          MovieDetailsRepositoryImpl(
                            dataSource: MovieDetailsApiDataSource(
                              apiService: APIService(),
                            ),
                          ),
                    ),
                  ),
                ],
                child: MovieDetailsScreen(selectedMovie: movie),
              );
            },
          );
        }
      case movieStreamScreen:
        {
          return CupertinoPageRoute(
            settings: settings,

              builder: (context){
                String torrentUrl=ModalRoute.of(context)?.settings.arguments as String;
                return BlocProvider(
                  create: (context)=>MovieStreamViewModel(torrentUrl: torrentUrl),
                  child: MovieStreamScreen(),

                );

              }
          );
        }
    }
  }
}
