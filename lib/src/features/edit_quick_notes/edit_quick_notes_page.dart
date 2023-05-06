import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/features/add_quick_notes/widgets/add_quick_notes_appbar.dart';
import 'package:vishal_todo_app/src/models/quick_note.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

class EditQuickNotesPage extends StatefulWidget {
  const EditQuickNotesPage({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<EditQuickNotesPage> createState() => _EditQuickNotesPageState();
}

class _EditQuickNotesPageState extends State<EditQuickNotesPage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(9.h),
        child: AddQuickNotesAppbar(
          onTap: () {
            if (controller.text.isNotEmpty) {
              Provider.of<Repository>(context, listen: false).updateQuickNote(
                  QuickNote(
                    controller.text,
                    DateFormat("dd MMM yyyy").format(DateTime.now()),
                  ),
                  widget.index);
              Navigation.instance.goBack();
            } else {}
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
          maxLines: null,
          // maxLines: 1,
          onFieldSubmitted: (val) {
            if (val.isNotEmpty) {}
          },
          // minLines: 1,
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

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      controller.text = Provider.of<Repository>(context, listen: false)
              .quickNotes[widget.index]
              .description ??
          "";
    });
  }
}
