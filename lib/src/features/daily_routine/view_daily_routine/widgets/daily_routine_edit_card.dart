import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/routes.dart';
import '../../../../models/daily_routine_model.dart';
import '../../../../services/Navigate.dart';
import 'date_viewer_daily.dart';

class DailyRoutineEditCard extends StatelessWidget {
  const DailyRoutineEditCard({
    super.key,
    required this.item,
    required this.index,
  });

  final DailyRoutineModel item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(Random.secure().nextInt(1000).toString()),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 1,
            onPressed: (context) {
              Provider.of<Repository>(context, listen: false)
                  .removeDailyReminder(index);
              Fluttertoast.showToast(msg: "Removed Successfully");
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
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
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 1.h,
                  ),
                  SizedBox(
                    width: 40.w,
                    child: Text(
                      item.title ?? "",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontSize: 12.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const Spacer(),
                  item.reminders.isNotEmpty
                      ? Container()
                      : Text(
                          DateFormat("|hh:mm a")
                              .format(item.dateTime ?? DateTime.now()),
                          style:
                              Theme.of(context).textTheme.headline4?.copyWith(
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
                      Navigation.instance.navigate(
                        Routes.editDailyRoutineNormal,
                        args: index,
                        // index == 1 ? "Drink lemon water" : "Shower",
                      );
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
                height: 1.h,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var current = item.reminders[index];
                  return Row(
                    children: [
                      SizedBox(
                        width: 1.h,
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          current.title ?? "",
                          style:
                              Theme.of(context).textTheme.headline4?.copyWith(
                                    fontSize: 10.sp,
                                    color: Colors.white70,
                                    fontFamily: "Roboto",
                                  ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "| ${DateFormat("hh:mm a").format(current.timeDate!)}",
                          style:
                              Theme.of(context).textTheme.headline4?.copyWith(
                                    fontSize: 10.sp,
                                    color: Colors.white70,
                                    fontFamily: "Roboto",
                                    // fo ntWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 0.5.h,
                  );
                },
                itemCount: item.reminders.length,
              ),
              SizedBox(
                height: 1.h,
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
                    debugPrint(item.weekDays.toString());
                    return DateViewerDaily(
                      index: index,
                      isIncludedWeekday: item.weekDays.contains(index - 1),
                      isMonthly: item.monthly.where((element) {
                        if (element.year == DateTime.now().year &&
                            element.month == DateTime.now().month &&
                            element.day == DateTime.now().day) {
                          return true;
                        }
                        return false;
                      }).isNotEmpty
                          ? true
                          : false,
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
    );
  }
}
