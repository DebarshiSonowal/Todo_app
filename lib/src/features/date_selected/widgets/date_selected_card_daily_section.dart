import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import 'date_card.dart';

class DateSelectedCardDailySection extends StatelessWidget {
  const DateSelectedCardDailySection({
    super.key,
    required this.listOfDays,
  });

  final List<String> listOfDays;

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
        SizedBox(
          height: 31.h,
          width: double.infinity,
          child: Center(
            child: SizedBox(
              height: 6.h,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return DateCard(listOfDays: listOfDays, index: index,);
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
        ),
        SizedBox(
          height: 4.h,

        ),
      ],
    );
  }
}

