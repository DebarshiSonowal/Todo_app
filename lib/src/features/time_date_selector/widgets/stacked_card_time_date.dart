import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../constants/routes.dart';
import '../../../services/Navigate.dart';

class StackedCardTimeDate extends StatelessWidget {
  const StackedCardTimeDate({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          topLeft: Radius.circular(20.0),
        ),
      ),
      child: Container(
        width: 100.w,
        // height: 25.h,
        decoration: const BoxDecoration(
          gradient: Constances.gradient,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 4.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigation.instance.navigate(Routes.timePicker, args: index);
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 1.h,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      Constances.alarmIcon,
                      fit: BoxFit.fill,
                      width: 9.w,
                    ),
                    Text(
                      'Timer',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontSize: 11.2.sp,
                            color: Colors.black,
                            fontFamily: "PublicSans",
                            // fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigation.instance.navigate(Routes.datePicker, args: index);
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 11.w,
                  vertical: 1.2.h,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                   Image.asset(
                      Constances.calendarImage,
                     fit: BoxFit.fill,
                     width: 7.6.w,
                    ),
                    SizedBox(
                      height: 0.4.h,
                    ),
                    Text(
                      'Daily',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontSize: 11.2.sp,
                            color: Colors.black,
                            fontFamily: "PublicSans",
                            // fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
