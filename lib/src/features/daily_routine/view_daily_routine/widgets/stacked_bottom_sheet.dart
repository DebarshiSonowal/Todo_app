import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/routes.dart';
import '../../../../models/daily_routine_model.dart';
import '../../../../repository/repository.dart';
import '../../../../services/Navigate.dart';
import 'stacked_sheet_item.dart';

class StackedBottomSheet extends StatelessWidget {
  const StackedBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Repository>(builder: (context, data, _) {
      return Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Container(
          // height: getHeight(data.models.length),
          width: 80.w,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 3.w,
            vertical: 2.h,
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var item = Constances.listOptions[index];
              return StackedSheetItem(
                item: item,
                onTap: () {
                  Provider.of<Repository>(context, listen: false)
                      .addDailyReminder(
                    DailyRoutineModel(
                        item.name,
                        // DateFormat("hh:mm a").format(DateTime.now()),
                        DateFormat("hh:mm a").format(
                          DateTime(DateTime.now().year, DateTime.now().month,
                              DateTime.now().day, 12, 0),
                        ),
                        DateTime(DateTime.now().year, DateTime.now().month,
                            DateTime.now().day, 12, 0),
                        item.image,
                        [],
                        2
                        ),
                  );
                  // Navigation.instance.navigate(Routes.addDailyRoutineNormal);
                },
              );
            },
            separatorBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0.1.h,
                ),
                child: Divider(
                  thickness: 0.1.h,
                ),
              );
            },
            itemCount: Constances.listOptions.length,
          ),
        ),
      );
    });
  }
}
