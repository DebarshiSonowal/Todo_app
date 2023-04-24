import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            showCalendar(context);
          },
          icon: Icon(
            Icons.calendar_month,
            color: Colors.white,
            size: 22.sp,
          ),
        )
      ],
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 2.5.h,
          ),
          Text(
            DateFormat("MMM yyyy").format(DateTime.now()),
            style: Theme.of(context).textTheme.headline3?.copyWith(
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          SizedBox(
            height: 4.8.h,
            width: double.infinity,
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                horizontal: 2.w,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 10.w,
                  child: Column(
                    children: [
                      Text(
                        DateFormat("EEE").format(
                          DateTime.now().add(
                            Duration(days: index),
                          ),
                        ),
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              color: Colors.white70,
                              fontFamily: "Rubik",
                              fontSize: 10.sp,
                              // fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        DateFormat("dd").format(
                          DateTime.now().add(
                            Duration(days: index),
                          ),
                        ),
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              color: Colors.white,
                              fontSize: 11.sp,
                              fontFamily: "Rubik",
                              // fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 4.w,
                );
              },
              itemCount: 7,
            ),
          ),
        ],
      ),
    );
  }

  void showCalendar(context) {
    DateTime defaultTime = DateTime.now();
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            alignment: Alignment.topCenter,
            child: StatefulBuilder(builder: (context, setState) {
              return Card(
                elevation: 7,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    // color: Constances.blueBackground,
                    gradient: Constances.gradient,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  height: 40.h,
                  width: 85.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 4.w,
                    vertical: 1.5.h,
                  ),
                  child: MonthView(
                      cellAspectRatio: 3 / 3,
                      onPageChange: (dateTime, index) {
                        setState(() {
                          defaultTime = dateTime;
                        });
                      },
                      headerBuilder: (dateTime) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 0.5.h,
                          ),
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
                                color: checkIfHoliday(dateTime)
                                    ? Constances.calendarCellColor2
                                    : Constances.calendarCellColor1,
                                height: 1.h,
                                width: 2.w,
                                child: Center(
                                  child: Text(
                                    "${dateTime.day}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        ?.copyWith(
                                          color: checkIfHoliday(dateTime)
                                              ? Constances.cellTextColor
                                              : Colors.white,
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
              );
            }),
          );
        });
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

  checkThisMonth(DateTime dateTime, DateTime defaultTime) {
    if (DateFormat("MMM").format(dateTime) ==
        DateFormat("MMM").format(defaultTime)) {
      return true;
    }
    return false;
  }

  checkIfHoliday(DateTime dateTime) {
    // if (DateFormat("MMM").format(dateTime)==DateFormat("MMM").format(DateTime.now())) {
    //
    // }else{
    //   return true;
    // }
    switch (DateFormat("EEE").format(dateTime)) {
      case "Sat":
        return true;
      case "Sun":
        return true;
      default:
        return false;
    }
  }
}
