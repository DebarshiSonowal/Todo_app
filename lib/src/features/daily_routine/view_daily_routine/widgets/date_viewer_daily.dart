import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/models/reminder_list_item.dart';

import '../../../../repository/repository.dart';

class DateViewerDaily extends StatefulWidget {
  DateViewerDaily({Key? key, required this.index, this.type}) : super(key: key);
  final int index;
  final int? type;
  @override
  State<DateViewerDaily> createState() => _DateViewerDailyState();
}

class _DateViewerDailyState extends State<DateViewerDaily> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<Repository>(builder: (context, data, _) {
      return Container(
        padding: EdgeInsets.only(
          top: widget.type==null?0:2.w,
        ),
        decoration: BoxDecoration(
          borderRadius: (selected == widget.index)
              ? const BorderRadius.all(
                  Radius.circular(5),
                )
              : null,
          color:
              (selected == widget.index) ? Colors.white70 : Colors.transparent,
          border: (selected == widget.index)
              ? Border.all(color: Colors.transparent)
              : const Border(
                  bottom: BorderSide(
                    width: 1.5,
                    color: Colors.white70,
                  ),
                ),
        ),
        width: widget.type==null?8.w:9.w,
        child: Column(
          children: [
            Text(
              DateFormat("EEE")
                  .format(
                    DateTime.now().add(
                      Duration(days: widget.index),
                    ),
                  )
                  .substring(0, 1),
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Colors.white70,
                    // fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              DateFormat("dd").format(
                DateTime.now().add(
                  Duration(days: widget.index),
                ),
              ),
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
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
}
