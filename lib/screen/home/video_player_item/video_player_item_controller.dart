// import 'package:get/get.dart';
// import 'package:video_player/video_player.dart';
//
// class VideoPlayerItemController extends GetxController {
//
//   String? videoUrl = '';
//   Rx<DurationState>? durationState;
//
//
//   late VideoPlayerController _videoController = VideoPlayerController.asset(widget.videoUrl!)
//     ..initialize();;
//   bool isShowPlaying = false;
//   double opacity = 0.4;
//   bool showIndicator = false;
//
//
//   final player = AudioPlayer();
//   Stream<DurationState>? durationState;
//
//   void init() {
//     durationState = Rx.combineLatest2<Duration, PlaybackEvent, DurationState>(
//         player.positionStream,
//         player.playbackEventStream,
//             (position, playbackEvent) => DurationState(
//           progress: position,
//           buffered: playbackEvent.bufferedPosition,
//           total: playbackEvent.duration,
//         ));
//     player.setUrl(url);
//   }
//
//   void dispose() {
//     player.dispose();
//   }
//
//   setUrlVideo(String url){
//     videoUrl = url;
//   }
//
// }
//
// class DurationState {
//   const DurationState({
//     required this.progress,
//     required this.buffered,
//     this.total,
//   });
//   final Duration progress;
//   final Duration buffered;
//   final Duration? total;
// }
