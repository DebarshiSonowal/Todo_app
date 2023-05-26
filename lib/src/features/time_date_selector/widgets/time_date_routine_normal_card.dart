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

import '../../../constants/constants.dart';
import '../../../models/reminder_list_item.dart';
import '../../../repository/repository.dart';
import '../../../services/Navigate.dart';
import '../../../widget/alert.dart';
import '../../../widget/image_popup_body.dart';

class TimeDateRoutineNormalCard extends StatelessWidget {
  TimeDateRoutineNormalCard({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  // final TextEditingController titleController;
  // final List<ReminderListItem> reminders;

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
                    child: Text(
                      "${data.models[index].title}",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontSize: 12.sp,
                            color: Colors.white,
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
                    child: ListView.separated(
                      itemBuilder: (context, position) {
                        var item = data.models[index].reminders[position];
                        return  Text(
                          "${position + 1}. ${item.title}",
                          style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontSize: 12.sp,
                            color: Colors.white,
                            fontFamily: "Roboto",
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 0.5.h,
                        );
                      },
                      itemCount: data.models[index].reminders.length,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  data.models[index].type == 1
                      ? CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 30.sp, // Image radius
                          backgroundImage: (Image.file(
                            File(data.models[index].image!),
                            errorBuilder: (error, str, _) {
                              return Image.asset(
                                data.models[index].image!,
                              );
                            },
                          )).image,
                        )
                      : Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xff50555C),
                            ),
                          ),
                          child: Image.asset(
                            data.models[index].image!,
                            errorBuilder: (error, str, _) {
                              return Image.asset(
                                data.models[index].image!,
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      );
    });
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
