import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/widget/routine_item_widget.dart';

import '../../../../models/reminder_list_item.dart';
import '../../../../models/timer_section_option_model.dart';
import '../../../../repository/repository.dart';
import '../../../../widget/routine_item_non_empty.dart';

class AddBulletNoteItemListEmpty extends StatelessWidget {
  AddBulletNoteItemListEmpty({
    super.key,
    required this.reminders,
    required this.onTap,
    required this.remove,
  });

  final List<ReminderListItem> reminders;
  final Function(ReminderListItem) onTap;
  final Function(int) remove;
  final focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        // var item = reminders[index];
        if (index != reminders.length) {
          return RoutineItemNonEmptyWidget(
            autofocus: false,
            item: reminders.isEmpty
                ? ReminderListItem(
                    "",
                    DateFormat("hh:mm a").format(
                      DateTime(DateTime.now().year, DateTime.now().month,
                          DateTime.now().day, 12, 0),
                    ),
                    DateTime(DateTime.now().year, DateTime.now().month,
                        DateTime.now().day, 12, 0),
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
              onTap(
                ReminderListItem(
                  string,
                  "",
                  dateTime,
                  false,
                  TimerSelectionOptions(
                    "NA",
                    10,
                    false,
                  ),
                ),
              );
              Future.delayed(const Duration(seconds: 2),
                  () => FocusScope.of(context).requestFocus(focus));
            },
            remove: () {
              reminders.removeAt(index);
              remove(index);
            },
            // focusNode: null,
          );
        } else {
          return RoutineItemWidget(
            focusNode: focus,
            autofocus: true,
            item: ReminderListItem(
              "",
              // DateFormat("hh:mm a").format(DateTime.now()),
              DateFormat("hh:mm a").format(
                DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day, 12, 0),
              ),
              DateTime(DateTime.now().year, DateTime.now().month,
                  DateTime.now().day, 12, 0),
              false,
              TimerSelectionOptions(
                "NA",
                10,
                false,
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
              // FocusScope.of(context).requestFocus(focus);
            },
            remove: () {
              debugPrint("2nd event");
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

extension Utility on BuildContext {
  void nextBlankTextFocus() {
    var startingTextField;
    do {
      // Set starting text field so we can check if we've come back to where we started
      if (startingTextField == null) {
        startingTextField = FocusScope.of(this).focusedChild!.context!.widget;
      } else if (startingTextField ==
          FocusScope.of(this).focusedChild!.context!.widget) {
        // Back to where we started - stop as there are no more blank text fields
        break;
      }

      FocusScope.of(this).nextFocus();
    } while (
        FocusScope.of(this).focusedChild!.context!.widget is EditableText &&
            (FocusScope.of(this).focusedChild!.context!.widget as EditableText)
                .controller
                .text
                .trim()
                .isNotEmpty);
  }
}
