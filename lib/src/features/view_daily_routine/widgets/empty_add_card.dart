import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../constants/routes.dart';
import '../../../services/Navigate.dart';
import 'unboarderd_day.dart';

class EmptyAddNewCard extends StatelessWidget {
  const EmptyAddNewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation.instance.navigate(Routes.addDailyRoutineNormal);
      },
      child: SizedBox(
        // height: 10.h,
        child: Card(
          elevation: 7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: 2.h,
            ),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Constances.blueBackground,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 1.h,
                    ),
                    Text(
                      "Title",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontSize: 12.sp,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "| Hr:min",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontSize: 10.sp,
                        color: Colors.white70,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    // const Spacer(),
                    SizedBox(
                      width: 1.5.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigation.instance
                            .navigate(Routes.addDailyRoutineNormal);
                      },
                      child: SvgPicture.asset(
                        Constances.editIcon,
                        color: Colors.white,
                        fit: BoxFit.fill,
                        height: 14.sp,
                        width: 14.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 5.h,
                  width: double.infinity,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return UnboarderedDay(
                        index: index,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 3.w,
                      );
                    },
                    itemCount: 7,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
