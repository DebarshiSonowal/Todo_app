import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';

import '../../constants/constants.dart';
import '../../models/reminder_list_item.dart';
import '../edit_daily_routine/widgets/edit_daily_routine_appbar.dart';
import '../edit_daily_routine/widgets/edit_daily_routine_normal_card.dart';
import 'widgets/stacked_card_time_date.dart';
import 'widgets/time_date_selector_background.dart';

class TimeDateSelector extends StatefulWidget {
  TimeDateSelector({
    Key? key,
    required this.index,
    // required this.title
  }) : super(key: key);

  // final String title;
  final int index;

  @override
  State<TimeDateSelector> createState() => _TimeDateSelectorState();
}

class _TimeDateSelectorState extends State<TimeDateSelector> {
  File? attachment;
  final titleController = TextEditingController();

  // final descController = TextEditingController();
  List<ReminderListItem> reminders = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      titleController.text = Provider.of<Repository>(context, listen: false)
              .models[widget.index]
              .title ??
          "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(9.h),
        child: EditDailyRoutineAppBar(
          isDone: true,
          index: widget.index,
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset(
              Constances.backgroundImage,
            ).image,
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // AddDailyRoutineNormalCard(),
            timeDateSelectorBackground(
              index: widget.index,
              titleController: titleController,
              reminders: reminders,
              updateFile: (File file) {
                setState(() {
                  attachment = file;
                });
              },
            ),
            StackedCardTimeDate(
              index: widget.index,
            ),
          ],
        ),
      ),
    );
  }
}
