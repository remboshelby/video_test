import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:video_test/models/video.dart';
import 'package:video_test/presentation/video_widget.dart';

class VideoList extends StatelessWidget {
  final List<Video> items;
  final int nowPlayingIndex;
  final Function(int) onVideoSelected;
  final bool audioIsOn;
  final Function toggleAudio;
  final Function onVideoInit;

  VideoList(this.items,
      {this.nowPlayingIndex,
        this.onVideoSelected,
        this.audioIsOn,
        this.toggleAudio,
        this.onVideoInit});

  @override
  Widget build(BuildContext context) =>
      NotificationListener(
        child: ListView.builder(
          itemBuilder: (ctx, pos) =>
              MetaData(
                key: ValueKey("$pos"),
                behavior: HitTestBehavior.translucent,
                metaData: pos,
                child: Stack(
                  children: <Widget>[
                    VideoWidget(ValueKey("$pos${pos == nowPlayingIndex}"),
                        items[pos].url, pos == nowPlayingIndex, onVideoInit),
                    Positioned(
                      key: ValueKey("$audioIsOn"),
                      bottom: 16,
                      right: 16,
                      child: IconButton(
                        padding: EdgeInsets.all(8),
                        icon: Icon(
                          audioIsOn ? Icons.volume_up : Icons.volume_mute,
                          color: Colors.white,
                        ),
                        onPressed: toggleAudio,
                      ),
                    )
                  ],
                ),
              ),
          itemCount: items.length,
        ),
        onNotification: (notification){
          if (notification is ScrollEndNotification)
            Future.microtask((){
              _onScrollEnd(notification);
            });
          return false;
        },
      );

  void _onScrollEnd(ScrollEndNotification notification) {
    final box = notification.context.findRenderObject() as RenderBox;
    final globalOffset = box.localToGlobal(Offset(0, box.size.height / 2));
    final centerItem = _checkPositionAtOffset(globalOffset);
    if (centerItem != null && centerItem !=nowPlayingIndex){
      onVideoSelected(centerItem);
    }
  }
  int _checkPositionAtOffset(Offset globalOffset){
    final HitTestResult result = new HitTestResult();
    WidgetsBinding.instance.hitTest(result, globalOffset);
    int centerPosition;
    for (HitTestEntry entry in result.path){
      if (entry.target is RenderMetaData) {
        final renderMetaData = entry.target as RenderMetaData;
        if (renderMetaData.metaData is int) {
          centerPosition = renderMetaData.metaData as int;
          break;
        }
      }
    }
    return centerPosition;
  }
}
