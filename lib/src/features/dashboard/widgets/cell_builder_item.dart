import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';

class CellBuilderItem extends StatelessWidget {
  const CellBuilderItem({Key? key, this.selected, required this.dateTime}) : super(key: key);
  final DateTime? selected;
  final DateTime dateTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: selected != dateTime
          ? (checkIfHoliday(dateTime)
          ? Constances.calendarCellColor2
          : Constances.calendarCellColor1)
          : Constances.blueBackground,
      height: 1.h,
      width: 2.w,
      child: Center(
        child: Text(
          "${dateTime.day}",
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(
            color: selected != dateTime
                ? (checkIfHoliday(dateTime)
                ? Constances.cellTextColor
                : Colors.white)
                : Colors.white,
            fontFamily: "Rubik",
            // fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
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

}
