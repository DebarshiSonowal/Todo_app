import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/constants.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

class BookmarkPageInstructions extends StatelessWidget {
  const BookmarkPageInstructions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Align(
          alignment: Alignment.bottomRight,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                height: 39.h,
                width: 79.w,
                margin: EdgeInsets.only(
                  right: 1.w,
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
                              "Bookmark ideas",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: Colors.black,
                                    fontFamily: "Roboto",
                                    fontSize: 13.sp,
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
                                      fontSize: 9.sp,
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
                                      fontSize: 9.sp,
                                      fontFamily: "ABeeZee",
                                    ),
                              ),
                              Text(
                                "arrange of file folder",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Colors.black,
                                      fontSize: 9.sp,
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
                                        fontSize: 9.sp,
                                        fontFamily: "ABeeZee",
                                      ),

                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "Ex You can place-",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: Colors.black,
                                            fontSize: 9.sp,
                                            fontFamily: "ABeeZee",
                                          ),
                                    ),
                                    TextSpan(
                                      text: "Important links",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: Colors.green,
                                            fontSize: 9.sp,
                                            fontFamily: "ABeeZee",
                                          ),
                                    ),
                                    TextSpan(
                                      text: "/",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: Colors.black,
                                            fontSize: 9.sp,
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
                                        fontSize: 9.sp,
                                        fontFamily: "ABeeZee",
                                      ),

                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "website",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: Colors.red,
                                            fontSize: 9.sp,
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
                                            fontSize: 9.sp,
                                            fontFamily: "ABeeZee",
                                          ),
                                    ),
                                    TextSpan(
                                      text: " shortcut",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: Colors.blue,
                                            fontSize: 9.sp,
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
                                    fontFamily: "Roboto",
                                  ),
                            ),
                            Text(
                              "keep adding",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: Colors.black,
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
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 48.w,
                  bottom: 2.h,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigation.instance.goBack();
                  },
                  icon: Image.asset(
                    Constances.cancelImage,
                    color: Colors.black,
                    scale: 10,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
