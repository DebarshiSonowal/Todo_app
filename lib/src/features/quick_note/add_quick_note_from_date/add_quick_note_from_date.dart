import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:time_picker_sheet/widget/sheet.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';

import '../../../constants/constants.dart';
import '../../../constants/routes.dart';
import '../../../models/quick_note.dart';
import '../../../repository/repository.dart';
import '../../../services/Navigate.dart';
import '../../../widget/alert.dart';
import '../add_quick_notes/widgets/add_quick_notes_appbar.dart';
import '../edit_quick_notes/widgets/edit_quick_notes_appbar.dart';
import '../edit_quick_notes/widgets/pick_calendar_widget.dart';

class AddQuickNoteFromDate extends StatefulWidget {
  const AddQuickNoteFromDate({Key? key, required this.dateTime}) : super(key: key);
  final String dateTime;
  @override
  State<AddQuickNoteFromDate> createState() => _AddQuickNoteFromDateState();
}

class _AddQuickNoteFromDateState extends State<AddQuickNoteFromDate> {
  final controller = TextEditingController();

  DateTime? time, date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(9.h),
        child: EditQuickNotesAppbar(
          onTap: () {
            if (controller.text.isNotEmpty) {
              Provider.of<Repository>(context, listen: false)
                  .addQuickNote(QuickNote(
                controller.text,
                date == null
                    ? widget.dateTime
                    : DateFormat("dd MMM yyyy").format(date!),
                time == null
                    ? DateFormat("HH:mm a").format(DateTime(
                  DateTime
                      .now()
                      .year,
                  DateTime
                      .now()
                      .month,
                  DateTime
                      .now()
                      .day,
                  12,
                  00,
                ))
                    : DateFormat("HH:mm a").format(time!),
              ));
              Navigation.instance.goBack();
            } else {
              showError("Cannot add empty note");
            }
          },
          onTapOptions: (int val) {
            debugPrint("onTapOptions ${val}");
            Future.delayed(Duration.zero, () {
              changeOptions(val, context);
            });
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.white,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 4.h,
              width: double.infinity,
              color: const Color(0xffd9d9d9),
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
                vertical: 1.h,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 28.w,
                    child: Text(
                      time == null ? ("") : DateFormat("hh:mm a").format(time!),
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        // fontWeight: FontWeight.bold,
                        fontFamily: "Rubik",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    date == null
                        ? (widget.dateTime)
                        : DateFormat("dd MMM yyyy").format(date!),
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      // fontWeight: FontWeight.bold,
                      fontFamily: "Rubik",
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                  vertical: 2.5.h,
                ),
                child: TextFormField(
                  controller: controller,
                  // maxLines: 1,
                  onFieldSubmitted: (val) {
                    if (val.isNotEmpty) {}
                  },
                  maxLines: null,
                  // initialValue: "${item.title}",
                  decoration: InputDecoration.collapsed(
                    hintText: 'Text',
                    hintStyle: Theme
                        .of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(
                      fontSize: 12.sp,
                      color: Colors.black54,
                      // fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
                  ),
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
            ),
          ],
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

  void changeOptions(int val, BuildContext context) {
    switch (val) {
      case 1:
        pickDate(context);
        break;
      case 2:
        pickTime(context);
        break;
      case 4:
        break;
      default:
        break;
    }
  }

  void pickDate(BuildContext context) async {
    final result = showDialog(
        context: context,
        barrierColor: Colors.transparent,
        builder: (context) {
          return const PickCalendarWidget();
        }).then((value) {
      if (value != null) {
        if (!context.mounted) return;
        setState(() {
          date = value;
        });
      }
    });
    // DateTime? pickedDate2 = await showDatePicker(
    //     context: context,
    //     initialDate: DateTime.now(),
    //     //get today's date
    //     firstDate: DateTime(DateTime.now().year),
    //     //DateTime.now() - not to allow to choose before today.
    //     lastDate: DateTime(DateTime.now().year + 10));
    // if (pickedDate2 != null) {
    //   if (!context.mounted) return;
    //   setState(() {
    //     pickedDate = pickedDate2;
    //   });
    // }
  }

  void pickTime(BuildContext context) async {
    final result = await TimePicker.show<DateTime?>(
      context: context,
      sheet: TimePickerSheet(
        sheetTitle: '',
        hourTitle: 'Hour',
        minuteTitle: 'Minute',
        saveButtonText: 'Save',
        minuteInterval: 5,
        // maxHour: 12,
        // maxMinute: 60,

        saveButtonColor: Constances.blueBackground,

        sheetTitleStyle: TextStyle(
          color: Constances.blueBackground,
          fontWeight: FontWeight.bold,
          fontSize: 15.sp,
        ),
        hourTitleStyle: TextStyle(
          color: Constances.blueBackground,
          fontWeight: FontWeight.bold,
          fontSize: 15.sp,
        ),
        minuteTitleStyle: TextStyle(
          color: Constances.blueBackground,
          fontWeight: FontWeight.bold,
          fontSize: 15.sp,
        ),
        wheelNumberSelectedStyle: TextStyle(
          color: Constances.darkBlueBackground,
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
        ),
        wheelNumberItemStyle: TextStyle(
          color: Colors.black45,
          fontSize: 16.sp,
        ),
        sheetCloseIconColor: Colors.black,
      ),
    );
    if (result != null) {
      if (!context.mounted) return;
      setState(() {
        time = result;
      });
    }
  }
}
