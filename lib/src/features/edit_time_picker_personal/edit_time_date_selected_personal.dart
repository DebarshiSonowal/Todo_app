import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../edit_timer_selected/widgets/edit_time_selected_card.dart';
import '../timer_selected/widgets/timer_selected_appbar.dart';

class EditTimerSelectedPersonal extends StatelessWidget {
  const EditTimerSelectedPersonal({Key? key, required this.index}) : super(key: key);
  final String index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(9.h),
        child: const TimerSelectAppbar(
          showDelete: true,
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
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 6,
                sigmaY: 6,
              ),
              child: Container(
                height:100.h,
                width: 100.w,
              ),
            ),
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    EditTimeSelectedCard(index: index,type:1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}