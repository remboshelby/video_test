// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actions.dart';

// **************************************************************************
// BuiltReduxGenerator
// **************************************************************************

// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: annotate_overrides

class _$AppActions extends AppActions {
  factory _$AppActions() => new _$AppActions._();
  _$AppActions._() : super._();

  final ActionDispatcher<Null> fecthVideoAction =
      new ActionDispatcher<Null>('AppActions-fecthVideoAction');
  final ActionDispatcher<int> selectVideoAction =
      new ActionDispatcher<int>('AppActions-selectVideoAction');
  final ActionDispatcher<Null> toggleAudioAction =
      new ActionDispatcher<Null>('AppActions-toggleAudioAction');
  final ActionDispatcher<VideoPlayerController> playerInitActions =
      new ActionDispatcher<VideoPlayerController>(
          'AppActions-playerInitActions');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    fecthVideoAction.setDispatcher(dispatcher);
    selectVideoAction.setDispatcher(dispatcher);
    toggleAudioAction.setDispatcher(dispatcher);
    playerInitActions.setDispatcher(dispatcher);
  }
}

class AppActionsNames {
  static final ActionName<Null> fecthVideoAction =
      new ActionName<Null>('AppActions-fecthVideoAction');
  static final ActionName<int> selectVideoAction =
      new ActionName<int>('AppActions-selectVideoAction');
  static final ActionName<Null> toggleAudioAction =
      new ActionName<Null>('AppActions-toggleAudioAction');
  static final ActionName<VideoPlayerController> playerInitActions =
      new ActionName<VideoPlayerController>('AppActions-playerInitActions');
}
