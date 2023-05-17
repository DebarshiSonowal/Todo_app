import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../timer_selected/widgets/timer_selected_appbar.dart';
import 'widgets/personal_timer_selected_appbar.dart';
import 'widgets/personal_timer_selector_page_card.dart';


class PersonalTimerSelectedPage extends StatelessWidget {
  const PersonalTimerSelectedPage({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(9.h),
        child: const TimerSelectAppbar(
          showDelete: false,
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
        padding: EdgeInsets.symmetric(
          vertical: 3.h,
          horizontal: 5.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PersonalTimerSelectorPage(index: index),
            ],
          ),
        ),
      ),
    );
  }
}
