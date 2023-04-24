import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'daily_routine_add_card.dart';

class AddDailyRoutineBackground extends StatefulWidget {
  const AddDailyRoutineBackground({Key? key}) : super(key: key);

  @override
  State<AddDailyRoutineBackground> createState() => _AddDailyRoutineBackgroundState();
}

class _AddDailyRoutineBackgroundState extends State<AddDailyRoutineBackground> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      padding: EdgeInsets.symmetric(
        horizontal: 6.w,
        vertical: 2.h,
      ),
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.add_circle,
                  color: Colors.white,
                  size: 26.sp,
                )
              ],
            ),
            const DailyRoutineAddCard(),
          ],
        ),
      ),
    );
  }
}
