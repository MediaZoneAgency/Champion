import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CoursePreviewWidget extends StatefulWidget {
  @override
  _CoursePreviewWidgetState createState() => _CoursePreviewWidgetState();
}

class _CoursePreviewWidgetState extends State<CoursePreviewWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://example.com/course-preview.mp4',
    )..initialize().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
        Positioned(
          top: 16.0,
          right: 16.0,
          child: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              // Handle close button press
            },
          ),
        ),
        Positioned(
          bottom: 16.0,
          left: 16.0,
          right: 16.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle enroll button press
                },
                child: Text('Enroll'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle preview button press
                },
                child: Text('Preview'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}