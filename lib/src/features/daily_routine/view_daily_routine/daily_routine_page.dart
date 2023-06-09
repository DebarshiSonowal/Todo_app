import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/features/daily_routine/view_daily_routine/widgets/add_new_card.dart';

// import 'package:vishal_todo_app/src/features/daily_routine/widgets/stacked_bottom_sheet.dart';
import 'package:vishal_todo_app/src/models/stacked_list_item_model.dart';

import '../../../constants/constants.dart';
import '../../../constants/routes.dart';
import '../../../services/Navigate.dart';
import '../../../widget/daily_routine_bar.dart';
import 'widgets/daily_routine_background.dart';

import 'widgets/stacked_bottom_sheet.dart';
import 'widgets/stacked_sheet_item.dart';

class DailyRoutinePage extends StatelessWidget {
  const DailyRoutinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(9.h),
        child: const DailyRoutineAppBar(),
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
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigation.instance.navigate(Routes.addDailyRoutineNormal);
                    },
                    child: const AddNewCard(),
                  )
                ],
              ),
              SizedBox(
                height: 84.h,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    // alignment: Alignment.bottomCenter,
                    children: [
                      DailyRoutineBackground(),
                      const StackedBottomSheet(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
