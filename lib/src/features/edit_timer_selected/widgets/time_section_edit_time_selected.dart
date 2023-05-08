import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
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
    required this.updateParent, required this.num, this.type,
  });
  final int? type;
  final DateTime? alarmDateTime;
  final int index,num;
  final Repository data;
  Time? timePicked;
  final Function updateParent;

  void onTimeChanged(Time newTime, BuildContext context) {
    timePicked = newTime;
    // alarmDateTime = timePicked!.toDateTime();
    MaterialLocalizations.of(context).formatTimeOfDay(timePicked!);
    if (type==null) {
      Provider.of<Repository>(context, listen: false)
              .updateTimeSelection(index,num, timePicked!.toDateTime());
    } else {
      Provider.of<Repository>(context, listen: false)
          .updateTimeSelectionPersonal(index,num, timePicked!.toDateTime());
    }
    updateParent();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                Navigator.of(context).push(
                  showPicker(
                    context: context,
                    is24HrFormat: false,
                    value: timePicked ??
                        Time(
                          hour: DateTime.now().day,
                          minute: DateTime.now().minute,
                          second: DateTime.now().second,
                        ),
                    onChange: (val) => onTimeChanged(val, context),
                  ),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Timer',
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontFamily: "PublicSans",
                          // fontWeight: FontWeight.bold,
                        ),
                  ),
                  // SizedBox(
                  //   width: 4.w,
                  // ),
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
                      DateFormat("hh:mm").format(
                          alarmDateTime ?? (type==null?data
                              .models:data.personals)[index].reminders[num].timeDate!),
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontSize: 16.sp,
                            color: Constances.editTimeSelectedCardTextColor,
                            fontFamily: "RobotoFlex",
                            // fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 4.w,
                  // ),
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
                              (type==null?data
                                  .models:data.personals)[index].dateTime!)
                                      .toUpperCase() ==
                                  "AM"
                              ? true
                              : false,
                          text: "AM",
                        ),
                        AmPmSwitch(
                          value: DateFormat("a")
                              .format(alarmDateTime ??
                              (type==null?data
                                  .models:data.personals)[index].dateTime!)
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
}
