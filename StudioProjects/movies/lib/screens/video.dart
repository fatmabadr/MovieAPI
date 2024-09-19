import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class VideoScreen extends StatefulWidget {
  String video_id;
  VideoScreen({super.key,required this.video_id});

  @override
  State<VideoScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoScreen> {
  late YoutubePlayerController _controller;


  @override
  void initState() {
    print('________________________________________________________________');
    print( "https://www.youtube.com/watch?v=${widget.video_id}");
    print('________________________________________________________________');
    final videoID = YoutubePlayer.convertUrlToId(
        "https://www.youtube.com/watch?v=${widget.video_id}");
    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: YoutubePlayerFlags(autoPlay: false));
    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.amber,
      progressColors: const ProgressBarColors(
        playedColor: Colors.amber,
        handleColor: Colors.amberAccent,
      ),

    ),
    );
  }
}