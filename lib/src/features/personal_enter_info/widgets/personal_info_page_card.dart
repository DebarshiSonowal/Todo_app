import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:images_picker/images_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../models/reminder_list_item.dart';
import '../../../services/Navigate.dart';
import '../../../widget/alert.dart';
import '../../../widget/image_popup_body.dart';

class PersonalInfoPageCard extends StatefulWidget {
  const PersonalInfoPageCard(
      {Key? key,
      required this.titleController,
      required this.imageUpdate,
      required this.descriptionController})
      : super(key: key);
  final TextEditingController titleController, descriptionController;
  final Function(File) imageUpdate;

  @override
  State<PersonalInfoPageCard> createState() => _PersonalInfoPageCardState();
}

class _PersonalInfoPageCardState extends State<PersonalInfoPageCard> {
  File? attachment;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        // padding: EdgeInsets.symmetric(
        //           horizontal: 5.w,
        //           vertical: 3.h,
        //         ),
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
            //  showPhotoBottomSheet(getSelectedImage);
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 1.h,
                horizontal: 5.w,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Constances.calendarIcon,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    DateFormat("dd MMM yyyy | HH:MM a").format(DateTime.now()),
                    style: TextStyle(
                      fontFamily: "Rubik",
                      fontSize: 10.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 5.w,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 2.w,
                vertical: 0.5.h,
              ),
              decoration: const BoxDecoration(
                color: Constances.selectedDateColor,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              width: double.infinity,
              child: TextFormField(
                controller: widget.titleController,
                maxLines: 2,
                minLines: 1,
                decoration: InputDecoration.collapsed(
                  hintText: 'Title',
                  hintStyle: Theme.of(context).textTheme.headline4?.copyWith(
                        fontSize: 12.sp,
                        color: Colors.black45,
                        // fontWeight: FontWeight.bold,
                        fontFamily: "Roboto",
                      ),
                ),
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      fontSize: 14.sp,
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              height: 25.h,
              margin: EdgeInsets.symmetric(
                horizontal: 5.w,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 3.w,
                vertical: 2.h,
              ),
              decoration: const BoxDecoration(
                color: Constances.selectedDateColor,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              width: double.infinity,
              child: TextFormField(
                controller: widget.descriptionController,
                maxLines: 2,
                minLines: 1,
                decoration: InputDecoration.collapsed(
                  hintText: 'Description',
                  hintStyle: Theme.of(context).textTheme.headline4?.copyWith(
                        fontSize: 12.sp,
                        color: Colors.black45,
                        // fontWeight: FontWeight.bold,
                        fontFamily: "Roboto",
                      ),
                ),
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      fontSize: 14.sp,
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
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
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // decoration: const BoxDecoration(
                  //   color: Color(0xffd8d9d9),
                  //   borderRadius: BorderRadius.only(
                  //     bottomLeft: Radius.circular(20),
                  //     topRight: Radius.circular(20),
                  //   ),
                  // ),
                  // padding: EdgeInsets.symmetric(
                  //   horizontal: 3.w,
                  //   vertical: 1.h,
                  // ),
                  // child: Center(
                  //   child: Text(
                  //     "Add Image",
                  //     style: TextStyle(
                  //       fontFamily: "Roboto",
                  //       fontSize: 13.sp,
                  //       color: Colors.black,
                  //       fontWeight: FontWeight.normal,
                  //     ),
                  //   ),
                  // ),
                ),
                IconButton(
                  onPressed: () {
                    // data.models.removeAt(widget.index);
                    // Fluttertoast.showToast(msg: "Deleted Successfully");
                    // Navigation.instance.navigateAndReplace(Routes.dashboard);
                  },
                  icon: SvgPicture.asset(
                    Constances.trashIcon,
                    fit: BoxFit.fill,
                    height: 13.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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