import 'package:built_redux/built_redux.dart';
import 'package:video_player/video_player.dart';

part 'actions.g.dart';

abstract class AppActions implements ReduxActions {
  factory AppActions() = _$AppActions;

  AppActions._();

  ActionDispatcher<Null> fecthVideoAction;
  ActionDispatcher<int> selectVideoAction;
  ActionDispatcher<Null> toggleAudioAction;
  ActionDispatcher<VideoPlayerController> playerInitActions;
}