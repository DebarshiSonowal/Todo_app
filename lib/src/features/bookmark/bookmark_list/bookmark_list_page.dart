import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/constants.dart';
import 'package:vishal_todo_app/src/models/bookmark.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import '../../../constants/routes.dart';
import '../../../widget/add_button.dart';
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
        preferredSize: Size.fromHeight(9.h),
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
                    return (data.bookmarks.isEmpty && index == 0)
                        ? BookmarkAddListItem(
                            onTap: () {
                              Navigation.instance.navigate(Routes.addBookmark);
                            },
                          )
                        : BookmarkListItem(
                            bookmark: data.bookmarks[index],
                            index: index,
                          );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 1.h,
                    );
                  },
                  itemCount: data.bookmarks.isEmpty ? 1 : data.bookmarks.length,
                );
              }),
            ),
            Container(
              margin: EdgeInsets.only(right: 2.w,bottom: 1.h,),
              child: AddButton(
                onTap: () {
                  Navigation.instance.navigate(Routes.addBookmark);
                },
              ),
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
    showDialog(
      useRootNavigator: true,
      barrierLabel: "ads",
      barrierDismissible: true,
      // barrierColor: Colors.black.withOpacity(0.5),
      // transitionDuration: const Duration(milliseconds: 1),
      context: context,

      builder: (BuildContext context) {
        return const BookmarkPageInstructions();
      },
    );
  }
}
