import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(MaterialApp(home: VideoPlayerScreen()));

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the VideoPlayerController for streaming a video from a URL
    _controller = VideoPlayerController.network(
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',  // Replace with your video URL
    )..initialize().then((_) {
      // Once the video is initialized, update the state to show the video
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();  // Clean up the controller when the widget is disposed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : CircularProgressIndicator(), // Show a loading indicator while the video is initializing
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // Toggle play/pause when the button is pressed
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
