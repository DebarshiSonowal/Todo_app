import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/routes.dart';
import 'package:vishal_todo_app/src/models/quick_note.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';

import '../../../constants/constants.dart';
import '../../../services/Navigate.dart';
import '../../../widget/add_button.dart';
import 'widgets/quick_notes_appbar.dart';
import 'widgets/quick_notes_page_item.dart';
import 'widgets/quick_notes_section.dart';

class QuickNotesPage extends StatelessWidget {
  const QuickNotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(9.h),
        child: QuickNotesListAppbar(
          onTap: () {},
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          vertical: 1.5.h,
          horizontal: 2.w,
        ),
        child: Consumer<Repository>(builder: (context, data, _) {
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              QuickNotesSection(
                notes: data.quickNotes ?? [],
              ),
              GestureDetector(
                onTap: () {
                  Navigation.instance.navigate(Routes.addQuickPage);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                    //set border radius more than 50% of height and width to make circle
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Constances.blueBackground,
                      shape: BoxShape.circle,
                    ),
                    width: 13.w,
                    height: 13.w,
                    padding: EdgeInsets.all(2.5.w),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 18.sp,
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
