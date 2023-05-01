import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../constants/routes.dart';
import '../../../models/bookmark.dart';
import '../../../repository/repository.dart';
import '../../../services/Navigate.dart';
import 'PopupMenu.dart';

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
    return FocusedMenuHolder(
      blurSize: 0,
      menuItemExtent: 6.h,
      menuWidth: 50.w,
      menuBoxDecoration: BoxDecoration(
        // border: Border.all(
        //   width: 0.04.h,
        //   // assign the color to the border color
        //   color: Colors.white,
        // ),
        borderRadius: BorderRadius.circular(50),
      ),
      duration: const Duration(milliseconds: 100),
      animateMenuItems: true,
      blurBackgroundColor: Colors.transparent,
      openWithTap: true,
      // Open Focused-Menu on Tap rather than Long Press
      menuOffset: 10.0,

      // Offset value to show menuItem from the selected item
      bottomOffsetHeight: 2.0,
      // Offset hei
      onPressed: () {},
      menuItems: [
        // Add Each FocusedMenuItem  for Menu Options
        FocusedMenuItem(
          backgroundColor: const Color(0xff50555c),
          title: Row(
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
          onPressed: () {
            Navigation.instance.goBack();
          },
        ),
        FocusedMenuItem(
          backgroundColor: const Color(0xff50555c),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Constances.deleteImage,
                color: Colors.white,
                fit: BoxFit.fitWidth,
                width: 6.w,
              ),
              SizedBox(
                width: 5.w,
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
          onPressed: () {
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
        ),
      ],
      child: Container(
        width: double.infinity,
        color: Constances.blueBackground,
        child: Padding(
          padding: EdgeInsets.only(
            right: 6.w,
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
                    Text(
                      item.title ?? "",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                    ),
                    SvgPicture.asset(
                      Constances.editIcon,
                      color: Colors.white,
                      fit: BoxFit.fill,
                      height: 14.sp,
                      width: 14.sp,
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
                  SizedBox(
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
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(Icons.more_horiz),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void showSpecialDialog(context) {
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      // barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 1),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return const PopupMenu();
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
    // showCupertinoModalPopup<void>(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return Theme(
    //       data: ThemeData.dark(),
    //       child: CupertinoActionSheet(
    //         // title: const Text('Title'),
    //         // message: const Text('Message'),
    //         actions: <CupertinoActionSheetAction>[
    //           CupertinoActionSheetAction(
    //             isDefaultAction: true,
    //             onPressed: () {
    //               Navigator.pop(context);
    //             },
    //             child:
    //             Row(
    //               children: [
    //                 Image.asset(
    //                   Constances.shareImage,
    //                   color: Colors.white,
    //                   scale: 14,
    //                 ),
    //                 SizedBox(
    //                   width: 4.w,
    //                 ),
    //                 Text(
    //                   "Share Via",
    //                   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
    //                     color: Colors.white70,
    //                     fontSize: 12.sp,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           CupertinoActionSheetAction(
    //             onPressed: () {
    //               Navigator.pop(context);
    //             },
    //             child:
    //             Row(
    //               children: [
    //                 Image.asset(
    //                   Constances.trashIcon,
    //                   color: Colors.white,
    //                 ),
    //                 SizedBox(
    //                   width: 4.w,
    //                 ),
    //                 Text(
    //                   "Delete",
    //                   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
    //                     color: Colors.red,
    //                     fontSize: 12.sp,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
    // showCupertinoDialog(
    //   context: context,
    //   builder: (context) => Align(
    //     alignment: Alignment.centerRight,
    //     child: Theme(
    //       data: ThemeData.dark(),
    //       child: CupertinoAlertDialog(
    //         // title: Text(title),
    //         // content: Text(content),
    //         actions: <Widget>[
    //           CupertinoDialogAction(
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Image.asset(
    //                   Constances.shareImage,
    //                   color: Colors.white,
    //                   fit: BoxFit.fitWidth,
    //                   width: 12.w,
    //                 ),
    //                 SizedBox(
    //                   width: 5.w,
    //                 ),
    //                 Text(
    //                   "Share Via",
    //                   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
    //                         color: Colors.white70,
    //                         fontSize: 16.sp,
    //                       ),
    //                 ),
    //               ],
    //             ),
    //             onPressed: () => Navigator.of(context).pop(false),
    //           ),
    //           CupertinoDialogAction(
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Image.asset(
    //                   Constances.deleteImage,
    //                   color: Colors.white,
    //                   fit: BoxFit.fitWidth,
    //                   width: 12.w,
    //                 ),
    //                 SizedBox(
    //                   width: 5.w,
    //                 ),
    //                 Text(
    //                   "Delete",
    //                   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
    //                         color: Colors.red,
    //                         fontSize: 16.sp,
    //                       ),
    //                 ),
    //               ],
    //             ),
    //             onPressed: () => Navigator.of(context).pop(false),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
