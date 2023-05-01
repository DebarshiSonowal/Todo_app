import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/constants.dart';
import 'package:vishal_todo_app/src/models/bookmark.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import '../../constants/routes.dart';
import '../../widget/add_image_bookmark.dart';
import '../bookmark_list/widgets/bookmark_appbar.dart';
import 'widgets/bookmark_sublits_item.dart';
import 'widgets/header_bookmark_sublist.dart';

class BookmarkSublistPage extends StatefulWidget {
  const BookmarkSublistPage({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<BookmarkSublistPage> createState() => _BookmarkSublistPageState();
}

class _BookmarkSublistPageState extends State<BookmarkSublistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(7.5.h),
        child: const BookmarkAppbar(),
      ),
      // backgroundColor: Constances.blueBackground,
      body: Container(
        color: Constances.blueBackground,
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 1.h,
          horizontal: 1.w,
        ),
        child: Consumer<Repository>(builder: (context, data, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeaderBookmarkSublist(
                index: widget.index,
              ),
              Divider(
                thickness: 0.04.h,
                color: Colors.white54,
              ),
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var item = data.bookmarks[widget.index].items![index];
                  return BookmarkSublistItem(
                    item: item,
                    index: widget.index,
                    index2: index,
                  );
                },
                separatorBuilder: (context, index) {
                  return    Divider(
                    thickness: 0.04.h,
                    color: Colors.white54,
                  );
                },
                itemCount: data.bookmarks[widget.index].items?.length ?? 0,
              ),
              Divider(
                thickness: 0.04.h,
                color: Colors.white54,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigation.instance.navigate(
                          Routes.addBookmarkSubItem,
                          args: widget.index,
                        );
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 18.sp,
                      )),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}


