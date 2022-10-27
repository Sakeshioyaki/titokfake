import 'package:flutter/material.dart';
import 'package:tiktok_fake/common/app_colors.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPlayerItem extends StatefulWidget {
  final String? videoUrl;

  VideoPlayerItem({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(widget.videoUrl!)
      ..initialize();
    _videoController.play();
    _videoController.setLooping(true);
    _videoController.setVolume(0.0);
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ObjectKey(_videoController),
      onVisibilityChanged: (visibility) {
        if (visibility.visibleFraction > 0.8) {
          _videoController.play();
        } else {
          _videoController.pause();
        }
      },
      child: Container(
        decoration: const BoxDecoration(color: AppColors.blackAuth),
        child: VideoPlayer(_videoController),
      ),
    );
  }
}
