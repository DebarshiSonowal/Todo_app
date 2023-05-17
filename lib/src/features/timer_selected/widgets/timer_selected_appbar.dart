import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../services/Navigate.dart';

class TimerSelectAppbar extends StatelessWidget {
  const TimerSelectAppbar({
    super.key,
    required this.showDelete,
  });

  final bool showDelete;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 1.5.h, right: 2.w, left: 2.w),
        color: Theme.of(context).primaryColor,
        child: Column(
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
                  child: showDelete
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Cancel',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                    fontSize: 13.sp,
                                    color: Colors.white,
                                    fontFamily: "PublicSans",
                                    // fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Image.asset(
                              Constances.arrowBackImage,
                              fit: BoxFit.contain,
                              scale: Constances.arrowScale,
                            ),
                            SizedBox(
                              width: 0.5.w,
                            ),
                            Text(
                              'Back',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                    fontSize: 12.2.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    // fontWeight: FontWeight.bold,
                                    fontFamily: "Rubik",
                                    // fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                ),
                showDelete
                    ? GestureDetector(
                        onTap: () {
                          Navigation.instance.goBack();
                        },
                        child: SizedBox(
                          child: Text(
                            'Delete',
                            style:
                                Theme.of(context).textTheme.headline4?.copyWith(
                                      fontSize: 13.sp,
                                      color: Colors.red,
                                      fontFamily: "PublicSans",
                                      // fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
