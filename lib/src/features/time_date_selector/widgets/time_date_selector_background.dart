import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';

import '../../../models/reminder_list_item.dart';
import '../../daily_routine/edit_daily_routine/widgets/edit_daily_routine_normal_card.dart';
import '../time_date_selector.dart';
import 'time_date_routine_normal_card.dart';

class timeDateSelectorBackground extends StatelessWidget {
  timeDateSelectorBackground({
    super.key,
    required this.index,
    this.attachment,
    required this.titleController,
    // required this.descController,
    required this.reminders,
    required this.updateFile,
  });

  final File? attachment;
  final TextEditingController titleController;

  // final TextEditingController descController;
  final int index;
  final List<ReminderListItem> reminders;
  final Function(File) updateFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      padding: EdgeInsets.symmetric(
        horizontal: 4.w,
        vertical: 1.h,
      ),
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // EditDailyRoutineNormalCard(
            //   index: index,
            //   titleController: titleController,
            //   reminders: reminders,
            //   updateImage: (File file) {
            //     updateFile(file);
            //   },
            //   attachment: attachment,
            // )
            TimeDateRoutineNormalCard(
              index: index,
            ),
          ],
        ),
      ),
    );
  }
}
