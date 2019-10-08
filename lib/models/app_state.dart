import 'package:built_value/built_value.dart';
import 'package:video_player/video_player.dart';
import 'package:video_test/models/video.dart';
part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder>{
  @nullable
  int get nowPlayingIndex;

  bool get soundIsOn;

  @nullable
  List<Video> get videos;

  @nullable
  VideoPlayerController get controller;

  AppState._();

  factory AppState([updates(AppStateBuilder b)]) => _$AppState((b)=>b
      ..soundIsOn = true
      ..update(updates));
}