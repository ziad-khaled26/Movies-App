import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/mainLayout/home/presentation/widgets/movie_item.dart';

import '../../../home/data/models/movie.dart';

class FilteredMoviesWidget extends StatelessWidget {
  const FilteredMoviesWidget({super.key,required this.filteredMovies, required this.scrollController});
  final List<Movie> filteredMovies;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
      shrinkWrap: true,
      controller: scrollController,
      crossAxisSpacing: 20.w,
      mainAxisSpacing: 8.h,
      childAspectRatio: 189/279,
      children: [
        for(var movie in filteredMovies)
          MovieItem(movie: movie)
      ],
    );
  }
}
