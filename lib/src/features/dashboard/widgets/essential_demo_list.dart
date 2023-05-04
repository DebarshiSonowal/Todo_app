import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../models/essential_note.dart';

class EssentialDemoList extends StatelessWidget {
  const EssentialDemoList({
    super.key,
    required this.essential,
  });

  final EssentialNotes essential;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: 2.5.w,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var current = essential.notes[index];
        return Text(
          "${index + 1}. ${current.title}",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.black,
            fontSize: 13.sp,
          ),
        );
      },
      itemCount:essential.notes.length > 5
          ? 5
          : essential.notes.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 1.h,
        );
      },
    );
  }
}