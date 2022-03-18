import 'package:flutter/material.dart';

import '../widgets/videoplayer.dart';

class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: loadVideo(),
    );
  }

  Widget loadVideo() => NetworkPlayerWidget(
        url: url,
      );
}
