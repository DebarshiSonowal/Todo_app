import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/routes.dart';
import '../../../models/quick_note.dart';
import '../../../repository/repository.dart';
import '../../../services/Navigate.dart';
import '../../../widget/alert.dart';
import '../add_quick_notes/widgets/add_quick_notes_appbar.dart';

class AddQuickNoteFromDate extends StatelessWidget {
  AddQuickNoteFromDate({Key? key, required this.dateTime}) : super(key: key);
  final controller = TextEditingController();
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(9.h),
        child: AddQuickNotesAppbar(
          onTap: () {
            if (controller.text.isNotEmpty) {
              Provider.of<Repository>(context, listen: false)
                  .addQuickNote(QuickNote(
                controller.text,
                dateTime,
                DateFormat("HH:mm a").format(DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                  12,
                  00,
                )),
              ));
              Navigation.instance.goBack();
            } else {
              showError("Cannot add empty note");
            }
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.white,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
          vertical: 2.5.h,
        ),
        child: TextFormField(
          controller: controller,
          // maxLines: 1,
          onFieldSubmitted: (val) {
            if (val.isNotEmpty) {}
          },
          maxLines: null,
          // initialValue: "${item.title}",
          decoration: InputDecoration.collapsed(
            hintText: 'Text',
            hintStyle: Theme.of(context).textTheme.headline4?.copyWith(
                  fontSize: 12.sp,
                  color: Colors.black54,
                  // fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                ),
          ),
          style: Theme.of(context).textTheme.headline4?.copyWith(
                fontSize: 14.sp,
                color: Colors.black,
                fontFamily: "Roboto",
              ),
        ),
      ),
    );
  }

  void showError(String msg) {
    AlertX.instance.showAlert(
        title: "Error",
        msg: msg,
        positiveButtonText: "Done",
        positiveButtonPressed: () {
          Navigation.instance.goBack();
        });
  }
}
