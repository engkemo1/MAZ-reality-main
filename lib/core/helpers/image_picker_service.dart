import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

Future<File?> selectImageFromLocal(
    BuildContext context, ImageSource source) async {
  final picker = ImagePicker();
  final XFile? image = await picker.pickImage(
    source: source,
    maxHeight: 720,
    maxWidth: 720,
    imageQuality: 70,
  );
  late File selectedFile;
  try {
    if (image != null) {
      selectedFile = File(image.path);
      // context.read<ImagePickerCubit>().fileSelected(selectedFile);
      return selectedFile;
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}
