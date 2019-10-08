import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final String _url;
  final bool _autoPlay;
  final Function _onVideoInit;

  VideoWidget(Key key, this._url, this._autoPlay, this._onVideoInit)
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoPlayerController _controller;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      height: 420,
      child: Center(
        child: !_controller.value.initialized
            ? CircularProgressIndicator()
            : FittedBox(
                key: ValueKey(widget._url),
                fit: BoxFit.fitHeight,
                child: Container(
                  width: _controller.value.size.width,
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
      ),
    );
  }

  _VideoWidgetState();

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget._url)
      ..initialize().then((_) {
        widget._onVideoInit(_controller);
        setState(() {
          if (widget._autoPlay) _controller.play();
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
