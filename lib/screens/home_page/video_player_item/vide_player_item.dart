import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_fake/common/app_colors.dart';
import 'package:tiktok_fake/common/app_text_styles.dart';
import 'package:tiktok_fake/model/video_model.dart';
import 'package:tiktok_fake/screens/home_page/video_player_item/video_player_item_vm.dart';
import 'package:tiktok_fake/screens/home_page/widget/left_panel.dart';
import 'package:tiktok_fake/screens/home_page/widget/right_panel.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPlayerItem extends StatefulWidget {
  final VideoModel video;
  final Size size;
  final int tag;

  const VideoPlayerItem({
    Key? key,
    required this.size,
    required this.video,
    required this.tag,
  }) : super(key: key);

  @override
  VideoPlayerItemState createState() => VideoPlayerItemState();
}

class VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerItemController vm;
  late VideoPlayerController videoController;

  @override
  void initState() {
    super.initState();
    vm = Get.put<VideoPlayerItemController>(VideoPlayerItemController(),
        tag: widget.tag.toString());

    videoController = VideoPlayerController.asset(widget.video.videoUrl!)
      ..initialize()
      ..addListener(() {
        vm.setProcess(videoController.value.position);
        if (vm.total == const Duration(milliseconds: 0)) {
          vm.setTotal(videoController.value.duration);
          vm.setBuffered(videoController.value.buffered.last.end);
        }
      });
    videoController.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    videoController.dispose();
  }

  Widget isPlaying() {
    return GetBuilder<VideoPlayerItemController>(
        tag: widget.tag.toString(),
        builder: (_) {
          return videoController.value.isPlaying
              ? Container()
              : Icon(
                  Icons.play_arrow_rounded,
                  size: 80,
                  color: AppColors.whiteAuth.withOpacity(0.5),
                );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoPlayerItemController>(
        tag: widget.tag.toString(),
        builder: (logic) {
          return VisibilityDetector(
            key: ObjectKey(videoController),
            onVisibilityChanged: (visibility) {
              if (visibility.visibleFraction > 0.9) {
                logic.setOpacity(1);
                videoController.play();
                logic.setIsShowPlaying(false);
                logic.setShowIndicator(true);
              }
            },
            child: InkWell(
              onTap: () {
                videoController.value.isPlaying
                    ? videoController.pause()
                    : videoController.play();
                videoController.value.isPlaying
                    ? logic.setBig(false)
                    : logic.setBig(true);
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
                        decoration:
                            const BoxDecoration(color: AppColors.blackAuth),
                        child: Stack(
                          children: [
                            VideoPlayer(videoController),
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
                                  opacity: logic.opacity,
                                  child: logic.showInfo
                                      ? Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: LeftPanel(
                                                size: widget.size,
                                                name: "${widget.video.name}",
                                                caption:
                                                    "${widget.video.caption}",
                                                songName:
                                                    "${widget.video.songName}",
                                              ),
                                            ),
                                            RightPanel(
                                              size: widget.size,
                                              likes: "${widget.video.likes}",
                                              comments:
                                                  "${widget.video.comments}",
                                              shares: "${widget.video.shares}",
                                              profileImg:
                                                  "${widget.video.profileImg}",
                                              albumImg:
                                                  "${widget.video.albumImg}",
                                              bookMark:
                                                  "${widget.video.bookMark}",
                                            ),
                                          ],
                                        )
                                      : const SizedBox(),
                                ),
                              ),
                              logic.showInfo
                                  ? const SizedBox()
                                  : Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 30),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                  '${logic.process.inMinutes}:${logic.process.inSeconds}',
                                                  style: AppTextStyle.textWhite
                                                      .copyWith(
                                                          fontSize: 24,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                              Text(
                                                '  /  ',
                                                style:
                                                    AppTextStyle.textWhiterS16,
                                              ),
                                              Text(
                                                '${logic.total.inMinutes}:${logic.total.inSeconds}',
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
                              const SizedBox(height: 10),
                              logic.showIndicator
                                  ? (logic.big
                                      ? GestureDetector(
                                          onTap: () {
                                            logic.setBig(true);
                                          },
                                          child: Container(
                                            alignment: Alignment.bottomLeft,
                                            child: ProgressBar(
                                              progress: logic.process,
                                              buffered: logic.buffered,
                                              total: logic.total,
                                              onSeek: (process) {
                                                videoController.seekTo(process);
                                              },
                                              onDragUpdate: (details) {
                                                logic.setProcess(
                                                    details.timeStamp);
                                                videoController
                                                    .seekTo(details.timeStamp);
                                              },
                                              onDragStart:
                                                  (ThumbDragDetails details) {
                                                logic.setBig(true);
                                                logic.setShowInfo(false);
                                              },
                                              onDragEnd: () {
                                                logic.setBig(false);
                                                logic.setShowInfo(true);
                                              },
                                              timeLabelLocation:
                                                  TimeLabelLocation.none,
                                              barHeight: 5,
                                              thumbRadius: 1,
                                              thumbGlowRadius: 9,
                                              timeLabelTextStyle: AppTextStyle
                                                  .textWhiterS16Bold,
                                              bufferedBarColor: AppColors
                                                  .whiteAuth
                                                  .withOpacity(0.5),
                                              baseBarColor: AppColors.whiteAuth
                                                  .withOpacity(0.4),
                                              progressBarColor: AppColors
                                                  .whiteAuth
                                                  .withOpacity(0.7),
                                              thumbColor: AppColors.whiteAuth
                                                  .withOpacity(1),
                                            ),
                                          ),
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            logic.setBig(true);
                                          },
                                          child: Container(
                                            // color: Colors.red,
                                            alignment: Alignment.bottomLeft,
                                            child: ProgressBar(
                                              progress: logic.process,
                                              buffered: logic.buffered,
                                              total: logic.total,
                                              onSeek: (process) {
                                                videoController.seekTo(process);
                                              },
                                              onDragUpdate: (details) {
                                                logic.setProcess(
                                                    details.timeStamp);
                                                videoController
                                                    .seekTo(details.timeStamp);
                                              },
                                              onDragStart:
                                                  (ThumbDragDetails details) {
                                                logic.setBig(true);
                                                logic.setShowInfo(false);
                                              },
                                              onDragEnd: () {
                                                logic.setBig(false);
                                                logic.setShowInfo(true);
                                              },
                                              timeLabelLocation:
                                                  TimeLabelLocation.none,
                                              barHeight: 1.5,
                                              thumbRadius: 1,
                                              thumbGlowRadius: 9,
                                              timeLabelTextStyle: AppTextStyle
                                                  .textWhiterS16Bold,
                                              bufferedBarColor: AppColors
                                                  .whiteAuth
                                                  .withOpacity(0.5),
                                              baseBarColor: AppColors.whiteAuth
                                                  .withOpacity(0.4),
                                              progressBarColor: AppColors
                                                  .whiteAuth
                                                  .withOpacity(0.7),
                                              thumbColor: AppColors.whiteAuth
                                                  .withOpacity(1),
                                            ),
                                          ),
                                        ))
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
        });
  }
}
