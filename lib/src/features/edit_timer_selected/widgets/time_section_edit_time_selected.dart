import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:time_picker_sheet/widget/sheet.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';
import 'package:vishal_todo_app/src/widget/routine_item_widget.dart';

import '../../../constants/constants.dart';
import '../../../repository/repository.dart';
import 'am_pm_switch.dart';

extension DateTimeExtension on Time {
  DateTime toDateTime() {
    return DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, hour, minute, second);
  }
}

class TimerSectionEditTimeSelected extends StatelessWidget {
  TimerSectionEditTimeSelected({
    super.key,
    required this.alarmDateTime,
    required this.index,
    required this.data,
    required this.updateParent,
    required this.num,
    this.type,
  });

  final int? type;
  final DateTime? alarmDateTime;
  final int index, num;
  final Repository data;
  Time? timePicked;
  final Function updateParent;

  void onTimeChanged(DateTime time, BuildContext context) {
    // timePicked = newTime;
    // alarmDateTime = timePicked!.toDateTime();
    // MaterialLocalizations.of(context).formatTimeOfDay(timePicked!);
    if (type == null) {
      debugPrint("${time.hour} ${time.minute}");
      Provider.of<Repository>(context, listen: false).updateTimeSelection(
        index,
        num,
        DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          time.hour,
          time.minute,
          // timePicked!.second,
        ),
      );
    } else {
      debugPrint("${time.hour} ${time.minute}");
      Provider.of<Repository>(context, listen: false)
          .updateTimeSelectionPersonal(
        index,
        num,
        DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          time.hour,
          time.minute,
          // timePicked!.second,
        ),
      );
    }
    updateParent();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 4.h,
        ),
        decoration: const BoxDecoration(
          color: Color(0xff3c404f),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          // shape: BoxShape.circle,
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                pickTime(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Time',
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontFamily: "PublicSans",
                          // fontWeight: FontWeight.bold,
                        ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                      vertical: 1.h,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xff596077),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      // shape: BoxShape.circle,
                    ),
                    child: Text(
                      DateFormat("hh:mm").format(alarmDateTime ??
                          (type == null ? data.models : data.personals)[index]
                              .reminders[num]
                              .timeDate!),
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontFamily: "RobotoFlex",
                            // fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 0.2.h,
                      horizontal: 0.2.w,
                    ),
                    width: 23.w,
                    height: 5.h,
                    decoration: const BoxDecoration(
                      color: Color(0xff596077),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      // shape: BoxShape.circle,
                    ),
                    child: Row(
                      children: [
                        AmPmSwitch(
                          value: DateFormat("a")
                                      .format(alarmDateTime ??
                                          (type == null
                                                  ? data.models
                                                  : data.personals)[index]
                                              .dateTime!)
                                      .toUpperCase() ==
                                  "AM"
                              ? true
                              : false,
                          text: "AM",
                        ),
                        AmPmSwitch(
                          value: DateFormat("a")
                                      .format(alarmDateTime ??
                                          (type == null
                                                  ? data.models
                                                  : data.personals)[index]
                                              .dateTime!)
                                      .toUpperCase() ==
                                  "PM"
                              ? true
                              : false,
                          text: "PM",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void pickTime(BuildContext context) async {
    // Navigator.of(context).push(
    //   showPicker(
    //     context: context,
    //     is24HrFormat: false,
    //     value: timePicked ??
    //         Time(
    //           hour: DateTime.now().day,
    //           minute: DateTime.now().minute,
    //           second: DateTime.now().second,
    //         ),
    //     onChange: (val) => onTimeChanged(val, context),
    //   ),
    // );
    // TimeOfDay? pickedTime = await showTimePicker(
    //   initialTime: TimeOfDay.now(),
    //   context: context,
    //   helpText: "",
    //   builder: (context, child) {
    //     return Theme(
    //       data: Theme.of(context).copyWith(
    //         // This uses the _timePickerTheme defined above
    //         timePickerTheme: const TimePickerThemeData(
    //           backgroundColor: Constances.darkBlueBackground,
    //           hourMinuteShape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.all(Radius.circular(8)),
    //             // side: BorderSide(color: Colors.orange, width: 4),
    //           ),
    //           // dayPeriodBorderSide:
    //           //     const BorderSide(color: Colors.orange, width: 4),
    //           dayPeriodColor: Constances.timerColor,
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.all(Radius.circular(8)),
    //             // side: BorderSide(color: Colors.orange, width: 4),
    //           ),
    //           dayPeriodTextColor: Colors.white,
    //           dayPeriodShape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.all(Radius.circular(8)),
    //             // side: BorderSide(color: Colors.orange, width: 4),
    //           ),
    //           hourMinuteColor: Constances.timerColor,
    //           hourMinuteTextColor: Colors.white,
    //           dialHandColor: Colors.black,
    //           dialBackgroundColor: Constances.timerColor,
    //           hourMinuteTextStyle:
    //               TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //           dayPeriodTextStyle:
    //               TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    //           helpTextStyle: TextStyle(
    //             fontSize: 14,
    //             fontWeight: FontWeight.bold,
    //             color: Colors.white,
    //           ),
    //           inputDecorationTheme: InputDecorationTheme(
    //             border: InputBorder.none,
    //             contentPadding: EdgeInsets.all(0),
    //           ),
    //           dialTextColor: Colors.white,
    //           entryModeIconColor: Colors.white,
    //         ),
    //       ),
    //       child: child!,
    //     );
    //   }, //context of current state
    // ).then((value){
    //   if (value != null) {
    //     onTimeChanged(
    //         Time(
    //           hour: value.hour,
    //           minute: value.minute,
    //         ),
    //         context);
    //   }
    //   return null;
    // });
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
      debugPrint("picked: ${ result.hour} ${result.minute==0?00:result.minute}");
      onTimeChanged(
          DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            result.hour, result.minute==0?00:result.minute,
            // timePicked!.second,
          ),
          context);
    }
  }
}
