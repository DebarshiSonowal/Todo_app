import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:images_picker/images_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/models/daily_routine_model.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/routes.dart';
import '../../../../models/reminder_list_item.dart';
import '../../../../repository/repository.dart';
import '../../../../services/Navigate.dart';
import '../../../../widget/alert.dart';
import '../../../../widget/bullet_note_item_list_empty.dart';
import '../../../../widget/bullet_note_item_list_not_empty.dart';
import '../../../../widget/image_popup_body.dart';
import '../../../../widget/routine_item_widget.dart';

class EditDailyRoutineNormalCard extends StatelessWidget {
  EditDailyRoutineNormalCard(
      {Key? key,
      required this.index,
      required this.titleController,
      required this.reminders,
      required this.updateImage,
      required this.attachment})
      : super(key: key);
  final int index;
  final TextEditingController titleController;
  final List<ReminderListItem> reminders;
  final Function(File) updateImage;
  final File? attachment;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  final ImagePicker picker = ImagePicker();

  // File? attachment;
  // final titleController = TextEditingController();
  // List<ReminderListItem> reminders = [];

  // @override
  // void dispose() {
  //   super.dispose();
  //   titleController.dispose();
  //   descController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<Repository>(builder: (context, data, _) {
      var current = data.models[index];
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
                      // initialValue: current.title,
                      controller: titleController,
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
                    child: current.reminders.isNotEmpty
                        ? BulletNoteItemListNotEmpty(
                            current: current,
                            index: index,
                            type: 0,
                          )
                        : BulletNoteItemListEmpty(
                            reminders: reminders,
                            count: index,
                            type: 0,
                          ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      showPhotoBottomSheet(getSelectedImage);
                    },
                    child: data.models[index].image == null
                        ? (attachment == null
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
                                backgroundColor: Colors.transparent,
                                radius: 30.sp, // Image radius
                                backgroundImage:
                                    Image.file(File(attachment?.path ?? ""))
                                        .image,
                              ))
                        : (CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 30.sp, // Image radius
                            backgroundImage: (data.models[index].type == 1
                                    ? Image.file(
                                        File(data.models[index].image!),
                                        errorBuilder: (error, str, _) {
                                          return Image.asset(
                                            data.models[index].image!,
                                          );
                                        },
                                      )
                                    : Image.asset(
                                        data.models[index].image!,
                                        errorBuilder: (error, str, _) {
                                          return Image.asset(
                                            data.models[index].image!,
                                          );
                                        },
                                      ))
                                .image,
                          )),
                  )
                ],
              ),
            ),
          ),
          // IconButton(
          //   onPressed: () {
          //     data.models.removeAt(index);
          //     Fluttertoast.showToast(msg: "Deleted Successfully");
          //     Navigation.instance.navigateAndReplace(Routes.dashboard);
          //   },
          //   icon: SvgPicture.asset(
          //     Constances.trashIcon,
          //     fit: BoxFit.fill,
          //     height: 15.sp,
          //   ),
          // ),
        ],
      );
    });
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
            // setState(() {
            // widget.attachment = File(i.path);
            updateImage(File(i.path));
            // });
          }
        }
      }
    } else {
      var result = await deviceInfo.androidInfo;
      debugPrint(result.version.release);
      if (result.version.sdkInt < 33) {
        var status = await Permission.storage.request();
        if (status.isDenied) {
          showError("Permission Denied");
        } else {
          final pickedFile = await ImagesPicker.pick();
          if (pickedFile != null) {
            updateImage(File(pickedFile[0].path));
          }
        }
      } else {
        var status = await Permission.photos.request();
        if (status.isDenied) {
          showError("Permission Denied");
        } else {
          final pickedFile =
              await picker.pickImage(source: ImageSource.gallery);
          if (pickedFile != null) {
            updateImage(File(pickedFile.path));
          }
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
