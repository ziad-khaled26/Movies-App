import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/mainLayout/browse/presentation/browse_view_model/browse_view_model.dart';
import 'package:movies/features/mainLayout/browse/presentation/widgets/custom_tab_bar_browse_screen.dart';
import 'package:movies/features/mainLayout/browse/presentation/widgets/filterd_movies_widget.dart';
import 'package:movies/features/mainLayout/home/data/models/movie.dart';
import 'package:movies/features/mainLayout/home/presentation/movies_list_view_model/movies_list_veiw_model.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  late List<String> categories;
  late List<Movie> filteredMovies;
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    categories=context.read<BrowseViewModel>().categories;
    context.read<BrowseViewModel>().getFilteredMoviesForEachCategory();
    _scrollController=ScrollController();
    _scrollController.addListener(onScroll);
    context.read<BrowseViewModel>().forceLoadMoreOnEntry();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomTabBarBrowseScreen(categories: categories),
            Expanded(
              child: BlocBuilder<BrowseViewModel,BrowseViewModelState>(
                builder: (context,state) {
                  if(state is GetFilteredMovies){
                    return FilteredMoviesWidget(filteredMovies: state.filteredMoviesForEachCategory,scrollController: _scrollController,);
                  }
                  return Container(width: double.infinity,height: 13,color: Colors.red,);
                  return SizedBox.shrink();
                },
      
              ),
            )
          ],
        ),
      ),
      floatingActionButton: IconButton(
        style: IconButton.styleFrom(
          backgroundColor: Colors.red
        ),
          onPressed: (){
        context.read<BrowseViewModel>().getMoreFilteredMovieForEachCategory();
      }, icon: Icon(Icons.add)),
    );
  }

  void onScroll(){
    if(!_scrollController.hasClients) return;

    final maxPosition=_scrollController.position.maxScrollExtent;
    final currentPosition=_scrollController.position.pixels;
    if(currentPosition>=maxPosition -200){
      context.read<BrowseViewModel>().getMoreFilteredMovieForEachCategory();
    }

  }
}
