import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/constants.dart';
import 'package:vishal_todo_app/src/constants/routes.dart';
import 'package:vishal_todo_app/src/features/dashboard/widgets/cell_builder_item.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import '../../../widget/alert.dart';
import 'calendar_header.dart';
import 'create_button.dart';

class ShowCalendar extends StatefulWidget {
  const ShowCalendar({Key? key}) : super(key: key);

  @override
  State<ShowCalendar> createState() => _ShowCalendarState();
}

class _ShowCalendarState extends State<ShowCalendar> {
  DateTime defaultTime = DateTime.now();
  DateTime? selected = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigation.instance.goBack();
            },
            child: Container(
              color: Colors.transparent,
              height: 14.h,
              width: double.infinity,
            ),
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
                        onCellTap: (list, item) {
                          if (selected != item) {
                            setState(() {
                              selected = item;
                            });
                          } else {
                            setState(() {
                              selected = null;
                            });
                          }
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
                      child: CreateButton(
                        onTap: () {
                          if (selected != null) {
                            Navigation.instance.navigateAndReplace(
                              Routes.addQuickNoteFromDate,
                              args: DateFormat("dd MMM yyyy").format(selected!),
                            );
                          } else {
                            showError("Please Pick One Date");
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigation.instance.goBack();
              },
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
        ],
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
