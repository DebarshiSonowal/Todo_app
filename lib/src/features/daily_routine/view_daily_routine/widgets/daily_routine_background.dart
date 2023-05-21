import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/constants.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import '../../../../constants/routes.dart';
import 'add_new_card.dart';
import 'daily_routine_edit_card.dart';
import 'date_viewer_daily.dart';
import 'empty_add_card.dart';

class DailyRoutineBackground extends StatelessWidget {
  DailyRoutineBackground({
    super.key,
  });

  final list = ["Daily Lemon Water", "Shower"];
  int? selected;

  @override
  Widget build(BuildContext context) {
    return Consumer<Repository>(builder: (context, data, _) {
        return Container(
          height: getHeight(data.models.length),
          width: 100.w,
          padding: EdgeInsets.symmetric(
            horizontal: 6.w,
            // vertical: 1.h,
          ),
          color: Colors.transparent,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     GestureDetector(
                //       onTap: () {
                //         Navigation.instance.navigate(Routes.addDailyRoutineNormal);
                //       },
                //       child: const AddNewCard(),
                //     )
                //   ],
                // ),
                data.models.isNotEmpty
                    ? SizedBox(
                        height: 74.h,
                        width: double.infinity,
                        child: ListView.separated(
                          padding: EdgeInsets.only(
                            bottom: 4.h
                          ),
                          shrinkWrap: true,
                          // padding: EdgeInsets.only(
                          //   // bottom: 20.h,
                          // ),
                          // physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var item = data.models[index];
                            return DailyRoutineEditCard(
                              item: item,
                              index: index,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 1.h,
                            );
                          },
                          itemCount: data.models.length,
                        ),
                      )
                    : const EmptyAddNewCard(),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  getHeight(int length) {
    if (length <= 2) {
      return 46.h;
    } else if (length == 3) {
      return 61.h;
    }
    return 71.h;
  }
}
