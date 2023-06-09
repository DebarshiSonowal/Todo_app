import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/routes.dart';
import '../../../../services/notification_services.dart';

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

class TimeDateSelectorDailyRoutineAppBar extends StatelessWidget {
  const TimeDateSelectorDailyRoutineAppBar({
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
                                  for (var i in Provider.of<Repository>(context,
                                          listen: false)
                                      .recentModel!
                                      .reminders) {
                                    if (i.isEnabled) {
                                      debugPrint(
                                          "${i.timeDate.toString()} ${i.timeDate!.difference(DateTime.now()).inSeconds} ${i.options!.ringtone!.split("/").last.split(".")[0].toLowerCase()}");

                                      NotificationService()
                                          .showNotificationStrict(
                                              1,
                                              Provider.of<Repository>(context,
                                                          listen: false)
                                                      .recentModel!
                                                      .title ??
                                                  "Default",
                                              i.title ?? "NA",
                                              i.timeDate!
                                                  .difference(DateTime.now())
                                                  .inSeconds,
                                              i.options?.vibration ?? false,
                                              ((i.options?.ringtone == null ||
                                                      i.options?.ringtone ==
                                                          "NA")
                                                  ? "alarm_clock"
                                                  : i.options!.ringtone!
                                                      .split("/")
                                                      .last
                                                      .split(".")[0]
                                                      .toLowerCase()));

                                      // NotificationService()
                                      //     .scheduledNotification(
                                      //         hour: i.timeDate!.hour,
                                      //         minutes: i.timeDate!.minute,
                                      //         id: int.parse(
                                      //             Provider.of<Repository>(
                                      //                     context,
                                      //                     listen: false)
                                      //                 .recentModel!
                                      //                 .id
                                      //                 .toString()),
                                      //         sound: i.options?.ringtone ??
                                      //             "assets/audio/alarm_clock.mp3",
                                      //         year: i.timeDate!.year,
                                      //         month: i.timeDate!.month,
                                      //         day: i.timeDate!.day);
                                    }
                                  }

                                  if (index == 1) {
                                    Provider.of<Repository>(context,
                                            listen: false)
                                        .addDailyReminder(
                                            Provider.of<Repository>(context,
                                                    listen: false)
                                                .recentModel!);

                                    // Provider.of<Repository>(context,
                                    //     listen: false)
                                    //     .addDailyReminder(
                                    //     Provider
                                    //     .of<Repository>(
                                    //     context,
                                    //     listen: false)
                                    //     .recentModel!
                                    //     );
                                  } else {
                                    if (Provider.of<Repository>(context,
                                                listen: false)
                                            .models
                                            .indexWhere((element) =>
                                                element.id ==
                                                Provider.of<Repository>(context,
                                                        listen: false)
                                                    .recentModel!
                                                    .id) >=
                                        0) {
                                      Provider.of<Repository>(context,
                                              listen: false)
                                          .modifyDailyReminder(
                                              Provider.of<Repository>(context,
                                                      listen: false)
                                                  .models
                                                  .indexWhere((element) =>
                                                      element.id ==
                                                      Provider.of<Repository>(
                                                              context,
                                                              listen: false)
                                                          .recentModel!
                                                          .id),
                                              Provider.of<Repository>(context,
                                                      listen: false)
                                                  .recentModel!);
                                    } else {
                                      Provider.of<Repository>(context,
                                              listen: false)
                                          .addDailyReminder(
                                              Provider.of<Repository>(context,
                                                      listen: false)
                                                  .recentModel!);
                                    }
                                  }

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

class TimeDateSelectorPersonalAppBar extends StatelessWidget {
  const TimeDateSelectorPersonalAppBar({
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
                'Personal',
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
                                  for (var i in Provider.of<Repository>(context,
                                          listen: false)
                                      .recentModel!
                                      .reminders) {
                                    if (i.isEnabled) {
                                      debugPrint(
                                          "${i.timeDate.toString()} ${i.timeDate!.difference(DateTime.now()).inSeconds} ${i.options!.ringtone!.split("/").last.split(".")[0].toLowerCase()}");

                                      NotificationService()
                                          .showNotificationStrict(
                                              1,
                                              Provider.of<Repository>(context,
                                                          listen: false)
                                                      .recentModel!
                                                      .title ??
                                                  "Default",
                                              i.title ?? "NA",
                                              i.timeDate!
                                                  .difference(DateTime.now())
                                                  .inSeconds,
                                              i.options?.vibration ?? false,
                                              ((i.options?.ringtone == null ||
                                                      i.options?.ringtone ==
                                                          "NA")
                                                  ? "alarm_clock"
                                                  : i.options!.ringtone!
                                                      .split("/")
                                                      .last
                                                      .split(".")[0]
                                                      .toLowerCase()));

                                      // NotificationService()
                                      //     .scheduledNotification(
                                      //         hour: i.timeDate!.hour,
                                      //         minutes: i.timeDate!.minute,
                                      //         id: int.parse(
                                      //             Provider.of<Repository>(
                                      //                     context,
                                      //                     listen: false)
                                      //                 .recentModel!
                                      //                 .id
                                      //                 .toString()),
                                      //         sound: i.options?.ringtone ??
                                      //             "assets/audio/alarm_clock.mp3",
                                      //         year: i.timeDate!.year,
                                      //         month: i.timeDate!.month,
                                      //         day: i.timeDate!.day);
                                    }
                                  }
                                  if (index == 1) {
                                    Provider.of<Repository>(context,
                                            listen: false)
                                        .addPersonal(Provider.of<Repository>(
                                                context,
                                                listen: false)
                                            .recentModel!);

                                    // Provider.of<Repository>(context,
                                    //     listen: false)
                                    //     .addDailyReminder(
                                    //     Provider
                                    //     .of<Repository>(
                                    //     context,
                                    //     listen: false)
                                    //     .recentModel!
                                    //     );
                                  } else {
                                    debugPrint(
                                        "Bar ${Provider.of<Repository>(context, listen: false).personals.map((e) => e.id).toString()}");
                                    debugPrint(
                                        "Bar2 ${Provider.of<Repository>(context, listen: false).recentModel!.id}");
                                    if (Provider.of<Repository>(context,
                                            listen: false)
                                        .personals
                                        .isNotEmpty) {
                                      Provider.of<Repository>(context,
                                              listen: false)
                                          .modifyPersonals(
                                              Provider.of<Repository>(context,
                                                      listen: false)
                                                  .personals
                                                  .indexWhere((element) =>
                                                      element.id ==
                                                      Provider.of<Repository>(
                                                              context,
                                                              listen: false)
                                                          .recentModel!
                                                          .id),
                                              Provider.of<Repository>(context,
                                                      listen: false)
                                                  .recentModel!);
                                    } else {
                                      Provider.of<Repository>(context,
                                              listen: false)
                                          .addPersonal(Provider.of<Repository>(
                                                  context,
                                                  listen: false)
                                              .recentModel!);
                                    }
                                  }

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
