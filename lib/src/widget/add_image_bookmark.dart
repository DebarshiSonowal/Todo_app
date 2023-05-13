import 'dart:io';

import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/models/bookmark.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';

import '../constants/constants.dart';
import '../services/Navigate.dart';
import 'alert.dart';
import 'done_button.dart';

class AddImageTitleBookmark extends StatefulWidget {
  const AddImageTitleBookmark({Key? key, required this.index})
      : super(key: key);
  final int index;

  @override
  State<AddImageTitleBookmark> createState() => _AddImageTitleBookmarkState();
}

class _AddImageTitleBookmarkState extends State<AddImageTitleBookmark> {
  File? attachment;
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Constances.gradientColor2,
      title: const Center(
        child: Text(
          "",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 5),
        ),
      ),
      content: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            attachment == null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            getSelectedImage(0);
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                margin: const EdgeInsets.only(bottom: 4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.pink.shade300),
                                child: const Icon(
                                  Icons.camera_alt_rounded,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                "Camera",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        width: 42,
                      ),
                      InkWell(
                          onTap: () {
                            getSelectedImage(1);
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                margin: const EdgeInsets.only(bottom: 4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.purple.shade300),
                                child: const Icon(
                                  Icons.image,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                "Gallery",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )),
                    ],
                  )
                : CircleAvatar(
                    radius: 30.sp, // Image radius
                    backgroundImage: Image.file(
                      File(attachment?.path ?? ""),
                    ).image,
                  ),
            SizedBox(
              height: 3.h,
            ),
            const Text(
              "",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16,color: Colors.white70),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 2.7.w,
                vertical: 1.h,
              ),
              decoration: const BoxDecoration(
                color: Constances.textFieldBackground,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              width: double.infinity,
              child: TextFormField(
                controller: titleController,
                maxLines: 2,
                minLines: 1,
                decoration: InputDecoration.collapsed(

                  hintText: 'File name',
                  hintStyle: Theme.of(context).textTheme.headline4?.copyWith(
                        fontSize: 11.sp,
                        color: Colors.white54,
                        // fontWeight: FontWeight.bold,
                        fontFamily: "Roboto",
                      ),
                ),
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      fontSize: 14.sp,
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            DoneButton(
              txt: "Save",
              onTap: () {
                Provider.of<Repository>(context, listen: false).updateBookmark(
                    Bookmark(
                      title: titleController.text,
                      image: attachment?.path ?? "",
                      items: Provider.of<Repository>(context, listen: false)
                          .bookmarks[widget.index]
                          .items,
                    ),
                    widget.index);
                Navigation.instance.goBack();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getSelectedImage(int index) async {
    if (index == 0) {
      var status = await Permission.camera.request();
      if (status.isDenied) {
        showError("Permission Denied");
      } else {
        final pickedFile = await ImagesPicker.openCamera(
          pickType: PickType.image,
          quality: 0.7,
        );
        if (pickedFile != null) {
          for (var i in pickedFile) {
            setState(() {
              attachment = File(i.path);
            });
          }
        }
      }
    } else {
      var status = await Permission.storage.request();
      if (status.isDenied) {
        showError("Permission Denied");
      } else {
        final pickedFile = await ImagesPicker.pick(
          count: 1,
          pickType: PickType.image,
        );
        if (pickedFile != null) {
          setState(() {
            attachment = File(pickedFile[0].path);
          });
        }
      }
    }
  }

  void showError(String msg) {
    AlertX.instance.showAlert(
        title: "Error",
        msg: msg,
        positiveButtonText: "Done",
        positiveButtonPressed: () {
          Navigation.instance.goBack();
        });
  }
}
