import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import '../../../constants/constants.dart';
import '../../../repository/repository.dart';
import '../../../widget/done_button.dart';
import 'date_selected_card_daily_section.dart';
import 'date_selected_card_monthly_selection.dart';

class DateSelectedCard extends StatefulWidget {
  const DateSelectedCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<DateSelectedCard> createState() => _DateSelectedCardState();
}

class _DateSelectedCardState extends State<DateSelectedCard> {
  bool selectedDaily = true;
  var listOfDays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
  DateTime defaultTime = DateTime.now();
  List<int> days = [];
  List<DateTime> dates = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500),(){
      days = Provider.of<Repository>(context, listen: false).recentModel?.weekDays??[];
      dates = Provider.of<Repository>(context, listen: false).recentModel?.monthly??[];
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Consumer<Repository>(builder: (context, data, _) {
        return Container(
          padding: EdgeInsets.only(
            bottom: 2.5.h,
          ),
          decoration: const BoxDecoration(
            gradient: Constances.gradient,
            // border: Border.all(),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            // shape: BoxShape.circle,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDaily = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedDaily
                              ? Constances.selectedDateColor
                              : Colors.transparent,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 1.5.h,
                          ),
                          child: Center(
                            child: Text(
                              "Daily",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                    fontSize: 14.sp,
                                    color: selectedDaily
                                        ? Colors.black
                                        : Colors.white,
                                    fontFamily: "PublicSans",
                                    // fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDaily = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedDaily
                              ? Colors.transparent
                              : Constances.selectedDateColor,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 1.5.h,
                          ),
                          child: Center(
                            child: Text(
                              "Monthly",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                    fontSize: 14.sp,
                                    color: selectedDaily
                                        ? Colors.white
                                        : Colors.black,
                                    fontFamily: "PublicSans",
                                    // fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Container(),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              selectedDaily
                  ? DateSelectedCardDailySection(
                      listOfDays: listOfDays,
                      days: days,
                      updateParent: () {
                        setState(() {});
                      },
                    )
                  : DateSelectedCardSelection(
                      updateParent: (val) {
                        setState(() {
                          defaultTime = val;
                        });
                      },
                      refreshParent: () {
                        setState(() {});
                      },
                      defaultTime: defaultTime,
                      dates: dates,
                    ),
              SizedBox(
                height: 1.h,
              ),
              DoneButton(
                txt: "Save",
                onTap: () {
                  Provider.of<Repository>(context, listen: false)
                      .updateDailyRoutineCalendarWeekly(days, dates);
                  Future.delayed(const Duration(milliseconds: 500),(){
                    Navigation.instance.goBack();
                  });
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
