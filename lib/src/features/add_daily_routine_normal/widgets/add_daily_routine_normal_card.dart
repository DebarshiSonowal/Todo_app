import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:images_picker/images_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../models/reminder_list_item.dart';
import '../../../services/Navigate.dart';
import '../../../widget/alert.dart';
import '../../../widget/bullet_note_item_list_empty.dart';
import '../../../widget/image_popup_body.dart';
import 'add_bullet_note_list_empty.dart';

class AddDailyRoutineNormalCard extends StatefulWidget {
  const AddDailyRoutineNormalCard({Key? key, required this.titleController, required this.reminders, required this.imageUpdate})
      : super(key: key);
  final TextEditingController titleController;
  final List<ReminderListItem> reminders;
  final Function(File) imageUpdate;
  @override
  State<AddDailyRoutineNormalCard> createState() =>
      _AddDailyRoutineNormalCardState();
}

class _AddDailyRoutineNormalCardState extends State<AddDailyRoutineNormalCard> {
  File? attachment;


  // @override
  // void dispose() {
  //   super.dispose();
  //   titleController.dispose();
  //   descController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Card(
          elevation: 7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 2.w,
              vertical: 2.h,
            ),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Constances.blueBackground,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                //  showPhotoBottomSheet(getSelectedImage);
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 0.5.h,
                  ),
                  decoration: const BoxDecoration(
                    color: Constances.textFieldBackground,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  width: double.infinity,
                  child: TextFormField(
                    controller: widget.titleController,
                    maxLines: 2,
                    minLines: 1,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Title',
                      hintStyle:
                          Theme.of(context).textTheme.headline4?.copyWith(
                                fontSize: 12.sp,
                                color: Colors.white70,
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
                  height: 1.h,
                ),
                Container(
                  height: 30.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.w,
                    vertical: 2.h,
                  ),
                  decoration: const BoxDecoration(
                    color: Constances.textFieldBackground,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  width: double.infinity,
                  child: AddBulletNoteItemListEmpty(
                    reminders: widget.reminders, onTap: (val) {
                      setState(() {

                      });
                  },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                GestureDetector(
                  onTap: () {
                    showPhotoBottomSheet(getSelectedImage);
                  },
                  child: attachment == null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: SvgPicture.asset(
                            Constances.addImageIcon,
                            color: Colors.white38,
                            fit: BoxFit.cover,
                            height: 50.sp,
                            width: 50.sp,
                          ),
                        )
                      : CircleAvatar(
                          radius: 30.sp, // Image radius
                          backgroundImage:
                              Image.file(File(attachment?.path ?? "")).image,
                        ),
                )
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            Constances.trashIcon,
            fit: BoxFit.fill,
            height: 15.sp,
          ),
        ),
      ],
    );
  }

  void showPhotoBottomSheet(Function(int) getImage) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    BuildContext? context = Navigation.instance.navigatorKey.currentContext;
    if (context != null) {
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) {
            return ImagePopUpBody(
              getImage: getImage,
            );
          });
    }
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
            widget.imageUpdate(attachment!);
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
          widget.imageUpdate(attachment!);
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