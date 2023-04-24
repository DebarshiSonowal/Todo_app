import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:images_picker/images_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/models/daily_routine_model.dart';

import '../../../constants/constants.dart';
import '../../../constants/routes.dart';
import '../../../models/reminder_list_item.dart';
import '../../../repository/repository.dart';
import '../../../services/Navigate.dart';
import '../../../widget/alert.dart';
import '../../../widget/bullet_note_item_list_empty.dart';
import '../../../widget/bullet_note_item_list_not_empty.dart';
import '../../../widget/image_popup_body.dart';
import '../../../widget/routine_item_widget.dart';

class EditDailyRoutineNormalCard extends StatefulWidget {
  const EditDailyRoutineNormalCard({Key? key, required this.index})
      : super(key: key);
  final int index;

  @override
  State<EditDailyRoutineNormalCard> createState() =>
      _EditDailyRoutineNormalCardState();
}

class _EditDailyRoutineNormalCardState
    extends State<EditDailyRoutineNormalCard> {
  File? attachment;
  final titleController = TextEditingController();
  final descController = TextEditingController();
  List<ReminderListItem> reminders = [];

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descController.dispose();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() => titleController.text =
          Provider.of<Repository>(context, listen: false)
                  .models[widget.index]
                  .title ??
              "");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Repository>(builder: (context, data, _) {
      var current = data.models[widget.index];
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
                            widget: widget,
                          )
                        : BulletNoteItemListEmpty(
                            reminders: reminders,
                            count: widget.index,
                          ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      showPhotoBottomSheet(getSelectedImage);
                    },
                    child: data.models[widget.index].image == null
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
                        : CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 30.sp, // Image radius
                            backgroundImage: Image.file(
                              File(data.models[widget.index].image!),
                              errorBuilder: (error, str, _) {
                                return Image.asset(
                                  data.models[widget.index].image!,
                                  // fit: BoxFit.fill,
                                  // height: type == 1 ? 5.h : 8.h,
                                  // width: type == 1 ? 11.w : 17.w,
                                );
                              },
                            ).image,
                          ),
                  )
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              data.models.removeAt(widget.index);
              Fluttertoast.showToast(msg: "Deleted Successfully");
              Navigation.instance.navigateAndReplace(Routes.dashboard);
            },
            icon: SvgPicture.asset(
              Constances.trashIcon,
              fit: BoxFit.fill,
              height: 15.sp,
            ),
          ),
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
        final pickedFile = await ImagesPicker.pick();
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
