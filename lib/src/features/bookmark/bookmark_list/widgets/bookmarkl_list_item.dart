import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/routes.dart';
import '../../../../models/bookmark.dart';
import '../../../../repository/repository.dart';

class BookmarkListItem extends StatelessWidget {
  const BookmarkListItem({
    super.key,
    required this.bookmark,
    required this.index,
  });

  final Bookmark bookmark;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation.instance.navigate(Routes.bookmarkList, args: index);
      },
      child: Slidable(
        key: ValueKey(Random.secure().nextInt(1000).toString()),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              flex: 1,
              onPressed: (context) {
                Provider.of<Repository>(context,listen: false).deleteBookmark(bookmark);
                Fluttertoast.showToast(msg: "Removed Successfully");
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Constances.blueBackground,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 4.w,
          ),
          height: 10.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              (bookmark.image == null || bookmark.image == "")
                  ? Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: EdgeInsets.all(6.w),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          Constances.plusIcon,
                          color: Colors.red,
                          fit: BoxFit.cover,
                          height: 10.sp,
                          width: 10.sp,
                        ),
                      ),
                    )
                  : CircleAvatar(
                      radius: 24.sp, // Image radius
                      backgroundImage: Image.file(
                        File(bookmark.image ?? ""),
                        errorBuilder: (error, _, __) {
                          return Image.asset(bookmark.image ?? "");
                        },
                      ).image,
                    ),
              SizedBox(
                width: 5.w,
              ),
              SizedBox(
                width: 60.w,
                child: Text(
                  "${bookmark.title == null ? ((bookmark.items?.isEmpty ?? true) ? "" : (bookmark.items?.first.title ?? "")) : (bookmark.title == "" ? "Add File" : bookmark.title)}",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
