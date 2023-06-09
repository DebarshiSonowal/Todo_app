import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../constants/routes.dart';
import '../../../models/daily_routine_model.dart';
import '../../../models/reminder_list_item.dart';
import '../../../models/timer_section_option_model.dart';
import '../../../repository/repository.dart';
import '../../../services/Navigate.dart';
import '../../../widget/alert.dart';
import '../../daily_routine/edit_daily_routine/widgets/edit_daily_routine_appbar.dart';
import '../personal_enter_info/widgets/personal_info_page_card.dart';
import 'widgets/personal_time_date_appbar.dart';
import 'widgets/personal_stacked_time_selector.dart';
import 'widgets/personal_time_date_routine_normal_card.dart';

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
    // loadDataIntoFields();
    Future.delayed(const Duration(seconds: 0),
        () => FocusManager.instance.primaryFocus!.unfocus());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(9.h),
        // child: PersonalDateTimeAppBar(
        //   savePersonal: () {
        //     if (titleController.text.isNotEmpty &&
        //         reminders.isNotEmpty &&
        //         attachment != null) {
        //       // debugPrint(DateFormat("hh:mm a").format(DateTime.now()));
        //       Provider.of<Repository>(context, listen: false).addPersonal(
        //         // widget.index,
        //         // DailyRoutineModel(
        //         //     titleController.text,
        //         //     DateFormat("hh:mm a").format(
        //         //       DateTime(DateTime.now().year, DateTime.now().month,
        //         //           DateTime.now().day, 12, 0),
        //         //     ),
        //         //     DateTime(DateTime.now().year, DateTime.now().month,
        //         //         DateTime.now().day, 12, 0),
        //         //     attachment!.path,
        //         //     reminders,
        //         //     1,
        //         //     ""
        //         //     // TimerSelectionOptions(
        //         //     //   "NA",10,false,
        //         //     // ),
        //         //     ),
        //           Provider.of<Repository>(context, listen: false).recentModel!
        //       );
        //       Future.delayed(const Duration(seconds: 1), () {
        //         Navigation.instance.navigate(
        //           Routes.dashboard,
        //           // index == 1 ? "Drink lemon water" : "Shower",
        //         );
        //       });
        //     } else {
        //       showError("Enter all the details");
        //     }
        //   },
        // ),
        child: TimeDateSelectorPersonalAppBar(
          isDone: true,
          index: widget.index,
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
              // padding: EdgeInsets.symmetric(
              //   horizontal: 4.w,
              //   vertical: 2.h,
              // ),
              color: Colors.transparent,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // PersonalInfoPageCard(
                    //   titleController: titleController,
                    //   imageUpdate: (File file) {
                    //     setState(() {
                    //       attachment = file;
                    //     });
                    //   },
                    //   // descriptionController: descriptionController,
                    //   dateTime: dateTime,
                    //   file: attachment,
                    //   delete: () {
                    //     Provider.of<Repository>(context, listen: false)
                    //         .removePersonalBy(
                    //             Provider.of<Repository>(context, listen: false)
                    //                 .personals[widget.index]);
                    //     Navigation.instance
                    //         .navigateAndRemoveUntil(Routes.dashboard);
                    //   },
                    //   reminders: reminders,
                    // ),
                    PersonalTimeDateRoutineNormalCard(
                      index: widget.index,
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

  // void loadDataIntoFields() async {
  //   debugPrint("asdad ${Provider.of<Repository>(context, listen: false)
  //       .recentModel!.id} ");
  //   titleController.text =
  //       Provider.of<Repository>(context, listen: false).recentModel?.title ??
  //           "";
  //
  //   // descriptionController.text = Provider.of<Repository>(context, listen: false)
  //   //         .personals[widget.index]
  //   //         .description ??
  //   //     "";
  //   attachment = File(Provider.of<Repository>(context, listen: false)
  //       .recentModel?.image ??
  //       "");
  //   dateTime = DateFormat("dd MM yyyy | HH:mm a").format(
  //       Provider.of<Repository>(context, listen: false)
  //           .recentModel!.dateTime!);
  //   reminders = Provider.of<Repository>(context, listen: false)
  //       .recentModel?.reminders ??
  //       [];
  //   setState(() {
  //     attachment = File(Provider.of<Repository>(context, listen: false)
  //             .recentModel?.image ??
  //         "");
  //   });
  // }

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
