import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/models/reminder_list_item.dart';

import '../../constants/constants.dart';
import '../../repository/repository.dart';
import '../../services/Navigate.dart';
import 'widgets/time_selector_page_card.dart';
import 'widgets/timer_select_list_item.dart';
import 'widgets/timer_selected_appbar.dart';

class TimerSelectedPage extends StatelessWidget {
  const TimerSelectedPage({Key? key, required this.index}) : super(key: key);
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
              TimerSelectorPageCard(index: index),
            ],
          ),
        ),
      ),
    );
  }
}
