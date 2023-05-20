import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/routes.dart';

import '../../../constants/constants.dart';
import '../../../models/daily_routine_model.dart';
import '../../../models/personal_model.dart';
import '../../../models/reminder_list_item.dart';
import '../../../models/timer_section_option_model.dart';
import '../../../repository/repository.dart';
import '../../../services/Navigate.dart';
import '../../../widget/alert.dart';
import '../add_personal/widgets/add_personal_page_instructions.dart';
import 'widgets/add_personal_info_appbar.dart';
import 'widgets/personal_info_page_card.dart';

class PersonalEnterInfoPage extends StatefulWidget {
  const PersonalEnterInfoPage({Key? key}) : super(key: key);

  @override
  State<PersonalEnterInfoPage> createState() => _PersonalEnterInfoPageState();
}

class _PersonalEnterInfoPageState extends State<PersonalEnterInfoPage> {
  File? attachment;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  List<ReminderListItem> reminders = [];

  @override
  void initState() {
    super.initState();

  }
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(9.h),
        child: AddPersonalInfoAppbar(
          savePersonal: () {
            if (titleController.text.isNotEmpty &&
                reminders.isNotEmpty &&
                attachment != null) {
              // debugPrint(DateFormat("hh:mm a").format(DateTime.now()));
              Provider.of<Repository>(context, listen: false)
                  .addPersonal(DailyRoutineModel(
                titleController.text,
                DateFormat("hh:mm a").format(
                  DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 12, 0),
                ),
                DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day, 12, 0),
                attachment!.path,
                reminders,1
                // TimerSelectionOptions(
                //   "NA",
                //   10,
                //   false,
                // ),
              ));
              Future.delayed(const Duration(seconds: 1), () {
                Navigation.instance.navigate(
                  Routes.personalTimeDateSelector,
                  args: Provider.of<Repository>(context, listen: false)
                          .personals
                          .length -
                      1,
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
              PersonalInfoPageCard(
                titleController: titleController,
                imageUpdate: (File file) {
                  setState(() {
                    attachment = file;
                  });
                },
                // descriptionController: descriptionController,
                delete: () {}, reminders: reminders,
              )
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
