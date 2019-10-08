import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:video_test/actions/actions.dart';
import 'package:video_test/models/app_state.dart';
import 'package:video_test/presentation/video_list.dart';

class VideoListPage extends StoreConnector<AppState, AppActions, AppState>{
  @override
  Widget build(BuildContext context, state, AppActions actions) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('FFFFUUUCK'),
      ),
      body: VideoList(
        state.videos,
        nowPlayingIndex: state.nowPlayingIndex,
        onVideoSelected: (index) => actions.selectVideoAction(index),
        audioIsOn: state.soundIsOn,
        toggleAudio: () => actions.toggleAudioAction(),
        onVideoInit: (controller) => actions.playerInitActions(controller),
      ),
    );
  }

  @override
  connect(state) => state;

}