import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/widget/routine_item_widget.dart';

import '../features/edit_daily_routine/widgets/edit_daily_routine_normal_card.dart';
import '../models/daily_routine_model.dart';
import '../models/reminder_list_item.dart';
import '../models/timer_section_option_model.dart';
import '../repository/repository.dart';

class BulletNoteItemListNotEmpty extends StatelessWidget {
  BulletNoteItemListNotEmpty({
    super.key,
    required this.current,
    required this.index,
    required this.type,

    // required this.widget,
  });

  final DailyRoutineModel current;
  final int index;
  final int type;

  // final EditDailyRoutineNormalCard widget;
  final focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, count) {
        // var item = current.reminders[index];
        if (count != current.reminders.length) {
          return RoutineItemWidget(
            // focusNode: focus,
            item: current.reminders.isEmpty
                ? ReminderListItem(
                    "",
                    "",
                    DateTime.now(),
                    false,
                    TimerSelectionOptions(
                      "NA",
                      10,
                      false,
                    ),
                  )
                : current.reminders[count],
            index: count,
            updateList: (string, dateTime) {
              Provider.of<Repository>(context, listen: false)
                  .updateReminderListItem(
                count,
                ReminderListItem(
                  string,
                  DateFormat("hh:mm a").format(dateTime),
                  dateTime,
                  false,
                  TimerSelectionOptions(
                    "NA",10,false,
                  ),
                ),
                count,
              );
              FocusScope.of(context).requestFocus(focus);
            },
            remove: (){},
          );
        } else {
          return RoutineItemWidget(
            // focusNode: focus,
            item: ReminderListItem(
              "",
              "",
              DateTime.now(),
              false,
              TimerSelectionOptions(
                "NA",
                10,
                false,
              ),
            ),
            index: count,
            updateList: (string, dateTime) {
              if (type == 0) {
                Provider.of<Repository>(context, listen: false)
                    .addReminderListItem(
                  index,
                  ReminderListItem(
                    string,
                    // DateFormat("hh:mm a").format(dateTime),
                    DateFormat("hh:mm a").format(
                      DateTime(DateTime.now().year, DateTime.now().month,
                          DateTime.now().day, 12, 0),
                    ),
                    dateTime,
                    false,
                    TimerSelectionOptions(
                      "NA",
                      10,
                      false,
                    ),
                  ),
                );
              } else {
                Provider.of<Repository>(context, listen: false)
                    .addReminderListItemPersonal(
                  index,
                  ReminderListItem(
                    string,
                    // DateFormat("hh:mm a").format(dateTime),
                    DateFormat("hh:mm a").format(
                      DateTime(DateTime.now().year, DateTime.now().month,
                          DateTime.now().day, 12, 0),
                    ),
                    dateTime,
                    false,
                    TimerSelectionOptions(
                      "NA",
                      10,
                      false,
                    ),
                  ),
                );
              }
              FocusScope.of(context).requestFocus(focus);
            },
            remove: (){},
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
