import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/constants.dart';
import 'package:vishal_todo_app/src/constants/routes.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            // showCalendar(context);
            Navigation.instance.navigate(Routes.showCalendar);
          },
          icon: Icon(
            Icons.calendar_month,
            color: Colors.white,
            size: 21.sp,
          ),
        )
      ],
      flexibleSpace: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 3.85.h,
            ),
            Text(
              DateFormat("MMM yyyy").format(DateTime.now()),
              style: Theme.of(context).textTheme.headline3?.copyWith(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                  ),
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              height: 4.9.h,
              width: double.infinity,
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  horizontal: 2.w,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 10.w,
                    child: Column(
                      children: [
                        Text(
                          DateFormat("EEE").format(
                            DateTime.now().add(
                              Duration(days: index),
                            ),
                          ),
                          style:
                              Theme.of(context).textTheme.headline4?.copyWith(
                                    color: Colors.white70,
                                    fontFamily: "Rubik",
                                    fontSize: 10.sp,
                                    // fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          DateFormat("dd").format(
                            DateTime.now().add(
                              Duration(days: index),
                            ),
                          ),
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    color: Colors.white,
                                    fontSize: 11.sp,
                                    fontFamily: "Rubik",
                                    // fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 4.w,
                  );
                },
                itemCount: 7,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String nameOfDay(int index) {
    switch (index) {
      case 0:
        return "M";
      case 1:
        return "T";
      case 2:
        return "W";
      case 3:
        return "T";
      case 4:
        return "F";
      default:
        return "S";
    }
  }

  checkThisMonth(DateTime dateTime, DateTime defaultTime) {
    if (DateFormat("MMM").format(dateTime) ==
        DateFormat("MMM").format(defaultTime)) {
      return true;
    }
    return false;
  }

  checkIfHoliday(DateTime dateTime) {
    switch (DateFormat("EEE").format(dateTime)) {
      case "Sat":
        return true;
      case "Sun":
        return true;
      default:
        return false;
    }
  }
}
