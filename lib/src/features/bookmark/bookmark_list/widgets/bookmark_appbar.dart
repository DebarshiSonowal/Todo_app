import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';
import '../../../../services/Navigate.dart';
import '../../../../widget/done_button.dart';

class BookmarkAppbar extends StatelessWidget {
  const BookmarkAppbar({Key? key, this.saveBookmark}) : super(key: key);
  final Function? saveBookmark;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(9.h),
      child: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 1.h, right: 2.w, left: 2.w),
            color: Theme.of(context).primaryColor,
            child: Column(
              children: [
                Text(
                  ''
                  'Bookmark',
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
                          SizedBox(
                            height: 1.h,
                          ),
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
                    saveBookmark==null?Container():SizedBox(
                      height: 4.h,
                      width: 20.w,
                      child: DoneButton(
                        color: const Color(0xff213285),
                        txtColor: Colors.white,
                        txt: "Save",
                        onTap: () {
                          if (saveBookmark != null) {
                            saveBookmark!();
                          }
                        },
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
