import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:sizer/sizer.dart';

import '../models/reminder_list_item.dart';

extension TOD on TimeOfDay {
  DateTime toDateTime() {
    return DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, hour, minute);
  }
}

class RoutineItemWidget extends StatefulWidget {
  const RoutineItemWidget({
    Key? key,
    required this.index,
    required this.item,
    required this.updateList,
    required this.remove,
    this.autofocus,
    // required this.focusNode,
  }) : super(key: key);
  final int index;
  final ReminderListItem item;
  final Function(String, DateTime) updateList;
  final Function remove;
  final bool? autofocus;

  // final FocusNode? focusNode;

  @override
  State<RoutineItemWidget> createState() => _RoutineItemWidgetState();
}

class _RoutineItemWidgetState extends State<RoutineItemWidget> {
  Time? timePicked;
  String? txt;
  final QuickActions quickActions = const QuickActions();

  @override
  void initState() {
    super.initState();
    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
          type: 'delete', localizedTitle: 'Main view', icon: 'icon_main'),
      // const ShortcutItem(type: 'action_help', localizedTitle: 'Help', icon: 'icon_help')
    ]);
    quickActions.initialize((shortcutType) {
      if (shortcutType == 'action_main') {
        debugPrint('The user tapped on the "Main view" action.');
      }
      // More handling code...
    });
  }

  void onTimeChanged(Time newTime, String txt) {
    setState(() {
      timePicked = newTime;
    });
    widget.updateList(txt ?? "",
        timePicked == null ? widget.item.timeDate! : timePicked!.toDateTime());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 40.w,
      // height: 4.h,
      child: Row(
        children: [
          Text(
            "${widget.index + 1}. ",
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontSize: 12.sp,
                  color: Colors.white,
                  fontFamily: "Roboto",
                ),
          ),
          Expanded(
            flex: 3,
            child: TextFormField(
              autofocus: widget.autofocus ?? false,
              // focusNode: widget.focusNode??null,
              maxLines: 1,

              onEditingComplete: () {},
              onFieldSubmitted: (val) {
                if (val.isNotEmpty) {
                  setState(() {
                    txt = val;
                  });
                  widget.updateList(
                      val,
                      timePicked == null
                          ? widget.item.timeDate!
                          : timePicked!.toDateTime());
                } else {
                  widget.remove();
                }
              },
              minLines: 1,
              initialValue: "${widget.item.title}",
              cursorColor: Colors.white,
              decoration: InputDecoration.collapsed(
                hintText: '',
                hintStyle: Theme.of(context).textTheme.headline4?.copyWith(
                      fontSize: 12.sp,
                      color: Colors.white60,
                      // fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
              ),
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontSize: 12.sp,
                    color: Colors.white,
                    fontFamily: "Roboto",
                  ),
            ),
          ),
          // Expanded(
          //   child: GestureDetector(
          //     onTap: () {
          //       Navigator.of(context).push(
          //         showPicker(
          //           context: context,
          //           is24HrFormat: false,
          //           value: timePicked ??
          //               Time(
          //                 hour: DateTime.now().day,
          //                 minute: DateTime.now().minute,
          //                 second: DateTime.now().second,
          //               ),
          //           onChange: (time) {
          //             onTimeChanged(time, txt ?? widget.item.title ?? "");
          //           },
          //         ),
          //       );
          //     },
          //     child: Text(
          //       "| ${timePicked == null ? DateFormat("hh:mm a").format(widget.item.timeDate!) : DateFormat("hh:mm a").format(timePicked!.toDateTime())}",
          //       style: Theme.of(context).textTheme.headline4?.copyWith(
          //             fontSize: 10.sp,
          //             color: Colors.white70,
          //             fontFamily: "Roboto",
          //             // fo ntWeight: FontWeight.bold,
          //           ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
