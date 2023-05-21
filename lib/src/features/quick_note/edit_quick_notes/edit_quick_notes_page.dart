import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:time_picker_sheet/widget/sheet.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';
import 'package:vishal_todo_app/src/features/quick_note/add_quick_notes/widgets/add_quick_notes_appbar.dart';
import 'package:vishal_todo_app/src/models/quick_note.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import '../../../constants/constants.dart';
import 'widgets/edit_quick_notes_appbar.dart';
import 'widgets/pick_calendar_widget.dart';

class EditQuickNotesPage extends StatefulWidget {
  const EditQuickNotesPage({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<EditQuickNotesPage> createState() => _EditQuickNotesPageState();
}

class _EditQuickNotesPageState extends State<EditQuickNotesPage> {
  final controller = TextEditingController();
  DateTime? pickedDate, time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(9.h),
        child: EditQuickNotesAppbar(
          onTap: () {
            if (controller.text.isNotEmpty) {
              Provider.of<Repository>(context, listen: false).updateQuickNote(
                  QuickNote(
                    controller.text,
                    DateFormat("dd MMM yyyy")
                        .format(pickedDate ?? DateTime.now()),
                    DateFormat("HH:mm a").format(time ?? DateTime.now()),
                  ),
                  widget.index);
              Navigation.instance.goBack();
            } else {}
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
            Consumer<Repository>(builder: (context, data, _) {
              return Container(
                height: 3.h,
                width: double.infinity,
                color: const Color(0xffd9d9d9),
                padding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width:15.w,
                      child: Text(
                        time == null
                            ? ("")
                            : DateFormat("hh:mm a").format(time!),
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              // fontWeight: FontWeight.bold,
                              fontFamily: "Rubik",
                            ),
                      ),
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    Text(
                      pickedDate == null
                          ? (data.quickNotes[widget.index].date ?? " ")
                          : DateFormat("dd MMM yyyy").format(pickedDate!),
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            // fontWeight: FontWeight.bold,
                            fontFamily: "Rubik",
                          ),
                    ),
                  ],
                ),
              );
            }),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                  vertical: 1.h,
                  // vertical: 2.5.h,
                ),
                // height: 82.h,
                // color: Colors.white,
                width: double.infinity,
                child: TextFormField(
                  controller: controller,
                  maxLines: null,
                  // maxLines: 1,
                  onFieldSubmitted: (val) {
                    if (val.isNotEmpty) {}
                  },
                  // minLines: 1,
                  // initialValue: "${item.title}",
                  decoration: InputDecoration.collapsed(
                    hintText: 'Text',
                    hintStyle: Theme.of(context).textTheme.headline4?.copyWith(
                          fontSize: 12.sp,
                          color: Colors.black54,
                          // fontWeight: FontWeight.bold,
                          fontFamily: "Roboto",
                        ),
                  ),
                  style: Theme.of(context).textTheme.headline4?.copyWith(
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

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      controller.text = Provider.of<Repository>(context, listen: false)
              .quickNotes[widget.index]
              .description ??
          "";
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
        delete(context);
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
            pickedDate = value;
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

  void delete(BuildContext context) {
    Provider.of<Repository>(context, listen: false).deleteQuickNote(
        Provider.of<Repository>(context, listen: false)
            .quickNotes[widget.index]);
    Navigation.instance.goBack();
  }
}
