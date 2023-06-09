import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';
import 'package:vishal_todo_app/src/services/notification_services.dart';

import '../../../constants/constants.dart';
import '../../../constants/routes.dart';
import '../../../models/reminder_list_item.dart';
import '../../../services/Navigate.dart';

class TimerSelectListItem extends StatelessWidget {
  const TimerSelectListItem({
    super.key,
    required this.item,
    required this.index,
    required this.num,
    this.type, required this.updateSwitch,
  });

  final int? type;
  final int index, num;
  final ReminderListItem item;
  final Function(bool) updateSwitch;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            if (type == null) {
              Navigation.instance.navigate(
                Routes.editTimePicker,
                args: "$index,$num",
              );
            } else {
              Navigation.instance.navigate(
                Routes.editTimePickerPersonal,
                args: "$index,$num",
              );
            }
          },
          child: Text(
            'Edit',
            style: Theme
                .of(context)
                .textTheme
                .headline4
                ?.copyWith(
              fontSize: 12.sp,
              color: Colors.white,
              fontFamily: "PublicSans",
              // fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        SizedBox(
          width: 16.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                DateFormat("hh:mm").format(item.timeDate!),
                style: Theme
                    .of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(
                  fontSize: 16.sp,
                  color: item.isEnabled ? Colors.white : Colors.white38,
                  fontFamily: "PublicSans",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 1.w,
        ),
        Text(
          DateFormat("a").format(item.timeDate!),
          style: Theme
              .of(context)
              .textTheme
              .headline4
              ?.copyWith(
            fontSize: 12.sp,
            color: item.isEnabled ? Colors.white : Colors.white38,
            fontFamily: "PublicSans",
            // fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        CupertinoSwitch(
          activeColor: Constances.switchActiveColor,
          value: item.isEnabled,
          onChanged: (bool value) {
            debugPrint("${type}");
            updateSwitch(value);
            if (type == null) {
              // Provider.of<Repository>(
              //   context,
              //   listen: false,
              // ).updateReminderListItemReminder(index, value, num);
            } else {
              // Provider.of<Repository>(
              //   context,
              //   listen: false,
              // ).updateReminderListItemReminderPersonal(index, value, num);
            }
          },
        ),
      ],
    );
  }
}
