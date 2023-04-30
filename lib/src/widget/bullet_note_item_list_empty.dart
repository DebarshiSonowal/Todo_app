import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/widget/routine_item_widget.dart';

import '../features/edit_daily_routine/widgets/edit_daily_routine_normal_card.dart';
import '../models/reminder_list_item.dart';
import '../models/timer_section_option_model.dart';
import '../repository/repository.dart';

class BulletNoteItemListEmpty extends StatelessWidget {
  const BulletNoteItemListEmpty({
    super.key,
    required this.reminders,
    required this.count, required this.type,
  });

  final List<ReminderListItem> reminders;
  final int count, type;

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
                "NA",10,false,
              ),
            )
                : reminders[index],
            index: index,
            updateList: (string, dateTime) {
              // setState(() {
              //   reminders[index] = ReminderListItem(
              //       string, "", dateTime);
              // });
              if (type == 0) {
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
                  index,
                );
              } else {
                Provider.of<Repository>(context, listen: false)
                    .updateReminderListItemPersonal(
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
                  index,
                );
              }
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
              // setState(() {
              //   reminders.add(
              //     ReminderListItem(string, "", dateTime),
              //   );
              // });
              if (type==0) {
                Provider.of<Repository>(context, listen: false)
                    .addReminderListItem(
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
                );
              } else {
                Provider.of<Repository>(context, listen: false)
                    .addReminderListItemPersonal(
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
                );
              }
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
