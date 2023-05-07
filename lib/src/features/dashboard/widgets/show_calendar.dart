import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/constants.dart';

class ShowCalendar extends StatefulWidget {
  const ShowCalendar({Key? key}) : super(key: key);

  @override
  State<ShowCalendar> createState() => _ShowCalendarState();
}

class _ShowCalendarState extends State<ShowCalendar> {
  DateTime defaultTime = DateTime.now();
  DateTime? selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 14.h,
          ),
          Container(
            width: double.infinity,
            height: 57.h,
            color: Constances.blueBackground,
            padding: EdgeInsets.only(top: 2.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Quick Notes",
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontFamily: "Rubik",
                        // fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Card(
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      // color: Constances.blueBackground,
                      gradient: Constances.gradient,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    height: 40.h,
                    width: 80.w,
                    padding: EdgeInsets.only(
                      left: 4.w,
                      right: 4.w,
                      bottom: 1.h,
                      // vertical: 1.h,
                    ),
                    child: MonthView(
                        cellAspectRatio: 3 / 3,
                        onPageChange: (dateTime, index) {
                          setState(() {
                            defaultTime = dateTime;
                          });
                        },
                        onCellTap: (list,item){
                          setState(() {
                            selected = item;
                          });
                        },
                        headerBuilder: (dateTime) {
                          return Container(
                            child: Center(
                              child: Text(
                                DateFormat("MMM").format(dateTime),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontFamily: "Rubik",
                                      // fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          );
                        },
                        cellBuilder: (dateTime, events, val1, val2) {
                          return checkThisMonth(dateTime, defaultTime)
                              ? Container(
                                  color: selected != dateTime?(checkIfHoliday(dateTime)
                                      ? Constances.calendarCellColor2
                                      : Constances.calendarCellColor1):Constances.blueBackground,
                                  height: 1.h,
                                  width: 2.w,
                                  child: Center(
                                    child: Text(
                                      "${dateTime.day}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          ?.copyWith(
                                            color: selected != dateTime?(checkIfHoliday(dateTime)
                                                ? Constances.cellTextColor
                                                : Colors.white):Colors.white,
                                            fontFamily: "Rubik",
                                            // fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
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
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(
                                      color: Colors.white70,
                                      fontFamily: "PublicSans",
                                      // fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 2.w,
                        // vertical: 1.h,
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(
                            1.5.w,
                          ),
                          child: Text(
                            "Create",
                            style:
                                Theme.of(context).textTheme.headline3?.copyWith(
                                      color: Colors.black,
                                      fontSize: 12.5.sp,
                                      fontFamily: "Rubik",
                                      // fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
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
