import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../models/timer_section_option_model.dart';
import '../../../repository/repository.dart';
import '../../../widget/done_button.dart';
import '../../timer_selected/widgets/time_selector_page_card.dart';
import 'am_pm_switch.dart';
import 'time_section_edit_time_selected.dart';
import 'timer_section_edit_options.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

class EditTimeSelectedCard extends StatefulWidget {
  const EditTimeSelectedCard({
    super.key,
    required this.index,
  });

  final String index;

  @override
  State<EditTimeSelectedCard> createState() => _EditTimeSelectedCardState();
}

class _EditTimeSelectedCardState extends State<EditTimeSelectedCard> {
  // DateTime? alarmDateTime;
  final list = ["Ringtone", "Sound", "Vibration"];
  final list2 = ["Radar", "40", "On"];

  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration.zero, () {
    //   alarmDateTime = Provider.of<Repository>(context, listen: false)
    //       .models[widget.index]
    //       .dateTime;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 3,
            sigmaY: 3,
          ),
          child: Container(
            height: 100.h,
            width: 100.w,
          ),
        ),
        Card(
          color: Constances.gradientColor1.withOpacity(0.3),
          // color: Colors.transparent,
          elevation: 7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Consumer<Repository>(builder: (context, data, _) {
            return Container(
              height: 35.h,
              decoration: const BoxDecoration(
                // gradient: Constances.gradient,
                color: Colors.transparent,

                // border: Border.all(),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                // shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  TimerSectionEditTimeSelected(
                    alarmDateTime: data.models[int.parse(widget.index.split(",")[0])].reminders[int.parse(widget.index.split(",")[1])].timeDate,
                    index: int.parse(widget.index.split(",")[0]),
                    num:int.parse(widget.index.split(",")[1]),
                    data: data,
                    updateParent: () {
                      setState(() {});
                    },
                  ),
                  TimerSectionEditOptions(
                    list: list,
                    options: data.models[int.parse(widget.index.split(",")[0])].options!,
                  //   ((item.time==""||item.time==null) ? DateFormat("hh:mm a").format(item.timeDate!).split(" ")[1]:"")a
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}
