import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../request_service_view.dart';

class MediaPickerWidget extends StatefulWidget {
  final Function(List<File> images, File? video) onMediaChanged;

  const MediaPickerWidget({super.key, required this.onMediaChanged});

  @override
  State<MediaPickerWidget> createState() => _MediaPickerWidgetState();
}

class _MediaPickerWidgetState extends State<MediaPickerWidget> {
  List<File> images = [];
  File? video;



  Future<void> _pickImages() async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.image,
    allowMultiple: true,
  );

  if (result != null) {
    final pickedFiles = result.paths.whereType<String>().map((e) => File(e)).toList();

    for (var file in pickedFiles) {
      final exists = await file.exists();
      debugPrint('Picked image: ${file.path} | Exists: $exists');
    }

    setState(() {
      images.addAll(pickedFiles);
      widget.onMediaChanged(images, video);
    });
  }
}


 Future<void> _pickVideo() async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.video,
  );

  if (result != null && result.files.single.path != null) {
    final pickedVideo = File(result.files.single.path!);
    final exists = await pickedVideo.exists();
    debugPrint('Picked video: ${pickedVideo.path} | Exists: $exists');

    setState(() {
      video = pickedVideo;
      widget.onMediaChanged(images, video);
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleWidget(title: 'صور'),
        const SizedBox(
          height: 10,
        ),
        images.isEmpty
            ? Center(
                child: GestureDetector(
                  onTap: _pickImages,
                  child: const Icon(Icons.add_photo_alternate,
                      size: 45, color: Colors.grey),
                ),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...images.asMap().entries.map(
                      (entry) {
                        final index = entry.key;
                        final file = entry.value;
                        return Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  file,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 2,
                              right: 2,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    images.removeAt(index);
                                    widget.onMediaChanged(images, video);
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: const BoxDecoration(
                                    color: Colors.black54,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.close,
                                      color: Colors.white, size: 16),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: GestureDetector(
                        onTap: _pickImages,
                        child: const Icon(Icons.add_photo_alternate,
                            size: 45, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
        const SizedBox(height: 20),
        const TitleWidget(title: 'فيديو'),
        const SizedBox(
          height: 10,
        ),
        video == null
            ? GestureDetector(
                onTap: _pickVideo,
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Icon(Icons.videocam, color: Colors.grey, size: 45),
                  ),
                ),
              )
            : Stack(
                children: [
                  Container(
                    height: 80,
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                        child:
                            Icon(Icons.videocam, size: 45, color: Colors.grey)),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          video = null;
                          widget.onMediaChanged(images, video);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.close,
                            size: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
