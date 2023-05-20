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

class RoutineItemNonEmptyWidget extends StatefulWidget {
  const RoutineItemNonEmptyWidget({
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
  State<RoutineItemNonEmptyWidget> createState() => _RoutineItemNonEmptyWidgetState();
}

class _RoutineItemNonEmptyWidgetState extends State<RoutineItemNonEmptyWidget> {
  Time? timePicked;
  String? txt;
  final QuickActions quickActions = const QuickActions();
  final textEditingController = TextEditingController();

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
    textEditingController.text = widget.item.title ?? "";
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
              autofocus: false,
              // focusNode: widget.focusNode??null,
              maxLines: 1,
              controller: textEditingController,
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                // debugPrint("onEditingComplete1");
                if (textEditingController.text.isEmpty) {
                  widget.remove();
                }
              },
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
              // initialValue: "${widget.item.title}",
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
        ],
      ),
    );
  }
}
