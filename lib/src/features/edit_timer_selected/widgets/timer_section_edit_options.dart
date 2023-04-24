import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/features/edit_timer_selected/widgets/edit_time_selected_card.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import '../../../constants/constants.dart';
import '../../../models/timer_section_option_model.dart';
import '../../../widget/done_button.dart';
import '../../timer_selected/widgets/time_selector_page_card.dart';

class TimerSectionEditOptions extends StatelessWidget {
  const TimerSectionEditOptions({
    super.key,
    required this.list,
    required this.options,
  });

  final List<String> list;
  final TimerSelectionOptions options;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 1.h,
        ),
        decoration: BoxDecoration(
          color: const Color(0xff3c404f).withOpacity(0.6),
          // color: Colors.transparent,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          // shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        list[index],
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              fontSize: 14.sp,
                              color: Constances.editTimeSelectedCardTextColor,
                              fontFamily: "PublicSans",
                              // fontWeight: FontWeight.bold,
                            ),
                      ),
                      Row(
                        children: [
                          Text(
                            getCorrectValue(index, options),
                            style:
                                Theme.of(context).textTheme.headline4?.copyWith(
                                      fontSize: 14.sp,
                                      color: Colors.white,
                                      fontFamily: "PublicSans",
                                      // fontWeight: FontWeight.bold,
                                    ),
                          ),
                          index == 1
                              ? SizedBox(
                                  width: 1.w,
                                )
                              : Container(),
                          index == 1
                              ? Image.asset(
                                  Constances.speakerImage,
                                  // color: Colors.white,
                                  fit: BoxFit.fill,
                                  height: 12.sp,
                                  width: 12.sp,
                                )
                              : Container(),
                          Image.asset(
                            Constances.nextImage,
                            // color: Colors.white,
                            fit: BoxFit.fill,
                            height: 12.sp,
                            width: 12.sp,
                          ),
                        ],
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const CustomDivider();
                },
                itemCount: list.length),
            DoneButton(
              txt: "Save",
              onTap: () {
                Navigation.instance.goBack();
              },
            ),
          ],
        ),
      ),
    );
  }

  String getCorrectValue(int index, TimerSelectionOptions options) {
    switch (index) {
      case 2:
        return (options.vibration ?? false) ? "On" : "Off";

      case 1:
        return "${options.volume}";
      default:
        return (options.ringtone ?? "").capitalize();
    }
  }
}
