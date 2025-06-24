import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../request_service_view.dart';
import 'dart:io';

class MediaFilePreview extends StatelessWidget {
  final File file;
  final IconData icon;
  final VoidCallback onRemove;

  const MediaFilePreview({
    super.key,
    required this.file,
    required this.icon,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        children: [
          Container(
            width: 80,
            height: 80,
            color: Colors.grey[300],
            child: Center(child: Icon(icon, size: 40)),
          ),
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

class MediaPickerWidget extends StatefulWidget {
  final Function(List<File>? images, File? video, List<File>? pdfs)
      onMediaChanged;

  const MediaPickerWidget({super.key, required this.onMediaChanged});

  @override
  State<MediaPickerWidget> createState() => _MediaPickerWidgetState();
}

class _MediaPickerWidgetState extends State<MediaPickerWidget> {
  List<File>? images = [];
  File? video;
  List<File>? pdfs = [];

  void notifyParent() {
    widget.onMediaChanged(images, video, pdfs);
  }

  Future<void> pickImages() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (result != null) {
      final pickedFiles =
          result.paths.whereType<String>().map((e) => File(e)).toList();
      setState(() {
        images!.addAll(pickedFiles);
      });
      notifyParent();
    }
  }

  Future<void> pickVideo() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );
    if (result != null && result.files.single.path != null) {
      setState(() {
        video = File(result.files.single.path!);
      });
      notifyParent();
    }
  }

  Future<void> pickPDFs() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: true,
    );
    if (result != null) {
      final pickedFiles =
          result.paths.whereType<String>().map((e) => File(e)).toList();
      setState(() {
        pdfs!.addAll(pickedFiles);
      });
      notifyParent();
    }
  }

  @override
  Widget build(BuildContext context) {
    return
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     const TitleWidget(title: 'الصور المرفقة:'),
        //     Wrap(
        //       children: [
        //         ...images!.map(
        //           (file) => MediaFilePreview(
        //             file: file,
        //             icon: Icons.image,
        //             onRemove: () {
        //               setState(() {
        //                 images!.remove(file);
        //               });
        //               notifyParent();
        //             },
        //           ),
        //         ),
        //         IconButton(
        //             icon: const Icon(Icons.add_photo_alternate),
        //             onPressed: pickImages),
        //       ],
        //     ),
        //     const SizedBox(height: 20),
        //     const TitleWidget(title: 'الفيديو المرفق:'),
        //     video != null
        //         ? MediaFilePreview(
        //             file: video!,
        //             icon: Icons.videocam,
        //             onRemove: () {
        //               setState(() {
        //                 video = null;
        //               });
        //               notifyParent();
        //             },
        //           )
        //         : IconButton(
        //             icon: const Icon(Icons.videocam), onPressed: pickVideo),
        //     const SizedBox(height: 20),
        //     const TitleWidget(title: 'الملفات المرفقة (PDF):'),
        //     Wrap(
        //       children: [
        //         ...pdfs!.map(
        //           (file) => MediaFilePreview(
        //             file: file,
        //             icon: Icons.picture_as_pdf,
        //             onRemove: () {
        //               setState(() {
        //                 pdfs!.remove(file);
        //               });
        //               notifyParent();
        //             },
        //           ),
        //         ),
        //         IconButton(
        //             icon: const Icon(Icons.picture_as_pdf), onPressed: pickPDFs),
        //       ],
        //     ),
        //   ],
        // );
        Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleWidget(title: 'صور'),
        const SizedBox(
          height: 10,
        ),
        images!.isEmpty
            ? Center(
                child: GestureDetector(
                  onTap: pickImages,
                  child: const Icon(Icons.add_photo_alternate,
                      size: 45, color: Colors.grey),
                ),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...images!.asMap().entries.map(
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
                                    images!.removeAt(index);

                                    widget.onMediaChanged(images, video, pdfs);
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
                        onTap: pickImages,
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
                onTap: pickVideo,
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
                          widget.onMediaChanged(images, video, pdfs);
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
