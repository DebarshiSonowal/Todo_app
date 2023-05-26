import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';
import '../../../../repository/repository.dart';
import '../../../../services/Navigate.dart';
import '../../../../widget/alert.dart';

class PersonalTimeDateRoutineNormalCard extends StatelessWidget {
  PersonalTimeDateRoutineNormalCard({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  // final TextEditingController titleController;
  // final List<ReminderListItem> reminders;

  @override
  Widget build(BuildContext context) {
    return Consumer<Repository>(builder: (context, data, _) {
      var current = data.personals[index];
      return Stack(
        alignment: Alignment.bottomRight,
        children: [
          Card(
            elevation: 7,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              padding: EdgeInsets.only(
                // horizontal: 2.w,
                // vertical: 2.h,
                bottom: 1.5.h,
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
                    margin: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 1.h,
                    ),
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
                      "${data.personals[index].title}",
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
                    child: ListView.separated(
                      itemBuilder: (context, position) {
                        var item = data.personals[index].reminders[position];
                        return Text(
                          "${position + 1}. ${item.title}",
                          style:
                              Theme.of(context).textTheme.headline4?.copyWith(
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
                      itemCount: data.personals[index].reminders.length,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  data.personals[index].type == 1
                      ? CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 30.sp, // Image radius
                          backgroundImage: (Image.file(
                            File(data.personals[index].image!),
                            errorBuilder: (error, str, _) {
                              return Image.asset(
                                data.personals[index].image!,
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
                            data.personals[index].image!,
                            errorBuilder: (error, str, _) {
                              return Image.asset(
                                data.personals[index].image!,
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
