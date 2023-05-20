import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/routes.dart';
import '../../../../models/bookmark.dart';
import '../../../../repository/repository.dart';
import '../../../../services/Navigate.dart';

class PopupMenuBookmarkSublistItem extends StatelessWidget {
  const PopupMenuBookmarkSublistItem({
    super.key,
    required this.index,
    required this.item,
  });

  final int index;
  final BookmarkSubItem item;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerTheme: const DividerThemeData(
          color: Colors.white,
        ),
        // iconTheme: IconThemeData(color: Colors.white),
        // textTheme: TextTheme().apply(bodyColor: Colors.white),
      ),
      child: PopupMenuButton(
        splashRadius: 10.sp,
        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
          PopupMenuItem(
            height: 3.h,
            // padding: EdgeInsets.symmetric(
            //   horizontal: 2.w,
            //   vertical: 0.1.h,
            // ),
            value: 1,
            onTap: () {},
            child: Row(
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
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white70,
                    fontSize: 14.sp,
                  ),
                ),
              ],
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
            onTap: () {
              Navigation.instance.goBack();
              if ((Provider.of<Repository>(context, listen: false)
                  .bookmarks[index]
                  .items
                  ?.length ??
                  0) >
                  1) {
                Provider.of<Repository>(context, listen: false)
                    .deleteBookmarkItem(item, index);
              } else {
                Provider.of<Repository>(context, listen: false).deleteBookmark(
                    Provider.of<Repository>(context, listen: false)
                        .bookmarks[index]);
                Navigation.instance.navigateAndRemoveUntil(Routes.dashboard);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Constances.deleteImage,
                  color: Colors.white,
                  fit: BoxFit.fitWidth,
                  width: 6.w,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "Delete",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.red,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
        // onSelected: (int value) {},
        color: const Color(0xff50555d),
        icon: Icon(
          Icons.more_horiz,
          color: Colors.white,
          size: 18.sp,
        ),
      ),
    );
  }
}