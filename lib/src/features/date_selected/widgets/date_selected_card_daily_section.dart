import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/models/daily_routine_model.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';

import '../../../constants/constants.dart';
import 'date_card.dart';

class DateSelectedCardDailySection extends StatelessWidget {
  DateSelectedCardDailySection({
    super.key,
    required this.listOfDays, required this.days, required this.updateParent,
  });

  final List<String> listOfDays;
  final List<int> days;
  final Function updateParent;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Weekly",
          style: Theme.of(context).textTheme.headline4?.copyWith(
                fontSize: 14.sp,
                color: Colors.white,
                fontFamily: "PublicSans",
                // fontWeight: FontWeight.bold,
              ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          child: const Divider(
            color: Colors.white70,
          ),
        ),
        Consumer<Repository>(builder: (context, data, _) {
          return SizedBox(
            height: 31.h,
            width: double.infinity,
            child: Center(
              child: SizedBox(
                height: 6.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return DateCard(
                      listOfDays: listOfDays,
                      index: index,
                      isIncluded: checkIncluded(days, index),
                      ifNotIncluded: () {
                        days.add(index);
                        updateParent();
                      },
                      ifIncluded: () {
                        days.remove(index);
                        updateParent();
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                        // width: 0.2.w,
                        );
                  },
                  itemCount: 7,
                ),
              ),
            ),
          );
        }),
        SizedBox(
          height: 4.h,
        ),
      ],
    );
  }

  checkIncluded(List<int> weekDays, int index) {
    if (weekDays.contains(index)) {
      return true;
    } else {
      return false;
    }
  }
}
