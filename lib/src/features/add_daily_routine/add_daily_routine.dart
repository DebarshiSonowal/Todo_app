import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../../widget/daily_routine_bar.dart';
import '../view_daily_routine/widgets/stacked_bottom_sheet.dart';
import 'widgets/add_daily_routine_background.dart';

class AddDailyRoutine extends StatelessWidget {
  const AddDailyRoutine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: const [
            AddDailyRoutineBackground(),
            StackedBottomSheet(),
          ],
        ),
      ),
    );
  }
}
