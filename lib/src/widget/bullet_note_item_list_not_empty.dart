import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/widget/routine_item_widget.dart';

import '../features/edit_daily_routine/widgets/edit_daily_routine_normal_card.dart';
import '../models/daily_routine_model.dart';
import '../models/reminder_list_item.dart';
import '../repository/repository.dart';

class BulletNoteItemListNotEmpty extends StatelessWidget {
  const BulletNoteItemListNotEmpty({
    super.key,
    required this.current,
    required this.widget,
    // required this.widget,
  });

  final DailyRoutineModel current;
  final EditDailyRoutineNormalCard widget;

  // final EditDailyRoutineNormalCard widget;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        // var item = current.reminders[index];
        if (index != current.reminders.length) {
          return RoutineItemWidget(
            item: current.reminders.isEmpty
                ? ReminderListItem("", "", DateTime.now(),false)
                : current.reminders[index],
            index: index,
            updateList: (string, dateTime) {
              Provider.of<Repository>(context, listen: false)
                  .updateReminderListItem(
                widget.index,
                ReminderListItem(
                  string,
                  DateFormat("hh:mm a").format(dateTime),
                  dateTime,
                  false,
                ),
                index,
              );
            },
          );
        } else {
          return RoutineItemWidget(
            item: ReminderListItem("", "", DateTime.now(),false),
            index: index,
            updateList: (string, dateTime) {
              Provider.of<Repository>(context, listen: false)
                  .addReminderListItem(
                widget.index,
                ReminderListItem(
                  string,
                  DateFormat("hh:mm a").format(dateTime),
                  dateTime,
                  false,
                ),
              );
            },
          );
        }
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 0.5.h,
        );
      },
      itemCount: current.reminders.length + 1,
    );
  }
}