import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/constants.dart';
import 'package:vishal_todo_app/src/models/bookmark.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import '../../constants/routes.dart';
import '../../widget/add_button.dart';
import 'widgets/bookmark_add_list_item.dart';
import 'widgets/bookmark_appbar.dart';
import 'widgets/bookmark_page_instructions.dart';
import 'widgets/bookmarkl_list_item.dart';

class BookmarkListPage extends StatefulWidget {
  const BookmarkListPage({Key? key}) : super(key: key);

  @override
  State<BookmarkListPage> createState() => _BookmarkListPageState();
}

class _BookmarkListPageState extends State<BookmarkListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(7.5.h),
        child: const BookmarkAppbar(),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: 1.h,
                horizontal: 2.w,
              ),
              child: Consumer<Repository>(builder: (context, data, _) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return (data.bookmarks.isEmpty || index == 0)
                        ? BookmarkAddListItem(
                            onTap: () {
                              Navigation.instance.navigate(Routes.addBookmark);
                            },
                          )
                        : BookmarkListItem(
                            bookmark: data.bookmarks[index - 1],
                            index: index - 1,
                          );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 1.h,
                    );
                  },
                  itemCount: data.bookmarks.length + 1,
                );
              }),
            ),
            AddButton(
              onTap: () {
                Navigation.instance.navigate(Routes.addBookmark);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () {
      showMyDialog(context);
    });
  }

  void showMyDialog(BuildContext context) {
    // showDialog(
    //     barrierDismissible: true,
    //     context: context,
    //     builder: (BuildContext context) {
    //       return const BookmarkPageInstructions();
    //     });
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      // barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 1),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Material(
          color: Colors.transparent,
          child: Align(
              alignment: Alignment.bottomRight,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      right: 5.w,
                      bottom: 4.h,
                    ),
                    color: Colors.white,
                    height: 35.h,
                    width: 60.w,
                    child: Column(
                      children: [
                        Container(
                          color: const Color(0xffccd3db),
                          height: 7.h,
                          child: Center(
                            child: Text(
                              "Bookmark ideas",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                color: Colors.black,
                                fontFamily: "Roboto",
                              ),
                            ),
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
                              horizontal: 2.w,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Create and store what you like \n to learn"
                                      " or boost up skills in\n arrange of file folder",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                    fontFamily: "Roboto",
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
                                      fontSize: 10.sp,
                                      fontFamily: "Roboto",
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                        "Ex You can place-",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                          color: Colors.black,
                                          fontSize: 10.sp,
                                          fontFamily: "Roboto",
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                        "Important links",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                          color: Colors.green,
                                          fontSize: 10.sp,
                                          fontFamily: "Roboto",
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                        "/",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                          color: Colors.black,
                                          fontSize: 10.sp,
                                          fontFamily: "Roboto",
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                        "website",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                          color: Colors.red,
                                          fontSize: 10.sp,
                                          fontFamily: "Roboto",
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                        ",",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                          color: Colors.black,
                                          fontSize: 10.sp,
                                          fontFamily: "Roboto",
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                        " shortcut",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                          color: Colors.red,
                                          fontSize: 10.sp,
                                          fontFamily: "Roboto",
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          color: const Color(0xff3fcbd8),
                          height: 7.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Have more ideas\nkeep adding",
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
                      ],
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
                      icon: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              )),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
  }
}
