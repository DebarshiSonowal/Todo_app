import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/routes.dart';

import '../../../constants/constants.dart';
import '../../../models/reminder_list_item.dart';
import '../../../repository/repository.dart';
import '../../../services/Navigate.dart';
import '../../../widget/done_button.dart';
import 'timer_select_list_item.dart';

class TimerSelectorPageCard extends StatefulWidget {
  final int index;

  const TimerSelectorPageCard({super.key, required this.index});

  @override
  State<TimerSelectorPageCard> createState() => _TimerSelectorPageCardState();
}

class _TimerSelectorPageCardState extends State<TimerSelectorPageCard> {
  List<ReminderListItem> reminders = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () {
      reminders = Provider.of<Repository>(context, listen: false)
              .recentModel
              ?.reminders ??
          [];
      setState(() {});
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
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
            vertical: 1.h,
          ),
          decoration: const BoxDecoration(
            gradient: Constances.gradient,
            // border: Border.all(),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            // shape: BoxShape.circle,
          ),
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     IconButton(
              //       onPressed: () {},
              //       icon: const Icon(
              //         Icons.add,
              //         color: Colors.white,
              //       ),
              //     )
              //   ],
              // ),
              SizedBox(
                height: 2.h,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, num) {
                  var item = reminders[num];
                  return TimerSelectListItem(
                    item: item,
                    index: widget.index,
                    num: num,
                    updateSwitch: (bool val) {
                      setState(() {
                        item.isEnabled = val;
                      });
                    },
                    // type: 1,
                  );
                },
                separatorBuilder: (context, index) {
                  return const CustomDivider();
                },
                itemCount: reminders.length,
              ),
              SizedBox(
                height: 3.h,
              ),
              DoneButton(
                onTap: () {
                  Provider.of<Repository>(context, listen: false)
                      .updateRemindersRecent(reminders);
                  Future.delayed(const Duration(seconds: 1), () {
                    Navigation.instance.goBack();
                  });
                },
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        );
      }),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.height,
  });

  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? (2.h),
      width: double.infinity,
      child: Center(
        child: Divider(
          thickness: 0.5.sp,
          color: Constances.dividerColor,
        ),
      ),
    );
  }
}
