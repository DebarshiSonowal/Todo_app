import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DateCard extends StatelessWidget {
  const DateCard({
    super.key,
    required this.listOfDays, required this.index,
  });
  final int index;
  final List<String> listOfDays;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: 10.w,
        decoration: const BoxDecoration(
          // gradient: Constances.gradient,
          // border: Border.all(),
          color: Color(0xff535970),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          // shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            listOfDays[index],
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(
              fontSize: 11.sp,
              color: index==0?Colors.red:Color(0xff16163d),
              fontFamily: "PublicSans",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}