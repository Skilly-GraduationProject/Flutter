// import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../request_service_view.dart';

// class MediaPickerWidget extends StatefulWidget {
//   final Function(List<File> images, File? video) onMediaChanged;

//   const MediaPickerWidget({super.key, required this.onMediaChanged});

//   @override
//   State<MediaPickerWidget> createState() => _MediaPickerWidgetState();
// }

// class _MediaPickerWidgetState extends State<MediaPickerWidget> {
//   List<File> images = [];
//   File? video;



//   Future<void> _pickImages() async {
//   final result = await FilePicker.platform.pickFiles(
//     type: FileType.image,
//     allowMultiple: true,
//   );

//   if (result != null) {
//     final pickedFiles = result.paths.whereType<String>().map((e) => File(e)).toList();

//     for (var file in pickedFiles) {
//       final exists = await file.exists();
//       debugPrint('Picked image: ${file.path} | Exists: $exists');
//     }

//     setState(() {
//       images.addAll(pickedFiles);
//       widget.onMediaChanged(images, video);
//     });
//   }
// }


//  Future<void> _pickVideo() async {
//   final result = await FilePicker.platform.pickFiles(
//     type: FileType.video,
//   );

//   if (result != null && result.files.single.path != null) {
//     final pickedVideo = File(result.files.single.path!);
//     final exists = await pickedVideo.exists();
//     debugPrint('Picked video: ${pickedVideo.path} | Exists: $exists');

//     setState(() {
//       video = pickedVideo;
//       widget.onMediaChanged(images, video);
//     });
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const TitleWidget(title: 'صور'),
//         const SizedBox(
//           height: 10,
//         ),
//         images.isEmpty
//             ? Center(
//                 child: GestureDetector(
//                   onTap: _pickImages,
//                   child: const Icon(Icons.add_photo_alternate,
//                       size: 45, color: Colors.grey),
//                 ),
//               )
//             : SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     ...images.asMap().entries.map(
//                       (entry) {
//                         final index = entry.key;
//                         final file = entry.value;
//                         return Stack(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(6.0),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(10),
//                                 child: Image.file(
//                                   file,
//                                   width: 80,
//                                   height: 80,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               top: 2,
//                               right: 2,
//                               child: GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     images.removeAt(index);
//                                     widget.onMediaChanged(images, video);
//                                   });
//                                 },
//                                 child: Container(
//                                   padding: const EdgeInsets.all(2),
//                                   decoration: const BoxDecoration(
//                                     color: Colors.black54,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: const Icon(Icons.close,
//                                       color: Colors.white, size: 16),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(6.0),
//                       child: GestureDetector(
//                         onTap: _pickImages,
//                         child: const Icon(Icons.add_photo_alternate,
//                             size: 45, color: Colors.grey),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//         const SizedBox(height: 20),
//         const TitleWidget(title: 'فيديو'),
//         const SizedBox(
//           height: 10,
//         ),
//         video == null
//             ? GestureDetector(
//                 onTap: _pickVideo,
//                 child: Container(
//                   height: 80,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade100,
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: const Center(
//                     child: Icon(Icons.videocam, color: Colors.grey, size: 45),
//                   ),
//                 ),
//               )
//             : Stack(
//                 children: [
//                   Container(
//                     height: 80,
//                     width: double.infinity,
//                     margin: const EdgeInsets.only(bottom: 8),
//                     decoration: BoxDecoration(
//                       color: Colors.black12,
//                       border: Border.all(color: Colors.grey),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Center(
//                         child:
//                             Icon(Icons.videocam, size: 45, color: Colors.grey)),
//                   ),
//                   Positioned(
//                     top: 4,
//                     right: 4,
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           video = null;
//                           widget.onMediaChanged(images, video);
//                         });
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.all(4),
//                         decoration: const BoxDecoration(
//                           color: Colors.black54,
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Icon(Icons.close,
//                             size: 16, color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//       ],
//     );
//   }
// }

import 'dart:io';


// MediaType Enum
enum MediaType { image, video }

// Dialog for choosing media type
class MediaTypeDialog extends StatelessWidget {
  const MediaTypeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('اختر نوع الملف'),
      content: Column(
        mainAxisSize: MainAxisSize.min, // هذا مهم علشان الـ Column ما ياخذ مساحة غير ضرورية
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            child: const Text('صورة'),
            onTap: () => Navigator.pop(context, MediaType.image),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            child: const Text('فيديو'),
            onTap: () => Navigator.pop(context, MediaType.video),
          ),
        ],
      ),
    );
  }
}


// Reusable widget to preview image or video
class MediaFilePreview extends StatelessWidget {
  final File file;
  final bool isVideo;
  final VoidCallback onRemove;

  const MediaFilePreview({
    super.key,
    required this.file,
    required this.isVideo,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        children: [
          isVideo
              ? Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey[300],
                  child: const Center(child: Icon(Icons.videocam, size: 40)),
                )
              : Image.file(file, width: 80, height: 80, fit: BoxFit.cover),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: onRemove,
              child: const CircleAvatar(
                backgroundColor: Colors.red,
                radius: 10,
                child: Icon(Icons.close, color: Colors.white, size: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Main MediaPickerWidget
class MediaPickerWidget extends StatefulWidget {
  final Function(List<File> images, File? video) onMediaChanged;

  const MediaPickerWidget({super.key, required this.onMediaChanged});

  @override
  State<MediaPickerWidget> createState() => _MediaPickerWidgetState();
}

class _MediaPickerWidgetState extends State<MediaPickerWidget> {
  List<File> images = [];
  File? video;

  Future<void> _pickMedia() async {
    final selectedType = await showDialog<MediaType>(
      context: context,
      builder: (context) => const MediaTypeDialog(),
    );

    if (selectedType == MediaType.image) {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: true,
      );
      if (result != null) {
        final pickedFiles =
            result.paths.whereType<String>().map((e) => File(e)).toList();
        setState(() {
          images.addAll(pickedFiles);
          widget.onMediaChanged(images, video);
        });
      }
    } else if (selectedType == MediaType.video) {
      final result = await FilePicker.platform.pickFiles(type: FileType.video);
      if (result != null && result.files.single.path != null) {
        setState(() {
          video = File(result.files.single.path!);
          widget.onMediaChanged(images, video);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleWidget(title: 'الصور المرفقة:'),
 Wrap(
                children: [
                  ...images.map(
                    (file) => MediaFilePreview(
                      file: file,
                      isVideo: false,
                      onRemove: () {
                        setState(() {
                          images.remove(file);
                          widget.onMediaChanged(images, video);
                        });
                      },
                    ),
                  ),
                  IconButton(icon: const Icon(Icons.add), onPressed: _pickMedia),
                ],
              ),

        const SizedBox(height: 20),
        const TitleWidget(title: 'الفيديو المرفق:'),

        video != null
            ? MediaFilePreview(
                file: video!,
                isVideo: true,
                onRemove: () {
                  setState(() {
                    video = null;
                    widget.onMediaChanged(images, video);
                  });
                },
              )
            : IconButton(icon: const Icon(Icons.add), onPressed: _pickMedia),
      ],
    );
  }
}