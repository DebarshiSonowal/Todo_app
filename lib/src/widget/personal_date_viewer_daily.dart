import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../models/reminder_list_item.dart';
import '../repository/repository.dart';

class PersonalDateViewerDaily extends StatefulWidget {
  const PersonalDateViewerDaily({
    Key? key,
    required this.index,
    this.type,
    required this.isIncludedWeekday,
    required this.isMonthly,
  }) : super(key: key);
  final int index;
  final int? type;
  final bool isIncludedWeekday, isMonthly;

  @override
  State<PersonalDateViewerDaily> createState() =>
      _PersonalDateViewerDailyState();
}

class _PersonalDateViewerDailyState extends State<PersonalDateViewerDaily> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<Repository>(builder: (context, data, _) {
      return Container(
        padding: EdgeInsets.only(
          top: widget.type == null ? 0 : 2.w,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // borderRadius: (selected == widget.index)
          //     ? const BorderRadius.all(
          //         Radius.circular(5),
          //       )
          //     : null,
          color: (widget.isIncludedWeekday || widget.isMonthly)
              ?const Color(0xff757a89)
              :Colors.transparent ,
          border: Border.all(color: Colors.transparent),
        ),
        // width: 4.w,
        child: Center(
          child: Text(
            GetWeekDay(widget.index),
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: Colors.white,
                  fontFamily: "Rubik",
                  fontWeight: FontWeight.w400,
                  // fontWeight: FontWeight.bold,
                ),
          ),
        ),
      );
    });
  }

  checkWithReminders(List<ReminderListItem> reminders, String format) {
    for (var i = 0; i < reminders.length; i++) {
      if (DateFormat("dd MMM yyyy").format(reminders[i].timeDate!) == format) {
        return true;
      }
      return false;
    }
  }

  String GetWeekDay(int index) {
    switch (index) {
      case 0:
        return "Mo";
      case 1:
        return "Tu";
      case 2:
        return "We";
      case 3:
        return "Th";
      case 4:
        return "Fr";
      case 5:
        return "Sa";
      default:
        return "Su";
    }
  }
}
