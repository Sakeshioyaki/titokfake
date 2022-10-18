import 'package:flutter/material.dart';
import 'package:tiktok_fake/common/app_colors.dart';
import 'package:tiktok_fake/screen/home/widget/left_panel.dart';
import 'package:tiktok_fake/screen/home/widget/right_panel.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPlayerItem extends StatefulWidget {
  final String? videoUrl;
  final String? name;
  final String? caption;
  final String? songName;
  final String? profileImg;
  final String? likes;
  final String? comments;
  final String? shares;
  final String? albumImg;
  final String? bookMark;

  VideoPlayerItem({
    Key? key,
    required this.size,
    this.name,
    this.caption,
    this.songName,
    this.profileImg,
    this.likes,
    this.comments,
    this.shares,
    this.albumImg,
    this.videoUrl,
    this.bookMark,
  }) : super(key: key);

  final Size size;

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController _videoController;
  bool isShowPlaying = false;
  double opacity = 0.4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _videoController = VideoPlayerController.asset(widget.videoUrl!)
          ..initialize()
        //     .then((value) {
        //   _videoController.play();
        //   setState(() {
        //     isShowPlaying = false;
        //   });
        // })
        ;
    _videoController.setLooping(true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoController.dispose();
  }

  Widget isPlaying() {
    return _videoController.value.isPlaying && !isShowPlaying
        ? Container()
        : Icon(
            Icons.play_arrow_rounded,
            size: 80,
            color: AppColors.whiteAuth.withOpacity(0.5),
          );
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ObjectKey(_videoController),
      onVisibilityChanged: (visibility) {
        if (visibility.visibleFraction > 0.9) {
          setState(() {
            opacity = 1;
            _videoController.play();
            isShowPlaying = false;
          });
        }
      },
      child: InkWell(
        onTap: () {
          setState(() {
            _videoController.value.isPlaying
                ? _videoController.pause()
                : _videoController.play();
          });
        },
        child: RotatedBox(
          quarterTurns: -1,
          child: SizedBox(
              height: widget.size.height,
              width: widget.size.width,
              child: Stack(
                children: [
                  Container(
                    height: widget.size.height,
                    width: widget.size.width,
                    decoration: const BoxDecoration(color: AppColors.blackAuth),
                    child: Stack(
                      children: [
                        VideoPlayer(_videoController),
                        Center(
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: isPlaying(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: widget.size.height,
                    width: widget.size.width,
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Opacity(
                            opacity: opacity,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: LeftPanel(
                                    size: widget.size,
                                    name: "${widget.name}",
                                    caption: "${widget.caption}",
                                    songName: "${widget.songName}",
                                  ),
                                ),
                                RightPanel(
                                  size: widget.size,
                                  likes: "${widget.likes}",
                                  comments: "${widget.comments}",
                                  shares: "${widget.shares}",
                                  profileImg: "${widget.profileImg}",
                                  albumImg: "${widget.albumImg}",
                                  bookMark: "${widget.bookMark}",
                                ),
                              ],
                            ),
                          )),
                          Container(
                            color: Colors.red,
                            width: MediaQuery.of(context).size.width,
                            height: 2,
                          ),
                          // VideoProgressIndicator(
                          //   _videoController,
                          //   allowScrubbing: true,
                          //   colors: VideoProgressColors(
                          //       playedColor:
                          //           AppColors.whiteAuth.withOpacity(0.7),
                          //       backgroundColor:
                          //           AppColors.whiteAuth.withOpacity((0.3))),
                          // )
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
