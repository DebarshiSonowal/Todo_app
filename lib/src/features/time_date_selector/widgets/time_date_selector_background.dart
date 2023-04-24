import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';

import '../../edit_daily_routine/widgets/edit_daily_routine_normal_card.dart';
import '../time_date_selector.dart';

class timeDateSelectorBackground extends StatelessWidget {
  const timeDateSelectorBackground({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      padding: EdgeInsets.symmetric(
        horizontal: 4.w,
        vertical: 2.h,
      ),
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<Repository>(builder: (context, data, _) {
              return EditDailyRoutineNormalCard(
                index: index,
              );
            })
          ],
        ),
      ),
    );
  }
}
