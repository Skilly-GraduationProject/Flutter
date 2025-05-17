import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class PickerHelper {
  final ImagePicker _picker = ImagePicker();

  Future<dynamic> showPickerBottomSheet({
    required BuildContext context,
    required ImagePickerType type,
  }) async {
    return await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Center(child: Text("التقاط صورة بالكاميرا")),
              onTap: () async {
                final image = await _takeImageWithCamera();
                Navigator.pop(context, image);
              },
            ),
            Divider(indent: 20, endIndent: 20, color: Colors.grey[300]),
            ListTile(
              title: const Center(child: Text("اختيار من المعرض")),
              onTap: () async {
                if (type == ImagePickerType.single) {
                  final image = await _pickImage();
                  Navigator.pop(context, image);
                } else {
                  final images = await _pickMultipleImages();
                  Navigator.pop(context, images);
                }
              },
            ),
            Divider(indent: 20, endIndent: 20, color: Colors.grey[300]),
            ListTile(
              title: const Center(child: Text("إلغاء")),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<XFile>?> _pickMultipleImages() async {
    try {
      return await _picker.pickMultiImage();
    } catch (e) {
      print("Error picking images: $e");
      return null;
    }
  }

  Future<XFile?> _pickImage() async {
    try {
      return await _picker.pickImage(source: ImageSource.gallery);
    } catch (e) {
      print("Error picking image: $e");
      return null;
    }
  }

  Future<XFile?> _takeImageWithCamera() async {
    try {
      return await _picker.pickImage(source: ImageSource.camera);
    } catch (e) {
      print("Error capturing image: $e");
      return null;
    }
  }
}

enum ImagePickerType { single, multi }
