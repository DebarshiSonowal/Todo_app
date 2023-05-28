import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/models/daily_routine_model.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';

import '../../../constants/constants.dart';
import '../../../constants/routes.dart';
import '../../../models/reminder_list_item.dart';
import '../../../services/Navigate.dart';
import '../../../widget/custom_text_editing_controller.dart';
import '../../../widget/daily_routine_bar.dart';
import 'widgets/edit_daily_routine_appbar.dart';
import 'widgets/edit_daily_routine_normal_card.dart';

class EditDailyRoutine extends StatefulWidget {
  EditDailyRoutine({Key? key, required this.index}) : super(key: key);
  final int index;
  File? attachment;
  final titleController = TextEditingController();
  final textController = CustomTextEditingController();
  final descController = TextEditingController();

  @override
  State<EditDailyRoutine> createState() => _EditDailyRoutineState();
}

class _EditDailyRoutineState extends State<EditDailyRoutine> {
  List<ReminderListItem> reminders = [];
  File? attachment;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() => widget.titleController.text =
          Provider.of<Repository>(context, listen: false)
                  .models[widget.index]
                  .title ??
              "");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(9.h),
        child: EditDailyRoutineAppBar(
          isDone: false,
          index: widget.index,
          next: () {
            // Provider.of<Repository>(context, listen: false).modifyDailyReminder(index, DailyRoutineModel(
            //
            // ));
            Navigation.instance.navigate(
              Routes.timeDatePicker,
              // args: "Shower time"
              args: widget.index,
            );
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
          vertical: 1.h,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset(
              Constances.backgroundImage,
            ).image,
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // AddDailyRoutineNormalCard(),
              EditDailyRoutineNormalCard(
                index: widget.index,
                titleController: widget.titleController,
                reminders: reminders,
                updateImage: (File file) {
                  setState(() {
                    attachment = file;
                  });
                },
                attachment: attachment,
                textController: widget.textController,
              )
            ],
          ),
        ),
      ),
    );
  }
}
