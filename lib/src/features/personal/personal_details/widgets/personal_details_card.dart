import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';
import '../../../../models/daily_routine_model.dart';
import '../../../daily_routine/view_daily_routine/widgets/date_viewer_daily.dart';

class PersonalDetailsCard extends StatelessWidget {
  const PersonalDetailsCard({
    super.key,
    required this.item,
  });

  final DailyRoutineModel item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 1.w,
              vertical: 1.h,
            ),
            // height: 50.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Constances.blueBackground,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                CircleAvatar(
                  radius: 55.sp, // Image radius
                  backgroundImage: Image.file(
                    File(item.image!),
                    fit: BoxFit.fill,
                    height: 45.w,
                    width: 45.w,
                    errorBuilder: (error, str, _) {
                      return Image.asset(
                        item.image!,
                        fit: BoxFit.fill,
                        height: 45.w,
                        width: 45.w,
                      );
                    },
                  ).image,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  item.title ?? "",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Colors.white,
                        overflow: TextOverflow.fade,
                        fontSize: 14.sp,
                        fontFamily: "RobotoFlex",
                        // fontWeight: FontWeight.bold,
                        // fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  DateFormat("dd MMM yyyy").format(item.dateTime!),
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Colors.white54,
                        overflow: TextOverflow.fade,
                        fontSize: 11.sp,
                        fontFamily: "Rubik",
                        // fontWeight: FontWeight.bold,
                        // fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 7.w,
                  ),
                  child: ListView.separated(
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
                              "${index + 1}. ${current.title ?? ""}",
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                    fontSize: 10.sp,
                                    color: Colors.white,
                                    fontFamily: "RobotoFlex",
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "| ${DateFormat("hh:mm a").format(current.timeDate!)}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                    fontSize: 10.sp,
                                    color: Colors.white,
                                    fontFamily: "RobotoFlex",
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
                ),
                SizedBox(
                  height: 4.h,
                ),
                SizedBox(
                  height: 6.h,
                  width: double.infinity,
                  child: Center(
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.w,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return DateViewerDaily(
                          type: 1,
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
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 2.h,
            right: 3.w,
          ),
          height: 5.h,
          width: 10.w,
          child: Column(
            children: [
              const Icon(
                Icons.share,
                color: Colors.white,
              ),
              Text(
                "Share",
                maxLines: 1,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: const Color(0xffFFC700),
                      overflow: TextOverflow.fade,
                      fontSize: 9.sp,
                      fontFamily: "Rubik",
                      // fontWeight: FontWeight.bold,
                      // fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
