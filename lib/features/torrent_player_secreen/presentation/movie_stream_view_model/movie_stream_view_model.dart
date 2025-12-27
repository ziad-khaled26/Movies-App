import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/torrent_player_secreen/data/api/movie_stream_service.dart';

class MovieStreamViewModel extends Cubit<MovieStreamState>{
  MovieStreamViewModel({required this.torrentUrl}):super(MovieStreamInitialState());
  MovieStreamService service=MovieStreamService();
  String torrentUrl;
  Future<String> setupAndPlay()async{
    emit(MovieStreamLoading());
    try{
      String taskId=await service.startTorrent(torrentUrl);
      String streamUrl=await service.waitUntilReady(taskId);

      emit(MovieStreamSuccess(streamUrl: streamUrl));
      return streamUrl;
    }
    catch(exception){
      emit(MovieStreamError(error: exception.toString()));
      return exception.toString();
    }
  }
}


class MovieStreamState{}
class MovieStreamInitialState extends MovieStreamState{}
class MovieStreamLoading extends MovieStreamState{}
class MovieStreamError extends MovieStreamState{
  MovieStreamError({required this.error});
   final String error;
}
class MovieStreamSuccess extends MovieStreamState{
  MovieStreamSuccess({required this.streamUrl});
  String streamUrl;
}
