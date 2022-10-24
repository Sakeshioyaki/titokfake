import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_fake/common/app_colors.dart';
import 'package:tiktok_fake/common/app_text_styles.dart';
import 'package:tiktok_fake/model/video_model.dart';
import 'package:tiktok_fake/screens/home_page/video_player_item/video_player_item_controller.dart';
import 'package:tiktok_fake/screens/home_page/widget/left_panel.dart';
import 'package:tiktok_fake/screens/home_page/widget/right_panel.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPlayerItem extends StatefulWidget {
  final VideoModel video;
  final Size size;

  VideoPlayerItem({
    Key? key,
    required this.size,
    required this.video,
  }) : super(key: key);

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  VideoPlayerItemController videoPlayerItemController =
      Get.put<VideoPlayerItemController>(VideoPlayerItemController());

  @override
  void initState() {
    super.initState();
    videoPlayerItemController.videoController =
        VideoPlayerController.asset(widget.video.videoUrl!)
          ..initialize()
          ..addListener(() {
            videoPlayerItemController.setProcess(
                videoPlayerItemController.videoController.value.position);
            if (videoPlayerItemController.total ==
                const Duration(milliseconds: 0)) {
              videoPlayerItemController.setTotal(
                  videoPlayerItemController.videoController.value.duration);
            }
          });
    videoPlayerItemController.videoController.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerItemController.videoController.dispose();
  }

  Widget isPlaying() {
    return videoPlayerItemController.videoController.value.isPlaying &&
            !videoPlayerItemController.isShowPlaying
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
      key: ObjectKey(videoPlayerItemController.videoController),
      onVisibilityChanged: (visibility) {
        if (visibility.visibleFraction > 0.9) {
          videoPlayerItemController.setOpacity(1);
          videoPlayerItemController.videoController.play();
          videoPlayerItemController.setIsShowPlaying(false);
          videoPlayerItemController.setShowIndicator(true);
        }
      },
      child: InkWell(
        onTap: () {
          setState(
            () {
              videoPlayerItemController.videoController.value.isPlaying
                  ? videoPlayerItemController.videoController.pause()
                  : videoPlayerItemController.videoController.play();
              videoPlayerItemController.videoController.value.isPlaying
                  ? videoPlayerItemController.setBig(false)
                  : videoPlayerItemController.setBig(true);
              // showIndicator = false;
            },
          );
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
                      VideoPlayer(videoPlayerItemController.videoController),
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
                            opacity: videoPlayerItemController.opacity,
                            child: videoPlayerItemController.showInfo
                                ? Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: LeftPanel(
                                          size: widget.size,
                                          name: "${widget.video.name}",
                                          caption: "${widget.video.caption}",
                                          songName: "${widget.video.songName}",
                                        ),
                                      ),
                                      RightPanel(
                                        size: widget.size,
                                        likes: "${widget.video.likes}",
                                        comments: "${widget.video.comments}",
                                        shares: "${widget.video.shares}",
                                        profileImg:
                                            "${widget.video.profileImg}",
                                        albumImg: "${widget.video.albumImg}",
                                        bookMark: "${widget.video.bookMark}",
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                          ),
                        ),
                        videoPlayerItemController.showInfo
                            ? const SizedBox()
                            : Container(
                                padding: const EdgeInsets.only(bottom: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                            '${videoPlayerItemController.process.inMinutes}:${videoPlayerItemController.process.inSeconds}',
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
                                          '${videoPlayerItemController.total.inMinutes}:${videoPlayerItemController.total.inSeconds}',
                                          style: AppTextStyle.textWhite
                                              .copyWith(
                                                  fontSize: 24,
                                                  color: Colors.white
                                                      .withOpacity(0.5),
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                        const SizedBox(height: 10),
                        videoPlayerItemController.showIndicator
                            ? GestureDetector(
                                onForcePressStart: (ForcePressDetails f) {
                                  setState(() {
                                    videoPlayerItemController.big = true;
                                  });
                                },
                                child: Container(
                                  // color: Colors.red,
                                  height: 4,
                                  alignment: Alignment.bottomRight,
                                  child: ProgressBar(
                                    progress: videoPlayerItemController.process,
                                    buffered:
                                        const Duration(milliseconds: 2000),
                                    total: videoPlayerItemController.total,
                                    onSeek: (process) {
                                      videoPlayerItemController.videoController
                                          .seekTo(process);
                                    },
                                    onDragUpdate: (details) {
                                      setState(() {
                                        videoPlayerItemController.process =
                                            details.timeStamp;
                                      });
                                    },
                                    onDragStart: (ThumbDragDetails details) {
                                      setState(() {
                                        videoPlayerItemController.setBig(true);
                                        videoPlayerItemController
                                            .setShowInfo(false);
                                        videoPlayerItemController.setTime(
                                            details.timeStamp.inSeconds);
                                      });
                                    },
                                    onDragEnd: () {
                                      videoPlayerItemController.setBig(false);
                                      videoPlayerItemController
                                          .setShowInfo(true);
                                    },
                                    thumbCanPaintOutsideBar: true,
                                    timeLabelLocation: TimeLabelLocation.none,
                                    barHeight:
                                        videoPlayerItemController.big ? 4 : 1.5,
                                    thumbRadius: 1,
                                    thumbGlowRadius: 9,
                                    timeLabelTextStyle:
                                        AppTextStyle.textWhiterS16Bold,
                                    bufferedBarColor:
                                        AppColors.whiteAuth.withOpacity(0.5),
                                    baseBarColor:
                                        AppColors.whiteAuth.withOpacity(0.4),
                                    progressBarColor:
                                        AppColors.whiteAuth.withOpacity(0.7),
                                    thumbColor:
                                        AppColors.whiteAuth.withOpacity(1),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
