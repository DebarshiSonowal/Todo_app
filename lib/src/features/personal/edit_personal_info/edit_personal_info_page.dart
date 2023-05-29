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
import '../../../repository/repository.dart';
import '../../../services/Navigate.dart';
import '../personal_enter_info/widgets/add_personal_info_appbar.dart';
import '../personal_enter_info/widgets/personal_info_page_card.dart';

class EditPersonalInfoPage extends StatefulWidget {
  const EditPersonalInfoPage({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<EditPersonalInfoPage> createState() => _EditPersonalInfoPageState();
}

class _EditPersonalInfoPageState extends State<EditPersonalInfoPage> {
  File? attachment;
  final TextEditingController titleController = TextEditingController();

  // final TextEditingController descriptionController = TextEditingController();
  late String dateTime;
  List<ReminderListItem> reminders = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () {
      Provider.of<Repository>(context,listen: false).setRecent(Provider.of<Repository>(context, listen: false)
          .personals[widget.index]);

      Future.delayed(const Duration(seconds: 1), () {
        debugPrint(
            "asdad ${Provider.of<Repository>(context, listen: false).recentModel!.id} ${Provider.of<Repository>(context, listen: false).personals[widget.index].id}");
        loadDataIntoFields();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(9.h),
        child: AddPersonalInfoAppbar(
          savePersonal: () {
            // Provider.of<Repository>(context, listen: false)
            //     .addRecentDailyReminder(DailyRoutineModel(
            //         titleController.text,
            //         DateFormat("hh:mm a").format(
            //           DateTime(DateTime.now().year, DateTime.now().month,
            //               DateTime.now().day, 12, 0),
            //         ),
            //         DateTime(DateTime.now().year, DateTime.now().month,
            //             DateTime.now().day, 12, 0),
            //         attachment!.path,
            //         reminders,
            //         1,
            //         ""
            //         // TimerSelectionOptions(
            //         //   "NA",
            //         //   10,
            //         //   false,
            //         // ),
            //         ));
            // Provider.of<Repository>(context, listen: false).modifyPersonals(
            //     widget.index,
            //     DailyRoutineModel(
            //       titleController.text,
            //       DateFormat("hh:mm a").format(
            //         DateTime(DateTime.now().year, DateTime.now().month,
            //             DateTime.now().day, 12, 0),
            //       ),
            //       DateTime(DateTime.now().year, DateTime.now().month,
            //           DateTime.now().day, 12, 0),
            //       attachment!.path,
            //       reminders,
            //       1,
            //       "",
            //       // TimerSelectionOptions(
            //       //   "NA",10,false,
            //       // ),
            //     ));
            Future.delayed(const Duration(seconds: 1), () {
              Navigation.instance.navigate(
                Routes.personalTimeDateSelector,
                args: 2,
              );
            });
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
                dateTime: dateTime,
                file: attachment,
                delete: () {
                  Provider.of<Repository>(context, listen: false)
                      .removePersonalBy(
                          Provider.of<Repository>(context, listen: false)
                              .personals[widget.index]);
                  Navigation.instance.navigateAndRemoveUntil(Routes.dashboard);
                },
                reminders: reminders,
              )
            ],
          ),
        ),
      ),
    );
  }

  void loadDataIntoFields() async {
    titleController.text = Provider.of<Repository>(context, listen: false)
            // .personals[widget.index]
            .recentModel!
            .title ??
        "";

    // descriptionController.text = Provider.of<Repository>(context, listen: false)
    //         .personals[widget.index]
    //         .description ??
    //     "";
    attachment = File(Provider.of<Repository>(context, listen: false)
            // .personals[widget.index]
            .recentModel!
            .image ??
        "");
    dateTime = DateFormat("dd MM yyyy | HH:mm a")
        .format(Provider.of<Repository>(context, listen: false)
            // .personals[widget.index]
            .recentModel!
            .dateTime!);
    reminders = Provider.of<Repository>(context, listen: false)
            // .personals[widget.index]
            .recentModel!
            .reminders ??
        [];
    setState(() {
      attachment = File(Provider.of<Repository>(context, listen: false)
              // .personals[widget.index]
              .recentModel!
              .image ??
          "");
    });
  }
}
