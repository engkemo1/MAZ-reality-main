import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:final_project/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AddImageFromCameraAndStorage extends StatefulWidget {
  final bool isContract;
  final Function(List<File> images) onImagesFetched;

  const AddImageFromCameraAndStorage(
      {super.key, required this.onImagesFetched, required this.isContract});

  @override
  State<AddImageFromCameraAndStorage> createState() =>
      _AddImageFromCameraAndStorageState();
}

class _AddImageFromCameraAndStorageState
    extends State<AddImageFromCameraAndStorage> {
  List<File> selectedImages = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.22),
        borderRadius: BorderRadius.circular(45.r),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  children: selectedImages
                      .map((imageFile) =>
                          Image.file(imageFile, width: 56.w, height: 56.h))
                      .toList(),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  if (widget.isContract) {
                    uploadContractOptions(context);
                  } else {
                    showImagePickerOption(context);
                  }
                },
                icon: Icon(
                  widget.isContract
                      ? Icons.file_copy_outlined
                      : Icons.add_a_photo,
                  color: Colors.black,
                  size: 28,
                ))
          ],
        ),
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Padding(
            padding: EdgeInsets.all(18.0.h),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 4.5,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        getImageFromCamera(ImageSource.gallery);
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 70,
                            ),
                            Text("Gallery"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        getImageFromCamera(ImageSource.camera);
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 70,
                            ),
                            Text("Camera"),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  void uploadContractOptions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Padding(
            padding: EdgeInsets.all(18.0.h),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 4.5,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        context.pop();
                        showImagePickerOption(context);
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 70,
                            ),
                            Text("Image"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        context.pop();
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowMultiple: false,
                          allowedExtensions: ['pdf'],
                        );
                        if (result != null) {
                          List<File> files =
                              result.paths.map((path) => File(path!)).toList();
                          widget.onImagesFetched(files);
                        } else {
                          // User canceled the picker
                        }
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.file_copy_outlined,
                              size: 70,
                            ),
                            Text("PDF"),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future getImageFromCamera(ImageSource source) async {
    final returnImage = await ImagePicker().pickImage(source: source);
    if (returnImage == null) return;
    setState(() {
      selectedImages.add(File(returnImage.path));
      // _image = File(returnImage.path).readAsBytesSync();
      widget.onImagesFetched(selectedImages);
    });
  }
}
