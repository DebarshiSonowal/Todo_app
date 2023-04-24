import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../edit_daily_routine/widgets/edit_daily_routine_appbar.dart';
import '../edit_daily_routine/widgets/edit_daily_routine_normal_card.dart';
import 'widgets/stacked_card_time_date.dart';
import 'widgets/time_date_selector_background.dart';

class TimeDateSelector extends StatefulWidget {
  const TimeDateSelector({
    Key? key,
    required this.index,
    // required this.title
  }) : super(key: key);

  // final String title;
  final int index;

  @override
  State<TimeDateSelector> createState() => _TimeDateSelectorState();
}

class _TimeDateSelectorState extends State<TimeDateSelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(9.h),
        child: EditDailyRoutineAppBar(
          isDone: true,
          index: widget.index,
        ),
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
          children: [
            // AddDailyRoutineNormalCard(),
            timeDateSelectorBackground(index: widget.index,),
            StackedCardTimeDate(index: widget.index,),
          ],
        ),
      ),
    );
  }
}
