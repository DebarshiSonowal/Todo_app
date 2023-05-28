import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/routes.dart';

class EditDailyRoutineAppBar extends StatelessWidget {
  const EditDailyRoutineAppBar({
    super.key,
    required this.isDone,
    required this.index,
    this.next,
  });

  final bool isDone;
  final int index;
  final Function? next;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(9.h),
      child: SafeArea(
        child: Container(
          padding:
              EdgeInsets.only(top: 1.h, right: 2.w, left: 2.w, bottom: 0.5.h),
          color: Theme.of(context).primaryColor,
          child: Column(
            children: [
              Text(
                ''
                'Daily Routine',
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      fontSize: 15.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      // fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 25.w,
                    // height: 8.h,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 1.2.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigation.instance.goBack();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                      ],
                    ),
                  ),
                  isDone
                      ? SizedBox(
                          width: 20.w,
                          // height: 8.h,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 0.8.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Provider.of<Repository>(context,
                                          listen: false)
                                      .addDailyReminder(Provider.of<Repository>(
                                              context,
                                              listen: false)
                                          .recentModel!);

                                  Future.delayed(const Duration(seconds: 0),
                                      () {
                                    Navigation.instance
                                        .navigateAndReplace(Routes.dashboard);
                                  });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Constances.lightBlueBackground,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),

                                  height: 3.5.h,
                                  width: 20.w,
                                  // padding: EdgeInsets.symmetric(
                                  //     horizontal: 1.w, vertical: 0.5.h),
                                  child: Center(
                                    child: Text(
                                      'Done',
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
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(
                          // width: 20.w,
                          // height: 8.h,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 1.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  next!();
                                },
                                child: SizedBox(
                                  child: Row(
                                    children: [
                                      Text(
                                        'Next',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4
                                            ?.copyWith(
                                              fontSize: 12.2.sp,
                                              color: Colors.white,
                                              fontFamily: "PublicSans",
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      SizedBox(
                                        width: 0.5.w,
                                      ),
                                      Image.asset(
                                        Constances.arrowNextImage,
                                        // fit: BoxFit.fill,
                                        scale: Constances.arrowScale,
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
