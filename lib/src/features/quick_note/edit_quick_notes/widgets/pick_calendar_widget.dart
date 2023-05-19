import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/constants.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import '../../../dashboard/widgets/calendar_header.dart';
import '../../../dashboard/widgets/cell_builder_item.dart';

class PickCalendarWidget extends StatefulWidget {
  const PickCalendarWidget({Key? key}) : super(key: key);

  @override
  State<PickCalendarWidget> createState() => _PickCalendarWidgetState();
}

class _PickCalendarWidgetState extends State<PickCalendarWidget> {
  DateTime defaultTime = DateTime.now();
  DateTime selected = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        decoration: BoxDecoration(
          gradient: Constances.gradient,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 1.h,
        ),
        height: 35.h,
        width: double.infinity,
        child: MonthView(
            cellAspectRatio: 3 / 3,
            onPageChange: (dateTime, index) {
              setState(() {
                defaultTime = dateTime;
              });
            },
            onCellTap: (list, item) {
              Navigation.instance.goBackWithArgs(args:item);
            },
            headerBuilder: (dateTime) {
              return CalendarHeader(
                dateTime: dateTime,
              );
            },
            cellBuilder: (dateTime, events, val1, val2) {
              return checkThisMonth(dateTime, defaultTime)
                  ? CellBuilderItem(
                      dateTime: dateTime,
                      selected: selected,
                    )
                  : Container();
            },
            borderColor: Colors.transparent,
            weekDayBuilder: (index) {
              return Container(
                padding: EdgeInsets.only(
                  bottom: 0.5.h,
                ),
                child: Center(
                  child: Text(
                    nameOfDay(index),
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: Colors.white70,
                          fontFamily: "PublicSans",
                          // fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  checkThisMonth(DateTime dateTime, DateTime defaultTime) {
    if (DateFormat("MMM").format(dateTime) ==
        DateFormat("MMM").format(defaultTime)) {
      return true;
    }
    return false;
  }

  checkIfHoliday(DateTime dateTime) {
    switch (DateFormat("EEE").format(dateTime)) {
      case "Sat":
        return true;
      case "Sun":
        return true;
      default:
        return false;
    }
  }

  String nameOfDay(int index) {
    switch (index) {
      case 0:
        return "M";
      case 1:
        return "T";
      case 2:
        return "W";
      case 3:
        return "T";
      case 4:
        return "F";
      default:
        return "S";
    }
  }
}
