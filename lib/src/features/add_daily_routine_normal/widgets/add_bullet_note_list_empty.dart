import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/widget/routine_item_widget.dart';

import '../../../models/reminder_list_item.dart';
import '../../../models/timer_section_option_model.dart';
import '../../../repository/repository.dart';

class AddBulletNoteItemListEmpty extends StatelessWidget {
  const AddBulletNoteItemListEmpty({
    super.key,
    required this.reminders,
    required this.onTap,
  });

  final List<ReminderListItem> reminders;
  final Function(ReminderListItem) onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        // var item = reminders[index];
        if (index != reminders.length) {
          return RoutineItemWidget(
            item: reminders.isEmpty
                ? ReminderListItem(
                    "",
                    DateFormat("hh:mm a").format(DateTime.now()),
                    DateTime.now(),
                    false,
                    TimerSelectionOptions(
                      "NA",
                      10,
                      false,
                    ),
                  )
                : reminders[index],
            index: index,
            updateList: (string, dateTime) {
              reminders[index] = ReminderListItem(
                string,
                "",
                dateTime,
                false,
                TimerSelectionOptions(
                  "NA",
                  10,
                  false,
                ),
              );
              onTap(ReminderListItem(
                string,
                "",
                dateTime,
                false,
                TimerSelectionOptions(
                  "NA",
                  10,
                  false,
                ),
              ));
            },
          );
        } else {
          return RoutineItemWidget(
            item: ReminderListItem(
              "",
              DateFormat("hh:mm a").format(DateTime.now()),
              DateTime.now(),
              false,
              TimerSelectionOptions(
                "NA",10,false,
              ),
            ),
            index: index,
            updateList: (string, dateTime) {
              reminders.add(ReminderListItem(
                string,
                "",
                dateTime,
                false,
                TimerSelectionOptions(
                  "NA",
                  10,
                  false,
                ),
              ));
              onTap(ReminderListItem(
                string,
                "",
                dateTime,
                false,
                TimerSelectionOptions(
                  "NA",
                  10,
                  false,
                ),
              ));
              // setState(() {
              //   reminders.add(
              //     ReminderListItem(string, "", dateTime),
              //   );
              // });
              // Provider.of<Repository>(context, listen: false)
              //     .addReminderListItem(
              //   ReminderListItem(
              //     string,
              //     DateFormat("hh:mm a").format(dateTime),
              //     dateTime,
              //     false,
              //   ),
              // );
            },
          );
        }
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 0.5.h,
        );
      },
      itemCount: reminders.length + 1,
    );
  }
}
