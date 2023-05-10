import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/models/personal_model.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';
import 'package:vishal_todo_app/src/widget/done_button.dart';

import '../../../constants/constants.dart';
import '../../../services/Navigate.dart';

class AddPersonalInfoAppbar extends StatelessWidget {
  const AddPersonalInfoAppbar({Key? key, required this.savePersonal}) : super(key: key);
  final Function savePersonal;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(9.h),
      child: Container(
        color: Theme
            .of(context)
            .primaryColor,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 1.h, right: 2.w, left: 2.w),
            color: Theme
                .of(context)
                .primaryColor,
            child: Column(
              children: [
                Text(
                  ''
                      'Personal',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(
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
                          GestureDetector(
                            onTap: () {
                              Navigation.instance.goBack();
                            },
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Image.asset(
                                    Constances.arrowBackImage,
                                    fit: BoxFit.fill,
                                    scale: Constances.arrowScale,
                                  ),
                                  Text(
                                    'Back',
                                    style: Theme
                                        .of(context)
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
                    // SizedBox(
                    //   height: 4.h,
                    //   width: 20.w,
                    //   child: DoneButton(
                    //     color: const Color(0xff213285),
                    //     txtColor: Colors.white,
                    //     txt: "Save",
                    //     onTap: ()=>savePersonal(),
                    //   ),
                    // ),
                    SizedBox(
                      width: 20.w,
                      // height: 8.h,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: ()=>savePersonal(),
                            child: SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Next',
                                    style: Theme
                                        .of(context)
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
                                  Image.asset(
                                    Constances.arrowNextImage,
                                    fit: BoxFit.fill,
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
      ),
    );
  }
}
