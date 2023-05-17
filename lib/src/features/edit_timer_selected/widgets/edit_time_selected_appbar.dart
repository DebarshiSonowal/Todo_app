import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../repository/repository.dart';
import '../../../services/Navigate.dart';

class EditTimerSelectAppbar extends StatelessWidget {
  const EditTimerSelectAppbar({
    super.key,
    this.type,
    required this.index,
    required this.num,
  });

  final int? type;
  final int index, num;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 4.5.h,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigation.instance.goBack();
                },
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Cancel',
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              fontSize: 13.sp,
                              color: Colors.white,
                              fontFamily: "PublicSans",
                              // fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (type == null) {
                    Provider.of<Repository>(context, listen: false)
                        .updateTimeSelection(
                      index,
                      num,
                      DateTime(DateTime.now().year, DateTime.now().month,
                          DateTime.now().day, 12, 0),
                    );
                  } else {
                    Provider.of<Repository>(context, listen: false)
                        .updateTimeSelectionPersonal(
                      index,
                      num,
                      DateTime(DateTime.now().year, DateTime.now().month,
                          DateTime.now().day, 12, 0),
                    );
                  }
                  Navigation.instance.goBack();
                },
                child: SizedBox(
                  child: Text(
                    'Delete',
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontSize: 13.sp,
                          color: Colors.red,
                          fontFamily: "PublicSans",
                          // fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      // actions: [

      // ],
    );
  }
}
