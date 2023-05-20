import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/routes.dart';
import '../../../../models/bookmark.dart';
import '../../../../repository/repository.dart';
import '../../../../services/Navigate.dart';
import 'PopupMenu.dart';
import 'popup_bookmark_sublist_item.dart';

class BookmarkSublistItem extends StatelessWidget {
  const BookmarkSublistItem({
    super.key,
    required this.item,
    required this.index,
    required this.index2,
  });

  final BookmarkSubItem item;
  final int index, index2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Constances.blueBackground,
      child: Padding(
        padding: EdgeInsets.only(
          right: 2.w,
          left: 6.w,
          top: 1.h,
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigation.instance
                    .navigate(Routes.editBookmark, args: "$index,$index2");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 50.w,
                    child: Text(
                      item.title ?? "",
                      overflow: TextOverflow.ellipsis,
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 3.w,
                    ),
                    child: SvgPicture.asset(
                      Constances.editIcon,
                      color: Colors.white,
                      fit: BoxFit.fill,
                      height: 14.sp,
                      width: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _launchUrl(Uri.parse("https://${item.link ?? ""}"));
                  },
                  child: SizedBox(
                    width: 70.w,
                    child: Text(
                      item.link ?? "",
                      overflow: TextOverflow.clip,
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.white70,
                                fontSize: 12.sp,
                                decoration: TextDecoration.underline,
                              ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PopupMenuBookmarkSublistItem(index: index, item: item),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(_url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
