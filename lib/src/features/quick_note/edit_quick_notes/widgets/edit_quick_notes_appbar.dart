import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';
import '../../../../services/Navigate.dart';
import '../../../../widget/done_button.dart';

class EditQuickNotesAppbar extends StatelessWidget {
  const EditQuickNotesAppbar(
      {Key? key, required this.onTap, required this.onTapOptions})
      : super(key: key);
  final Function onTap;
  final Function(int) onTapOptions;

  @override
  Widget build(BuildContext context) {
    //img_iconoirmorehorizcircle.svg
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 1.h, right: 2.w, left: 2.w),
          color: Theme.of(context).primaryColor,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Text(
                  'Quick Note',
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
                  children: [
                    SizedBox(
                      width: 20.w,
                      // height: 8.h,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigation.instance.goBack();
                            },
                            child: SizedBox(
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
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerTheme: const DividerThemeData(
                          color: Colors.white,
                        ),
                        // iconTheme: IconThemeData(color: Colors.white),
                        // textTheme: TextTheme().apply(bodyColor: Colors.white),
                      ),
                      child: PopupMenuButton(
                        offset:  Offset(
                          35.w,9.h
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                          PopupMenuItem(
                            height: 3.h,
                            // padding: EdgeInsets.symmetric(
                            //   horizontal: 2.w,
                            //   vertical: 0.1.h,
                            // ),
                            value: 1,
                            onTap: () => onTapOptions(1),
                            child: SizedBox(
                              width: 44.w,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 39.w,
                                    child: Text(
                                      "Change Date",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            color: Colors.white70,
                                            fontSize: 12.sp,
                                            fontFamily: "PlusJakarta",
                                          ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 5.w,
                                  // ),
                                  Image.asset(
                                    Constances.calendarImage2,
                                    // color: Colors.white,
                                    fit: BoxFit.fitWidth,
                                    width: 4.w,
                                  ),
                                  // const Icon(
                                  //   Icons.calendar_today_outlined,
                                  //   color: Colors.white,
                                  //   // fit: BoxFit.fitWidth,
                                  //   // width: 6.w,
                                  // ),
                                ],
                              ),
                            ),
                          ),
                          PopupMenuDivider(
                            height: 2.5.h,
                          ),
                          PopupMenuItem(
                            height: 3.h,
                            // padding: EdgeInsets.symmetric(
                            //   horizontal: 2.w,
                            //   vertical: 0.1.h,
                            // ),
                            value: 2,
                            onTap: () => onTapOptions(2),
                            child: SizedBox(
                              width: 44.w,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 39.w,
                                    child: Text(
                                      "Timer",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            color: Colors.white70,
                                            fontSize: 12.sp,
                                            fontFamily: "PlusJakarta",
                                          ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 21.5.w,
                                  // ),
                                  Image.asset(
                                    Constances.alarmImage,
                                    // color: Colors.white,
                                    fit: BoxFit.fitWidth,
                                    width: 4.w,
                                  ),
                                  // const Icon(
                                  //   Icons.alarm,
                                  //   color: Colors.white,
                                  //   // fit: BoxFit.fitWidth,
                                  //   // width: 6.w,
                                  // ),
                                ],
                              ),
                            ),
                          ),
                          PopupMenuDivider(
                            height: 2.5.h,
                          ),
                          PopupMenuItem(
                            height: 3.h,
                            // padding: EdgeInsets.symmetric(
                            //   horizontal: 2.w,
                            //   vertical: 0.1.h,
                            // ),
                            value: 3,
                            onTap: () => onTapOptions(3),
                            child: Container(
                              width: 44.w,
                              // padding: EdgeInsets.only(
                              //   left: 4.w,
                              // ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 39.w,
                                    child: Text(
                                      "Share",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            color: Colors.white70,
                                            fontSize: 12.sp,
                                            fontFamily: "PlusJakarta",
                                          ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 21.5.w,
                                  // ),
                                  Image.asset(
                                    Constances.uploadImage,
                                    // color: Colors.white,
                                    fit: BoxFit.fitWidth,
                                    width: 4.w,
                                  ),
                                  // const Icon(
                                  //   Icons.ios_share,
                                  //   color: Colors.white,
                                  //   // fit: BoxFit.fitWidth,
                                  //   // width: 6.w,
                                  // ),
                                ],
                              ),
                            ),
                          ),
                          PopupMenuDivider(
                            height: 2.5.h,
                          ),
                          PopupMenuItem(
                            height: 3.h,
                            // padding: EdgeInsets.symmetric(
                            //   horizontal: 2.w,
                            //   vertical: 0.1.h,
                            // ),
                            onTap: () => onTapOptions(4),
                            value: 4,
                            child: SizedBox(
                              width: 44.w,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 39.w,
                                    child: Text(
                                      "Delete",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            color: Colors.red,
                                            fontSize: 12.sp,
                                            fontFamily: "PlusJakarta",
                                          ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 19.w,
                                  // ),
                                  Image.asset(
                                    Constances.trashImage,
                                    // color: Colors.white,
                                    fit: BoxFit.fitWidth,
                                    width: 4.w,
                                  ),
                                  // Image.asset(
                                  //   Constances.deleteImage,
                                  //   color: Colors.white,
                                  //   fit: BoxFit.fitWidth,
                                  //   width: 6.w,
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                        // onSelected: (int value) {},
                        color: const Color(0xff50555d),
                        icon: SvgPicture.asset(
                          Constances.optionImage,
                          height: 20.sp,
                        ),
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: ()=>onTapOptions(),
                    //   child: SvgPicture.asset(
                    //     Constances.optionImage,
                    //     height: 20.sp,
                    //   ),
                    // ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        bottom: 0.2.h,
                      ),
                      height: 4.h,
                      width: 20.w,
                      child: DoneButton(
                        color: const Color(0xff213285),
                        txtColor: Colors.white,
                        txt: "Save",
                        onTap: () => onTap(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
