import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../../constants/routes.dart';
import '../../models/daily_routine_model.dart';
import '../../models/reminder_list_item.dart';
import '../../models/timer_section_option_model.dart';
import '../../repository/repository.dart';
import '../../services/Navigate.dart';
import '../../widget/alert.dart';
import '../personal_enter_info/widgets/personal_info_page_card.dart';
import 'widgets/personal_time_date_appbar.dart';
import 'widgets/stacked_time_selector.dart';

class PersonalTimerDatePage extends StatefulWidget {
  const PersonalTimerDatePage({Key? key, required this.index})
      : super(key: key);
  final int index;

  @override
  State<PersonalTimerDatePage> createState() => _PersonalTimerDatePageState();
}

class _PersonalTimerDatePageState extends State<PersonalTimerDatePage> {
  File? attachment;
  List<ReminderListItem> reminders = [];
  final TextEditingController titleController = TextEditingController();
  // final TextEditingController descriptionController = TextEditingController();
  late String dateTime;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1),(){
      loadDataIntoFields();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(9.h),
        child: PersonalDateTimeAppBar(
          savePersonal: () {
            if (titleController.text.isNotEmpty &&
                reminders.isNotEmpty &&
                attachment != null) {
              // debugPrint(DateFormat("hh:mm a").format(DateTime.now()));
              Provider.of<Repository>(context, listen: false)
                  .addPersonal(DailyRoutineModel(
                titleController.text,
                DateFormat("hh:mm a").format(DateTime.now()),
                DateTime.now(),
                attachment!.path,
                reminders,
                // TimerSelectionOptions(
                //   "NA",10,false,
                // ),
              ));
              Future.delayed(const Duration(seconds: 1), () {
                Navigation.instance.navigate(
                  Routes.personalTimeDateSelector,
                  args: Provider.of<Repository>(context, listen: false)
                      .models
                      .length-1,
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
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 100.h,
              width: 100.w,
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
                vertical: 2.h,
              ),
              color: Colors.transparent,
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
                      delete: () {

                      },
                      file: attachment, reminders: reminders,
                    ),
                  ],
                ),
              ),
            ),
            PersonalStackedCardTimeDate(
              index: widget.index,
            ),
          ],
        ),
      ),
    );
  }
  void loadDataIntoFields() async {
    titleController.text = Provider.of<Repository>(context, listen: false)
        .personals[widget.index]
        .title ??
        "";
    // descriptionController.text = Provider.of<Repository>(context, listen: false)
    //     .personals[widget.index]
    //     .description ??
    //     "";
    attachment = File(Provider.of<Repository>(context, listen: false)
        .personals[widget.index]
        .image ??
        "");
    dateTime =DateFormat("dd MM yyyy | HH:mm a").format(Provider.of<Repository>(context, listen: false).personals[widget.index].dateTime!);

    setState(() {
      attachment = File(Provider.of<Repository>(context, listen: false)
          .personals[widget.index]
          .image ??
          "");
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
