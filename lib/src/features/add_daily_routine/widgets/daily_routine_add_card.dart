import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../view_daily_routine/widgets/date_viewer_daily.dart';

class DailyRoutineAddCard extends StatefulWidget {
  const DailyRoutineAddCard({Key? key}) : super(key: key);

  @override
  State<DailyRoutineAddCard> createState() => _DailyRoutineAddCardState();
}

class _DailyRoutineAddCardState extends State<DailyRoutineAddCard> {
  Time? timePicked;

  void onTimeChanged(Time newTime) {
    setState(() {
      timePicked = newTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 2.h,
        ),
        // height: 15.h,
        width: 100.w,
        decoration: const BoxDecoration(
          color: Constances.blueBackground,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                Icon(
                  Icons.note_alt_outlined,
                  color: Colors.white,
                  size: 15.sp,
                ),
              ],
            ),
            SizedBox(
              height: 0.1.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 50.w,
                  child: TextFormField(
                    maxLines: 2,
                    minLines: 1,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Title',
                      hintStyle:
                          Theme.of(context).textTheme.headline4?.copyWith(
                                fontSize: 14.sp,
                                color: Colors.white70,
                                // fontWeight: FontWeight.bold,
                                fontFamily: "Roboto",
                              ),
                    ),
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontFamily: "Roboto",
                          // fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      showPicker(
                        context: context,
                        is24HrFormat: false,
                        value: timePicked ??
                            Time(
                              hour: DateTime.now().day,
                              minute: DateTime.now().minute,
                              second: DateTime.now().second,
                            ),
                        onChange: onTimeChanged,
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 20.w,
                    child: Text(
                      // DateFormat("| hh:mm a").format(DateTime.now()),
                      timePicked == null
                          ? "| hh:mm"
                          : "| ${MaterialLocalizations.of(context).formatTimeOfDay(timePicked!)}",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontSize: 10.sp,
                            color: Colors.white70,
                            fontFamily: "Roboto",
                            // fo ntWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ],
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
                  return DateViewerDaily(
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
    );
  }
}
