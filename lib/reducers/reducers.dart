import 'package:built_redux/built_redux.dart';
import 'package:video_player/video_player.dart';
import 'package:video_test/actions/actions.dart';
import 'package:video_test/models/app_state.dart';
import 'package:video_test/models/video.dart';

final reducerBuilder = ReducerBuilder<AppState, AppStateBuilder>()
    ..add(AppActionsNames.fecthVideoAction, _fetchVideo)
    ..add(AppActionsNames.selectVideoAction, _selectVideo)
    ..add(AppActionsNames.toggleAudioAction, _toggleAudio)
    ..add(AppActionsNames.playerInitActions, _playerInit);

void _fetchVideo(AppState state, Action<Null> action, AppStateBuilder builder) {
  List<Video> videos = [
    Video.fromUrl("https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4"),
    Video.fromUrl("http://techslides.com/demos/sample-videos/small.mp4"),
    Video.fromUrl("http://techslides.com/demos/sample-videos/small.mp4"),
    Video.fromUrl("http://techslides.com/demos/sample-videos/small.mp4"),

  ];
  builder
    ..videos = List.castFrom(videos)
    ..nowPlayingIndex = 0;
}

void _selectVideo(AppState state, Action<int> action, AppStateBuilder builder) {
  builder.nowPlayingIndex =action.payload;
}

void _toggleAudio(AppState state, Action<Null> action, AppStateBuilder builder) {
  builder.soundIsOn = !builder.soundIsOn;
  builder.controller.setVolume(builder.soundIsOn ? 1.0 : 0.0);
}

void _playerInit(AppState state, Action<VideoPlayerController> action, AppStateBuilder builder) {
  builder.controller = action.payload;
}
