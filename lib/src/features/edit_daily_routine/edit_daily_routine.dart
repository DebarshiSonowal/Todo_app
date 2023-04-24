import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';

import '../../constants/constants.dart';
import '../../widget/daily_routine_bar.dart';
import 'widgets/edit_daily_routine_appbar.dart';
import 'widgets/edit_daily_routine_normal_card.dart';

class EditDailyRoutine extends StatelessWidget {
  const EditDailyRoutine({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(9.h),
        child: EditDailyRoutineAppBar(
          isDone: false,
          index: index,
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
          vertical: 1.h,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset(
              Constances.backgroundImage,
            ).image,
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // AddDailyRoutineNormalCard(),
              EditDailyRoutineNormalCard(
                index: index,
              )
            ],
          ),
        ),
      ),
    );
  }
}
