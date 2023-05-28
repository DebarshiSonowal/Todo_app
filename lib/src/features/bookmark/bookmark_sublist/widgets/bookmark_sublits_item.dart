import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/routes.dart';
import '../../../../models/bookmark.dart';
import '../../../../repository/repository.dart';
import '../../../../services/Navigate.dart';

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
                    _launchUrl(Uri.parse(item.link ?? ""));
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
                GestureDetector(
                  onTap: () {
                    showPopupMenu(context);
                  },
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 18.sp,
                  ),
                ),
                SizedBox(
                  width: 2.5.w,
                ),
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

  void showPopupMenu(BuildContext context) async {
    // Define the popup menu items
    List<PopupMenuEntry<String>> items = [
      PopupMenuItem<String>(
        value: 'item1',
        padding: EdgeInsets.symmetric(horizontal:4.w,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              Constances.shareImage,
              color: Colors.white,
              fit: BoxFit.fitWidth,
              width: 4.5.w,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              "Share Via",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white70,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
      PopupMenuDivider(
        height: 1.h,
      ),
      PopupMenuItem<String>(
        value: 'item2',
        padding: EdgeInsets.symmetric(horizontal:4.w,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              Constances.deleteImage,
              color: Colors.white,
              fit: BoxFit.fitWidth,
              width: 4.5.w,
            ),
            SizedBox(
              width: 8.w,
            ),
            Row(
              children: [
                Text(
                  "Delete",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.red,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ];
    final RenderBox button = context.findRenderObject() as RenderBox;
    final Offset offset = button.localToGlobal(Offset.zero);
    const double menuOffset = 0; // Adjust the offset from the bottom
    String? selectedValue = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        250,
        offset.dy + button.size.height + menuOffset,
        offset.dx + button.size.width,
        offset.dy + button.size.height + menuOffset,
      ),
      // Adjust the position as per your requirement
      items: items,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 7,
      // color: const Color(0xff4f545d),
    );

    // Handle the selected menu item
    if (selectedValue != null) {
      // Perform actions based on the selected item
      switch (selectedValue) {
        case 'item1':
          // Handle item 1 selection
          break;
        case 'item2':
          // Handle item 2 selection
          if (!context.mounted) return;
          // Navigation.instance.goBack();
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
            // Navigation.instance.navigateAndRemoveUntil(Routes.dashboard);
          }
          // Navigation.instance.goBack();
          break;
      }
    }
  }
}
