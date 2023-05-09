import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/constants.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import '../../../constants/routes.dart';
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
    return Container(
      height: 100.h,
      width: 100.w,
      padding: EdgeInsets.symmetric(
        horizontal: 6.w,
        vertical: 2.h,
      ),
      color: Colors.transparent,
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigation.instance.navigate(Routes.addDailyRoutineNormal);
                  },
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.w, vertical: 0.5.h),
                      decoration: const BoxDecoration(
                        color: Constances.lightBlueBackground,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Add New',
                            style:
                                Theme.of(context).textTheme.headline4?.copyWith(
                                      fontSize: 11.2.sp,
                                      color: Colors.white,
                                      fontFamily: "PublicSans",
                                      // fontWeight: FontWeight.bold,
                                    ),
                          ),
                          const Icon(
                            Icons.add,
                            color: Colors.white,
                            // size:19.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 42.8.h,
              width: double.infinity,
              child: Consumer<Repository>(builder: (context, data, _) {
                return data.models.isNotEmpty
                    ? ListView.separated(
                        // shrinkWrap: true,
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
                      )
                    : const EmptyAddNewCard();
              }),
            ),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}




