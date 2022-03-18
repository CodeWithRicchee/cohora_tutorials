import 'dart:js';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class NetworkPlayerWidget extends StatefulWidget {
  const NetworkPlayerWidget({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  _NetworkPlayerWidgetState createState() => _NetworkPlayerWidgetState();
}

class _NetworkPlayerWidgetState extends State<NetworkPlayerWidget> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.network(widget.url)
      ..addListener(() => setState(() {}))
      ..setLooping(false)
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      alignment: Alignment.center,
      child: Column(
        children: [
          VideoPlayerWidget(controller: controller),
        ],
      ),
    );
  }
}

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return controller != null && controller.value.isInitialized
        ? Container(alignment: Alignment.topCenter, child: buildVideo())
        : Container(
            height: size.height - 56,
            child: const Center(child: CircularProgressIndicator()),
          );
  }

  Widget buildVideo() => Stack(
        children: <Widget>[
          NetworkVideoPlayer(
            controller: controller,
          ),
          Positioned.fill(child: OverlayWidget(controller: controller)),
        ],
      );
}

class NetworkVideoPlayer extends StatelessWidget {
  const NetworkVideoPlayer({Key? key, required this.controller})
      : super(key: key);
  final VideoPlayerController controller;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height - 56,
      alignment: Alignment.topCenter,
      child: VideoPlayer(controller),
    );
  }
}

class OverlayWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const OverlayWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () =>
            controller.value.isPlaying ? controller.pause() : controller.play(),
        child: Stack(
          children: [
            videoPlay(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: progressIndicator(),
            ),
          ],
        ),
      );

  Widget progressIndicator() => VideoProgressIndicator(
        controller,
        allowScrubbing: true,
      );

  Widget videoPlay() => controller.value.isPlaying
      ? Container()
      : Container(
          alignment: Alignment.center,
          color: Colors.black26,
          child: const Icon(Icons.play_arrow, color: Colors.white, size: 80),
        );
}
