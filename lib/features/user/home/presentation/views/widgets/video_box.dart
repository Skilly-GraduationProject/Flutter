// // import 'package:flutter/material.dart';
// // import 'package:video_player/video_player.dart';

// // class VideoBox extends StatefulWidget {
// //   final String url;
// //   const VideoBox({super.key, required this.url});

// //   @override
// //   State<VideoBox> createState() => _VideoBoxState();
// // }

// // class _VideoBoxState extends State<VideoBox> {
// //   late VideoPlayerController _videoPlayerController;
// //   late Future<void> _initializeVideoPlayerFuture;

// //   @override
// //   void initState() {
// //     super.initState();

// //     _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.url));
// //     _initializeVideoPlayerFuture = _videoPlayerController.initialize().then((_) {
// //       _videoPlayerController.play(); // Auto-play
// //       setState(() {});
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     _videoPlayerController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return FutureBuilder(
// //       future: _initializeVideoPlayerFuture,
// //       builder: (context, snapshot) {
// //         if (snapshot.connectionState == ConnectionState.done) {
// //           return AspectRatio(
// //             aspectRatio: _videoPlayerController.value.aspectRatio,
// //             child: Stack(
// //               alignment: Alignment.bottomCenter,
// //               children: [
// //                 VideoPlayer(_videoPlayerController),
// //                 _ControlsOverlay(controller: _videoPlayerController),
// //                 VideoProgressIndicator(_videoPlayerController, allowScrubbing: true),
// //               ],
// //             ),
// //           );
// //         } else {
// //           return const Center(child: CircularProgressIndicator());
// //         }
// //       },
// //     );
// //   }
// // }

// // class _ControlsOverlay extends StatelessWidget {
// //   final VideoPlayerController controller;
// //   const _ControlsOverlay({required this.controller});

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: () {
// //         controller.value.isPlaying ? controller.pause() : controller.play();
// //       },
// //       child: Center(
// //         child: Icon(
// //           controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
// //           color: Colors.white,
// //           size: 50,
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoPlayerWidget extends StatefulWidget {
//   final String url;

//   VideoPlayerWidget({required this.url});

//   @override
//   _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
// }

// class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
//   late VideoPlayerController _videoPlayerController;
//   late Future<void> _initializeVideoPlayerFuture;

//   @override
//   void initState() {
//     super.initState();

//     // استخدام VideoPlayerController.network في النسخة الحديثة
//     _videoPlayerController = VideoPlayerController.network(widget.url);

//     _initializeVideoPlayerFuture = _videoPlayerController.initialize().then((_) {
//       _videoPlayerController.play(); // Auto-play
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Video Player")),
//       body: Center(
//         child: FutureBuilder(
//           future: _initializeVideoPlayerFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               return AspectRatio(
//                 aspectRatio: _videoPlayerController.value.aspectRatio,
//                 child: VideoPlayer(_videoPlayerController),
//               );
//             } else {
//               return CircularProgressIndicator();
//             }
//           },
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _videoPlayerController.dispose();
//   }
// }


