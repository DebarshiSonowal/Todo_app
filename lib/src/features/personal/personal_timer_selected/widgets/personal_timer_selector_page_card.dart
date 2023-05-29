import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/routes.dart';
import '../../../../models/reminder_list_item.dart';
import '../../../../repository/repository.dart';
import '../../../../services/Navigate.dart';
import '../../../../widget/done_button.dart';
import '../../../timer_selected/widgets/time_selector_page_card.dart';
import '../../../timer_selected/widgets/timer_select_list_item.dart';


class PersonalTimerSelectorPage extends StatefulWidget {
  const PersonalTimerSelectorPage({Key? key, required this.index})
      : super(key: key);
  final int index;
  @override
  State<PersonalTimerSelectorPage> createState() => _PersonalTimerSelectorPageState();
}

class _PersonalTimerSelectorPageState extends State<PersonalTimerSelectorPage> {

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
                    type: 1,
                    updateSwitch: (bool val) {
                      setState(() {
                        item.isEnabled = val;
                      });
                    },
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
