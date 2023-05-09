import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/routes.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import '../../../constants/constants.dart';
import '../../../models/essential_note.dart';

class NotesListItem extends StatelessWidget {
  const NotesListItem({
    super.key,
    required this.item, required this.index,
  });

  final EssentialNotes item;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigation.instance.navigateAndReplace(Routes.essentialsDetails,args: index);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Constances.essentialItemColor,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 1.h,
          ),
          child: Column(
            children: [
              Text(
                "${item.date}",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                ),
              ),
              Divider(
                thickness: 0.03.h,
                color: Colors.black87,
              ),
              ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: 2.5.w,
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var current = item.notes[index];
                  return Text(
                    "${index + 1}. ${current.title}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                      fontSize: 13.sp,

                    ),
                  );
                },
                itemCount: item.notes.length > 4 ? 4 : item.notes.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 1.h,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}