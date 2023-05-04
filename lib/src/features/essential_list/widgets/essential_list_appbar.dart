import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../services/Navigate.dart';

class EssentialListAppBar extends StatelessWidget {
  const EssentialListAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 1.h, right: 2.w, left: 2.w),
          color: Theme.of(context).primaryColor,
          child: Column(
            children: [
              Text(
                ''
                    'Essential',
                style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontSize: 15.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  // fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 20.w,
                    // height: 8.h,
                    child: Column(
                      children: [
                        // SizedBox(
                        //   height: 1.h,
                        // ),
                        GestureDetector(
                          onTap: () {
                            Navigation.instance.goBack();
                          },
                          child: SizedBox(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 16.sp,
                                ),
                                Text(
                                  'Back',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      ?.copyWith(
                                    fontSize: 11.2.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    // fontWeight: FontWeight.bold,
                                    fontFamily: "Roboto",
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}