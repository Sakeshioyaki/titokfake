import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_fake/common/app_colors.dart';
import 'package:tiktok_fake/common/app_text_styles.dart';
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
  final Size size;

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

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController _videoController;
  bool isShowPlaying = false;
  double opacity = 0.4;
  bool showIndicator = false;
  bool big = false;
  bool showTime = false;
  bool showInfor = true;
  Duration process = Duration(milliseconds: 0);
  late Duration total = Duration(milliseconds: 0);
  late int time = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _videoController = VideoPlayerController.asset(widget.videoUrl!)
      ..initialize()
      ..addListener(() {
        setState(() {
          process = _videoController.value.position;
          print('duration ${_videoController.value.duration}');
          if (total == const Duration(milliseconds: 0)) {
            setState(() {
              total = _videoController.value.duration;
              print('duration ${_videoController.value.duration}');
              print('duration ${total}');
            });
          }
        });
      });
    // setState(() {
    //   total = _videoController.value.duration;
    // });
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
            showIndicator = true;
          });
        }
        // if (visibility.visibleFraction == 1) {
        //   setState(() {
        //     showIndicator = true;
        //   });
        // }
      },
      child: InkWell(
        onTap: () {
          setState(() {
            _videoController.value.isPlaying
                ? _videoController.pause()
                : _videoController.play();
            _videoController.value.isPlaying ? big = false : big = true;
            // showIndicator = false;
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
                            child: showInfor
                                ? Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
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
                                  )
                                : SizedBox(),
                          )),
                          showInfor
                              ? SizedBox()
                              : Container(
                                  padding: EdgeInsets.only(bottom: 30),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              '${process.inMinutes}:${process.inSeconds}',
                                              style: AppTextStyle.textWhite
                                                  .copyWith(
                                                      fontSize: 24,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                          Text(
                                            '  /  ',
                                            style: AppTextStyle.textWhiterS16,
                                          ),
                                          Text(
                                            '${total.inMinutes}:${total.inSeconds}',
                                            style: AppTextStyle.textWhite
                                                .copyWith(
                                                    fontSize: 24,
                                                    color: Colors.white
                                                        .withOpacity(0.5),
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                          SizedBox(height: 10),
                          showIndicator
                              ? GestureDetector(
                                  onForcePressStart: (ForcePressDetails f) {
                                    setState(() {
                                      big = true;
                                    });
                                    print('tappp');
                                  },
                                  child: Container(
                                    // color: Colors.red,
                                    height: 4,
                                    alignment: Alignment.bottomRight,
                                    child: ProgressBar(
                                        progress: process,
                                        buffered:
                                            const Duration(milliseconds: 2000),
                                        total: total,
                                        onSeek: (process) {
                                          _videoController.seekTo(process);
                                        },
                                        onDragUpdate: (details) {
                                          setState(() {
                                            process = details.timeStamp;
                                          });
                                        },
                                        onDragStart:
                                            (ThumbDragDetails details) {
                                          setState(() {
                                            big = true;
                                            showInfor = false;
                                            // _videoController.pause();
                                            time = details.timeStamp.inSeconds;
                                            // _videoController
                                            //     .seekTo(details.timeStamp);
                                            // time = TimeLabelType.values.
                                          });
                                        },
                                        onDragEnd: () {
                                          setState(() {
                                            big = false;
                                            showInfor = true;

                                            // _videoController.play();
                                          });
                                        },
                                        thumbCanPaintOutsideBar: true,
                                        timeLabelLocation:
                                            TimeLabelLocation.none,
                                        barHeight: big ? 4 : 1.5,
                                        thumbRadius: 1,
                                        thumbGlowRadius: 9,
                                        timeLabelTextStyle:
                                            AppTextStyle.textWhiterS16Bold,
                                        bufferedBarColor: AppColors.whiteAuth
                                            .withOpacity(0.5),
                                        baseBarColor: AppColors.whiteAuth
                                            .withOpacity(0.4),
                                        progressBarColor: AppColors.whiteAuth
                                            .withOpacity(0.7),
                                        thumbColor:
                                            AppColors.whiteAuth.withOpacity(1)),
                                  ),
                                )
                              : const SizedBox(),
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
