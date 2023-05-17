import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/routes.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';

import '../../../../constants/constants.dart';
import '../../../../models/essential_note.dart';
import '../../../../services/Navigate.dart';

class EssentialDetailsAppbar extends StatelessWidget {
  const EssentialDetailsAppbar({
    super.key,
    required this.index,
    required this.item,
  });

  final int index;
  final EssentialNotes item;

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
                  SizedBox(
                    height: 4.h,
                    // width: 20.w,
                    child: FocusedMenuHolder(
                      blurSize: 0,
                      menuItemExtent: 6.h,
                      menuWidth: 50.w,
                      menuBoxDecoration: BoxDecoration(
                        // border: Border.all(
                        //   width: 0.04.h,
                        //   // assign the color to the border color
                        //   color: Colors.white,
                        // ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      duration: const Duration(milliseconds: 100),
                      animateMenuItems: true,
                      blurBackgroundColor: Colors.transparent,
                      openWithTap: true,
                      // Open Focused-Menu on Tap rather than Long Press
                      menuOffset: 10.0,

                      // Offset value to show menuItem from the selected item
                      bottomOffsetHeight: 2.0,
                      // Offset hei
                      onPressed: () {},
                      menuItems: [
                        // Add Each FocusedMenuItem  for Menu Options
                        FocusedMenuItem(
                          backgroundColor: const Color(0xff50555c),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                Constances.shareImage,
                                color: Colors.white,
                                fit: BoxFit.fitWidth,
                                width: 6.w,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "Share Via",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      color: Colors.white70,
                                      fontSize: 14.sp,
                                    ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigation.instance.goBack();
                          },
                        ),
                        FocusedMenuItem(
                          backgroundColor: const Color(0xff50555c),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                Constances.deleteImage,
                                color: Colors.white,
                                fit: BoxFit.fitWidth,
                                width: 6.w,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "Delete",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      color: Colors.red,
                                      fontSize: 14.sp,
                                    ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Provider.of<Repository>(context, listen: false)
                                .removeEssential(item);
                            Navigation.instance.navigateAndRemoveUntil(Routes.dashboard);
                          },
                        ),
                      ],
                      child: const Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
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
