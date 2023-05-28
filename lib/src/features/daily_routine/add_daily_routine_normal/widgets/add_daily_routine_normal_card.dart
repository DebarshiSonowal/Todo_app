import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:images_picker/images_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';

import '../../../../constants/constants.dart';
import '../../../../models/reminder_list_item.dart';
import '../../../../services/Navigate.dart';
import '../../../../widget/alert.dart';
import '../../../../widget/bullet_formater.dart';
import '../../../../widget/bullet_note_item_list_empty.dart';
import '../../../../widget/image_popup_body.dart';
import 'add_bullet_note_list_empty.dart';

class AddDailyRoutineNormalCard extends StatefulWidget {
  const AddDailyRoutineNormalCard(
      {Key? key,
      required this.titleController,
      required this.reminders,
      required this.imageUpdate, required this.textController})
      : super(key: key);
  final TextEditingController titleController,textController;
  final List<ReminderListItem> reminders;
  final Function(File) imageUpdate;

  @override
  State<AddDailyRoutineNormalCard> createState() =>
      _AddDailyRoutineNormalCardState();
}

class _AddDailyRoutineNormalCardState extends State<AddDailyRoutineNormalCard> {
  File? attachment;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  final ImagePicker picker = ImagePicker();

  // @override
  // void dispose() {
  //   super.dispose();
  //   titleController.dispose();
  //   descController.dispose();
  // }
  bool isDone = false;

  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

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
                    autofocus: isDone ? false : true,
                    controller: widget.titleController,
                    onTapOutside: (event) {
                      debugPrint("debugTappedOutside ${event.down}");
                      isDone = true;
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    maxLines: 2,
                    minLines: 1,
                    cursorColor: Colors.white,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Title',
                      hintStyle:
                          Theme.of(context).textTheme.headline4?.copyWith(
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.w,
                    vertical: 2.h,
                  ),
                  decoration: const BoxDecoration(
                    color: Constances.textFieldBackground,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  width: double.infinity,
                  child: TextFormField(
                    autofocus: false,
                    // focusNode: widget.focusNode??null,
                    // maxLines: 1,
                    controller: widget.textController,
                    focusNode: _focusNode,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    textInputAction: TextInputAction.newline,
                    inputFormatters: [
                      BulletFormatter2(),
                    ],
                    // onEditingComplete: () {
                    //   // debugPrint("onEditingComplete1");
                    //   if (textEditingController.text.isEmpty) {
                    //     widget.remove();
                    //   }
                    // },
                    // onFieldSubmitted: (val) {
                    //   if (val.isNotEmpty) {
                    //     setState(() {
                    //       txt = val;
                    //     });
                    //     widget.updateList(
                    //         val,
                    //         timePicked == null
                    //             ? widget.item.timeDate!
                    //             : timePicked!.toDateTime());
                    //   } else {
                    //     widget.remove();
                    //   }
                    // },
                    // minLines: 1,
                    // initialValue: "${widget.item.title}",
                    cursorColor: Colors.white,
                    decoration: InputDecoration.collapsed(
                      hintText: '',
                      hintStyle: Theme.of(context).textTheme.headline4?.copyWith(
                        fontSize: 12.sp,
                        color: Colors.white60,
                        // fontWeight: FontWeight.bold,
                        fontFamily: "Roboto",
                      ),
                    ),
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                      fontSize: 12.sp,
                      color: Colors.white,
                      fontFamily: "Roboto",
                    ),
                  ),
                  // child: AddBulletNoteItemListEmpty(
                  //   reminders: widget.reminders,
                  //   onTap: (val) {
                  //     setState(() {});
                  //   },
                  //   remove: (index) {
                  //     // Provider.of<Repository>(context, listen: false)
                  //     //     .removeDailyReminder(index);
                  //     setState(() {});
                  //   },
                  // ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                GestureDetector(
                  onTap: () {
                    showPhotoBottomSheet(getSelectedImage);
                  },
                  child: attachment == null
                      ?
                      // ClipRRect(
                      //         borderRadius: BorderRadius.circular(100),
                      //         child: SvgPicture.asset(
                      //           Constances.customCameraImage,
                      //           color: Colors.white38,
                      //           fit: BoxFit.cover,
                      //           height: 50.sp,
                      //           width: 50.sp,
                      //         ),
                      //       )
                      ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            Constances.customCameraImage,
                            // color: Colors.white38,
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
        // IconButton(
        //   onPressed: () {},
        //   icon: SvgPicture.asset(
        //     Constances.trashIcon,
        //     fit: BoxFit.fill,
        //     height: 15.sp,
        //   ),
        // ),
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

