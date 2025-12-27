import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/features/torrent_player_secreen/presentation/movie_stream_view_model/movie_stream_view_model.dart';
import 'package:video_player/video_player.dart';

class MovieStreamScreen extends StatefulWidget {
  const MovieStreamScreen({super.key});

  @override
  State<MovieStreamScreen> createState() => _MovieStreamScreenState();
}

class _MovieStreamScreenState extends State<MovieStreamScreen> {
   VideoPlayerController? controller;
  @override
  void initState() {
    super.initState();
    fetchMovie();
  }
  fetchMovie()async{
    String streamUrl =await context.read<MovieStreamViewModel>().setupAndPlay();
    log(streamUrl);
    final videoController=VideoPlayerController.networkUrl(Uri.parse(streamUrl));
    await videoController.initialize();
    await videoController.play();
    setState(() {

      controller=videoController;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieStreamViewModel,MovieStreamState>(
          builder: (context,state){
            if (state is MovieStreamLoading){
              return Center(child: CircularProgressIndicator(color: ColorsManager.yellow,),);
            }
            if(state is MovieStreamError){
              return Center(child: Text(state.error,style: TextStyle(fontSize: 24,color: Colors.red),));
            }
            if(state is MovieStreamSuccess && controller!=null &&controller!.value.isInitialized ){
              return  Center(
                  child:
                  controller!.value.isInitialized
                      ? AspectRatio(
                    aspectRatio: controller!.value.aspectRatio,
                    child: VideoPlayer(controller!),
                  )
                      : Container());
            }
            return SizedBox.shrink();
          }
      ),
    );
  }
}
