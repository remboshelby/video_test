import 'package:built_redux/built_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:video_test/presentation/video_list_screen.dart';
import 'package:video_test/reducers/reducers.dart';

import 'actions/actions.dart';
import 'models/app_state.dart';

void main() => runApp(VideoListApp());

class VideoListApp extends StatefulWidget {
  final store = Store<AppState, AppStateBuilder, AppActions>(
    reducerBuilder.build(),
    AppState(),
    AppActions(),
  );
  // This widget is the root of your application.
  @override
  _VideoListAppState createState() => _VideoListAppState();
}

class _VideoListAppState extends State<VideoListApp> {
  Store<AppState, AppStateBuilder, AppActions> store;


  @override
  void initState() {
    store = widget.store;
    store.actions.fecthVideoAction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReduxProvider(
      store: store,
      child: MaterialApp(
        home: VideoListPage(),
      ),
    );
  }
}


