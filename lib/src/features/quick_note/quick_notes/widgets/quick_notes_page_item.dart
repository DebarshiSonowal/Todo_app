import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/models/quick_note.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/routes.dart';
import '../../../../repository/repository.dart';
import '../../../../services/Navigate.dart';

class QuickNotePageItem extends StatelessWidget {
  const QuickNotePageItem({
    super.key,
    required this.item,
    required this.index,
  });

  final QuickNote item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        GestureDetector(
          onTap: () {
            Navigation.instance.navigate(Routes.editQuickNotes, args: index);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Constances.essentialItemColor,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 1.h,
                horizontal: 2.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${item.date}",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                          fontFamily: "Rubik",
                        ),
                  ),
                  Divider(
                    thickness: 0.03.h,
                    color: Colors.black87,
                  ),
                  Text(
                    "${item.description}",
                    maxLines: 9,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black, fontFamily: "PublicSans"),
                  ),
                ],
              ),
            ),
          ),
        ),
        // FocusedMenuHolder(
        //   blurSize: 0,
        //   menuItemExtent: 6.h,
        //   menuWidth: 40.w,
        //   menuBoxDecoration: BoxDecoration(
        //     // border: Border.all(
        //     //   width: 0.04.h,
        //     //   // assign the color to the border color
        //     //   color: Colors.white,
        //     // ),
        //     borderRadius: BorderRadius.circular(50),
        //   ),
        //   duration: const Duration(milliseconds: 100),
        //   animateMenuItems: true,
        //   blurBackgroundColor: Colors.transparent,
        //   openWithTap: true,
        //   // Open Focused-Menu on Tap rather than Long Press
        //   menuOffset: 10.0,
        //
        //   // Offset value to show menuItem from the selected item
        //   bottomOffsetHeight: 2.0,
        //   // Offset hei
        //   onPressed: () {},
        //   menuItems: [
        //     // Add Each FocusedMenuItem  for Menu Options
        //     FocusedMenuItem(
        //       backgroundColor: const Color(0xff50555c),
        //       title: Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Image.asset(
        //             Constances.shareImage,
        //             color: Colors.white,
        //             fit: BoxFit.fitWidth,
        //             width: 6.w,
        //           ),
        //           SizedBox(
        //             width: 5.w,
        //           ),
        //           Text(
        //             "Share Via",
        //             style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        //                   color: Colors.white70,
        //                   fontSize: 14.sp,
        //                 ),
        //           ),
        //         ],
        //       ),
        //       onPressed: () {
        //         Navigation.instance.goBack();
        //       },
        //     ),
        //     FocusedMenuItem(
        //       backgroundColor: const Color(0xff50555c),
        //       title: Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Image.asset(
        //             Constances.deleteImage,
        //             color: Colors.white,
        //             fit: BoxFit.fitWidth,
        //             width: 6.w,
        //           ),
        //           SizedBox(
        //             width: 5.w,
        //           ),
        //           Text(
        //             "Delete",
        //             style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        //                   color: Colors.red,
        //                   fontSize: 14.sp,
        //                 ),
        //           ),
        //         ],
        //       ),
        //       onPressed: () {
        //         Navigation.instance.goBack();
        //         Provider.of<Repository>(context, listen: false)
        //             .deleteQuickNote(item);
        //         if (Provider.of<Repository>(context, listen: false)
        //             .quickNotes
        //             .isEmpty) {
        //           Navigation.instance.navigateAndRemoveUntil(Routes.dashboard);
        //         }
        //       },
        //     ),
        //   ],
        //   child: Container(
        //     margin: EdgeInsets.only(
        //       right: 2.w,
        //       top: 0.5.h,
        //     ),
        //     child: Icon(
        //       Icons.more_horiz,
        //       color: Colors.white,
        //       size: 22.sp,
        //     ),
        //   ),
        // )
        Theme(
          data: Theme.of(context).copyWith(
            dividerTheme: const DividerThemeData(
              color: Colors.white,
            ),
            // iconTheme: IconThemeData(color: Colors.white),
            // textTheme: TextTheme().apply(bodyColor: Colors.white),
          ),
          child: PopupMenuButton(
            offset: const Offset(
              0,
              4,
            ),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                value: 1,
                onTap: () {},
                child: Row(
                  children: [
                    Image.asset(
                      Constances.shareImage,
                      color: Colors.white,
                      fit: BoxFit.fitWidth,
                      width: 6.w,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      "Share Via",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
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
              // PopupMenuItem(
              //   value: 2,
              //   onTap: () {},
              //   child: Row(
              //     children: [
              //       Image.asset(
              //         Constances.shareImage,
              //         color: Colors.white,
              //         fit: BoxFit.fitWidth,
              //         width: 6.w,
              //       ),
              //       SizedBox(
              //         width: 2.w,
              //       ),
              //       Text(
              //         "Share Via",
              //         style:
              //             Theme.of(context).textTheme.headlineSmall?.copyWith(
              //                   color: Colors.white70,
              //                   fontSize: 14.sp,
              //                 ),
              //       ),
              //     ],
              //   ),
              // ),
              // PopupMenuDivider(
              //   height: 2.5.h,
              // ),
              PopupMenuItem(
                onTap: () {
                  Navigation.instance.goBack();
                  Provider.of<Repository>(context, listen: false)
                      .deleteQuickNote(item);
                  if (Provider.of<Repository>(context, listen: false)
                      .quickNotes
                      .isEmpty) {
                    Navigation.instance
                        .navigateAndRemoveUntil(Routes.dashboard);
                  }
                },
                value: 3,
                child: Row(
                  children: [
                    Image.asset(
                      Constances.deleteImage,
                      color: Colors.white,
                      fit: BoxFit.fitWidth,
                      width: 6.w,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      "Delete",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.red,
                                fontSize: 14.sp,
                              ),
                    ),
                  ],
                ),
              ),
            ],
            // onSelected: (int value) {},
            color: Color(0xff50555d),
            icon: Icon(
              Icons.more_horiz,
              color: Colors.white,
              size: 22.sp,
            ),
          ),
        )
      ],
    );
  }
}
