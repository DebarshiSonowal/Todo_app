import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';

import '../../../constants/constants.dart';
import '../../../constants/routes.dart';
import '../../../models/daily_routine_model.dart';
import '../../../models/reminder_list_item.dart';
import '../../../models/timer_section_option_model.dart';
import '../../../services/Navigate.dart';
import '../../../widget/alert.dart';
import '../../../widget/daily_routine_bar.dart';
import 'widgets/add_daily_routine_normal_card.dart';

class AddDailyRoutineNormal extends StatelessWidget {
  AddDailyRoutineNormal({Key? key}) : super(key: key);
  final titleController = TextEditingController();
  final textController = TextEditingController();
  List<ReminderListItem> reminders = [];
  File? attachment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(9.h),
        child: DailyRoutineAppBar(
          onTap: () {
            if (titleController.text.isNotEmpty &&
                // textController.text.isNotEmpty &&
                attachment != null) {
              // debugPrint(DateFormat("hh:mm a").format(DateTime.now()));
              var item = DailyRoutineModel(
                titleController.text,
                // DateFormat("hh:mm a").format(DateTime.now()),
                DateFormat("hh:mm a").format(
                  DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 12, 0),
                ),
                DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day, 12, 0),
                attachment!.path,
                reminders,
                1,
                textController.text,
              );
              Provider.of<Repository>(context, listen: false).addRecentDailyReminder(
                item,
              );
              // if (Provider.of<Repository>(context, listen: false)
              //     .models
              //     .contains(
              //       item,
              //     )) {
              //   Provider.of<Repository>(context, listen: false)
              //       .modifyDailyReminder(
              //     Provider.of<Repository>(context, listen: false)
              //         .models
              //         .indexOf(item),
              //     item,
              //   );
              // } else {
              //   Provider.of<Repository>(context, listen: false)
              //       .addDailyReminder(
              //     item,
              //   );
              // }
              Future.delayed(const Duration(seconds: 0), () {
                Navigation.instance.navigate(
                  Routes.timeDatePicker,
                  args: 1,
                  // index == 1 ? "Drink lemon water" : "Shower",
                );
              });
            } else {
              showError("Enter all the details");
            }
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
          vertical: 1.h,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset(
              Constances.backgroundImage,
            ).image,
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AddDailyRoutineNormalCard(
                titleController: titleController,
                textController:textController,
                reminders: reminders,
                imageUpdate: (File val) {
                  attachment = val;
                },
              ),
            ],
          ),
        ),
      ),
    );
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
