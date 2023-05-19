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
                    padding: EdgeInsets.only(right:3.w,),
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
                Theme(
                  data: Theme.of(context).copyWith(
                    dividerTheme: const DividerThemeData(
                      color: Colors.white,
                    ),
                    // iconTheme: IconThemeData(color: Colors.white),
                    // textTheme: TextTheme().apply(bodyColor: Colors.white),
                  ),
                  child: PopupMenuButton(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
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
                            Provider.of<Repository>(context, listen: false)
                                .deleteBookmark(
                                    Provider.of<Repository>(context, listen: false)
                                        .bookmarks[index]);
                            Navigation.instance
                                .navigateAndRemoveUntil(Routes.dashboard);
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
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
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
                    icon: const Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: const [
            //     Icon(Icons.more_horiz),
            //   ],
            // )
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
// void showSpecialDialog(context) {
//   showGeneralDialog(
//     barrierLabel: "Label",
//     barrierDismissible: true,
//     // barrierColor: Colors.black.withOpacity(0.5),
//     transitionDuration: const Duration(milliseconds: 1),
//     context: context,
//     pageBuilder: (context, anim1, anim2) {
//       return const PopupMenu();
//     },
//     transitionBuilder: (context, anim1, anim2, child) {
//       return SlideTransition(
//         position:
//             Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
//         child: child,
//       );
//     },
//   );
//   // showCupertinoModalPopup<void>(
//   //   context: context,
//   //   builder: (BuildContext context) {
//   //     return Theme(
//   //       data: ThemeData.dark(),
//   //       child: CupertinoActionSheet(
//   //         // title: const Text('Title'),
//   //         // message: const Text('Message'),
//   //         actions: <CupertinoActionSheetAction>[
//   //           CupertinoActionSheetAction(
//   //             isDefaultAction: true,
//   //             onPressed: () {
//   //               Navigator.pop(context);
//   //             },
//   //             child:
//   //             Row(
//   //               children: [
//   //                 Image.asset(
//   //                   Constances.shareImage,
//   //                   color: Colors.white,
//   //                   scale: 14,
//   //                 ),
//   //                 SizedBox(
//   //                   width: 4.w,
//   //                 ),
//   //                 Text(
//   //                   "Share Via",
//   //                   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//   //                     color: Colors.white70,
//   //                     fontSize: 12.sp,
//   //                   ),
//   //                 ),
//   //               ],
//   //             ),
//   //           ),
//   //           CupertinoActionSheetAction(
//   //             onPressed: () {
//   //               Navigator.pop(context);
//   //             },
//   //             child:
//   //             Row(
//   //               children: [
//   //                 Image.asset(
//   //                   Constances.trashIcon,
//   //                   color: Colors.white,
//   //                 ),
//   //                 SizedBox(
//   //                   width: 4.w,
//   //                 ),
//   //                 Text(
//   //                   "Delete",
//   //                   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//   //                     color: Colors.red,
//   //                     fontSize: 12.sp,
//   //                   ),
//   //                 ),
//   //               ],
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //     );
//   //   },
//   // );
//   // showCupertinoDialog(
//   //   context: context,
//   //   builder: (context) => Align(
//   //     alignment: Alignment.centerRight,
//   //     child: Theme(
//   //       data: ThemeData.dark(),
//   //       child: CupertinoAlertDialog(
//   //         // title: Text(title),
//   //         // content: Text(content),
//   //         actions: <Widget>[
//   //           CupertinoDialogAction(
//   //             child: Row(
//   //               mainAxisAlignment: MainAxisAlignment.center,
//   //               children: [
//   //                 Image.asset(
//   //                   Constances.shareImage,
//   //                   color: Colors.white,
//   //                   fit: BoxFit.fitWidth,
//   //                   width: 12.w,
//   //                 ),
//   //                 SizedBox(
//   //                   width: 5.w,
//   //                 ),
//   //                 Text(
//   //                   "Share Via",
//   //                   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//   //                         color: Colors.white70,
//   //                         fontSize: 16.sp,
//   //                       ),
//   //                 ),
//   //               ],
//   //             ),
//   //             onPressed: () => Navigator.of(context).pop(false),
//   //           ),
//   //           CupertinoDialogAction(
//   //             child: Row(
//   //               mainAxisAlignment: MainAxisAlignment.center,
//   //               children: [
//   //                 Image.asset(
//   //                   Constances.deleteImage,
//   //                   color: Colors.white,
//   //                   fit: BoxFit.fitWidth,
//   //                   width: 12.w,
//   //                 ),
//   //                 SizedBox(
//   //                   width: 5.w,
//   //                 ),
//   //                 Text(
//   //                   "Delete",
//   //                   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//   //                         color: Colors.red,
//   //                         fontSize: 16.sp,
//   //                       ),
//   //                 ),
//   //               ],
//   //             ),
//   //             onPressed: () => Navigator.of(context).pop(false),
//   //           ),
//   //         ],
//   //       ),
//   //     ),
//   //   ),
//   // );
// }
}
