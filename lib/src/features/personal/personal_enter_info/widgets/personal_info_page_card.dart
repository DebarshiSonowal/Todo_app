import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:images_picker/images_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';

import '../../../../constants/constants.dart';
import '../../../../models/reminder_list_item.dart';
import '../../../../services/Navigate.dart';
import '../../../../widget/alert.dart';
import '../../../../widget/bullet_note_item_list_empty.dart';
import '../../../../widget/bullet_note_item_list_not_empty.dart';
import '../../../../widget/image_popup_body.dart';
import '../../../daily_routine/add_daily_routine_normal/widgets/add_bullet_note_list_empty.dart';

class PersonalInfoPageCard extends StatefulWidget {
  const PersonalInfoPageCard({
    Key? key,
    required this.titleController,
    required this.imageUpdate,
    // required this.descriptionController,
    this.dateTime,
    this.file,
    required this.delete,
    required this.reminders,
    this.index,
  }) : super(key: key);
  final TextEditingController titleController

      // , descriptionController
      ;

  final Function(File) imageUpdate;
  final List<ReminderListItem> reminders;
  final String? dateTime;
  final File? file;
  final int? index;
  final Function? delete;

  @override
  State<PersonalInfoPageCard> createState() => _PersonalInfoPageCardState();
}

class _PersonalInfoPageCardState extends State<PersonalInfoPageCard> {
  File? attachment;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  final ImagePicker picker = ImagePicker();
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<Repository>(builder: (context, data, _) {
      return Card(
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            // gradient: Constances.gradient,
            color: Constances.blueBackground,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 1.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 5.w,
                  vertical: 1.h,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 2.w,
                  vertical: 0.5.h,
                ),
                decoration: const BoxDecoration(
                  // color: Constances.selectedDateColor,
                  color: Constances.textFieldBackground,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                width: double.infinity,
                child: TextFormField(
                  autofocus: isDone ? false : true,
                  controller: widget.titleController,
                  onTapOutside: (event) {
                    debugPrint("debugTappedOutside ${event.down}");
                    isDone = true;
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  maxLines: 2,
                  minLines: 1,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Title',
                    hintStyle: Theme.of(context).textTheme.headline4?.copyWith(
                          fontSize: 12.sp,
                          color: Colors.white30,
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
                margin: EdgeInsets.symmetric(
                  horizontal: 5.w,
                ),
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
                  reminders: widget.reminders,
                  onTap: (val) {
                    setState(() {});
                  },
                  remove: (index) {},
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              GestureDetector(
                onTap: () {
                  showPhotoBottomSheet(getSelectedImage);
                },
                child: (attachment == null && widget.file == null)
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          Constances.customCameraImage,
                          // color: Colors.white38,
                          fit: BoxFit.cover,
                          height: 50.sp,
                          width: 50.sp,
                        ),
                      )
                    : attachment == null
                        ? CircleAvatar(
                            radius: 30.sp, // Image radius
                            backgroundImage:
                                Image.file(File(widget.file?.path ?? "")).image,
                          )
                        : CircleAvatar(
                            radius: 30.sp, // Image radius
                            backgroundImage:
                                Image.file(File(attachment?.path ?? "")).image,
                          ),
              ),
              SizedBox(
                height: 1.h,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(),
              //     IconButton(
              //       onPressed: () {
              //         if (widget.delete != null) {
              //           widget.delete!();
              //         }
              //       },
              //       icon: SvgPicture.asset(
              //         Constances.trashIcon,
              //         fit: BoxFit.fill,
              //         height: 13.sp,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
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
        final pickedFile = await picker.pickImage(source: ImageSource.camera);
        if (pickedFile != null) {
          setState(() {
            attachment = File(pickedFile.path);
          });
          widget.imageUpdate(attachment!);
        }
      }
    } else {
      var result = await deviceInfo.androidInfo;
      debugPrint("Release ${result.version.release}");
      if (int.parse(result.version.release) < 13) {
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
      } else {
        var status = await Permission.storage.request();
        if (status.isDenied) {
          showError("Permission Denied");
        } else {
          // final pickedFile = await ImagesPicker.pick(
          //   count: 1,
          //   pickType: PickType.image,
          // );
          final pickedFile =
              await picker.pickImage(source: ImageSource.gallery);
          if (pickedFile != null) {
            setState(() {
              attachment = File(pickedFile.path);
            });
            widget.imageUpdate(attachment!);
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
