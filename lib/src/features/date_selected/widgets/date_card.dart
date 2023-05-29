import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';

class DateCard extends StatelessWidget {
  const DateCard({
    super.key,
    required this.listOfDays,
    required this.index,
    required this.isIncluded, required this.ifNotIncluded, required this.ifIncluded,
  });

  final int index;
  final List<String> listOfDays;
  final bool isIncluded;
  final Function ifNotIncluded,ifIncluded;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isIncluded) {
          ifIncluded();
          // Provider.of<Repository>(context, listen: false)
          //     .removeDailyRoutineCalendarWeekly(index);
        } else {
          ifNotIncluded();
          // Provider.of<Repository>(context, listen: false)
          //     .addDailyRoutineCalendarWeekly(index);
        }
      },
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 10.w,
          decoration: BoxDecoration(
            // gradient: Constances.gradient,
            // border: Border.all(),
            color: isIncluded ? Color(0xff3f4d99) : Color(0xff535970),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            // shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              listOfDays[index],
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontSize: 11.sp,
                    color: isIncluded?Colors.white:index == 0 ? Colors.red : Color(0xff16163d),
                    fontFamily: "PublicSans",
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
