import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PopUpBodyEssential extends StatelessWidget {
  const PopUpBodyEssential({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      width: 86.w,
      margin: EdgeInsets.only(
        top: 0.9.h,
        right: 0.5.w,
        bottom: 2.h,
      ),
      padding: EdgeInsets.all(8.5.w,),
      child: Container(
        // padding: EdgeInsets.only(
        //   right: 5.w,
        //   bottom: 4.h,
        // ),
        color: Colors.white,
        // height: 33.h,
        // width: 70.w,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: const Color(0xffccd3db),
              height: 7.h,
              padding: EdgeInsets.only(
                bottom: 1.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Essentials",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(
                      color: Colors.black,
                      fontFamily: "Roboto",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2.w,
              ),
              child: Divider(
                thickness: 0.05.h,
                color: Colors.black87,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 6.w,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Create and store what you like",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(
                        color: Colors.black,
                        fontSize: 11.sp,
                        fontFamily: "ABeeZee",
                      ),
                    ),
                    Text(
                      "to learn or boost up skills in",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(
                        color: Colors.black,
                        fontSize: 11.sp,
                        fontFamily: "ABeeZee",
                      ),
                    ),
                    Text(
                      "arranging of file folder",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(
                        color: Colors.black,
                        fontSize: 11.sp,
                        fontFamily: "ABeeZee",
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                          color: Colors.black,
                          fontSize: 11.sp,
                          fontFamily: "ABeeZee",
                        ),

                        children: <TextSpan>[
                          TextSpan(
                            text: "Ex -",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                              color: Colors.black,
                              fontSize: 11.sp,
                              fontFamily: "ABeeZee",
                            ),
                          ),
                          TextSpan(
                            text: "Groceries",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                              color: Colors.green,
                              fontSize: 11.sp,
                              fontFamily: "ABeeZee",
                            ),
                          ),
                          TextSpan(
                            text: "",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                              color: Colors.black,
                              fontSize: 11.sp,
                              fontFamily: "ABeeZee",
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                          color: Colors.black,
                          fontSize: 11.sp,
                          fontFamily: "ABeeZee",
                        ),

                        children: <TextSpan>[
                          TextSpan(
                            text: "Kitchen",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                              color: Colors.red,
                              fontSize: 11.sp,
                              fontFamily: "ABeeZee",
                            ),
                          ),
                          TextSpan(
                            text: ",",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                              color: Colors.black,
                              fontSize: 11.sp,
                              fontFamily: "ABeeZee",
                            ),
                          ),
                          TextSpan(
                            text: " Bathroom",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                              color: Colors.blue,
                              fontSize: 11.sp,
                              fontFamily: "ABeeZee",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: const Color(0xff3fcbd8),
              height: 6.5.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Have more ideas",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontFamily: "Roboto",
                    ),
                  ),
                  Text(
                    "keep adding!",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 2.5.h,
            ),
          ],
        ),
      ),
    );
  }
}