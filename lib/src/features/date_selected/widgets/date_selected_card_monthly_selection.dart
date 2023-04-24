import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';

class DateSelectedCardSelection extends StatelessWidget {
  const DateSelectedCardSelection(
      {Key? key, required this.updateParent, required this.defaultTime})
      : super(key: key);
  final Function(DateTime) updateParent;
  final DateTime defaultTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 4.w,
      ),
      height: 40.h,
      child: MonthView(
          cellAspectRatio: 2 / 2,
          onPageChange: (dateTime, index) {
            updateParent(dateTime);
          },
          headerBuilder: (dateTime) {
            return Container(
              padding: EdgeInsets.symmetric(
                vertical: 0.5.h,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(Constances.arrow2Image,height: 10.sp,width: 10.sp,),
                      Text(
                        DateFormat("MMM").format(dateTime),
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              color: Colors.white,
                              fontFamily: "Rubik",
                              // fontWeight: FontWeight.bold,
                            ),
                      ),
                      Image.asset(Constances.arrow1Image,height: 10.sp,width: 10.sp,),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    child: const Divider(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            );
          },
          cellBuilder: (dateTime, events, val1, val2) {
            return checkThisMonth(dateTime, defaultTime)
                ? Container(
                    height: 2.h,
                    decoration: BoxDecoration(
                      color: checkIfHoliday(dateTime)
                          ? Constances.calendarCellColor3
                          : Constances.calendarCellColor4,
                      // border: Border.all(),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      // shape: BoxShape.circle,
                    ),
                    // height: 0.5.h,
                    // width: 0.5.w,
                    child: Center(
                      child: Text(
                        "${dateTime.day}",
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              color: Constances.cellTextColor,
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
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: Colors.white70,
                        fontFamily: "PublicSans",
                        // fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            );
          }),
    );
  }

  checkThisMonth(DateTime dateTime, DateTime defaultTime) {
    if (DateFormat("MMM").format(dateTime) ==
        DateFormat("MMM").format(defaultTime)) {
      return true;
    }
    return false;
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
