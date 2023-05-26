import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/routes.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';

import '../../../../constants/constants.dart';
import '../../../../models/essential_note.dart';
import '../../../../services/Navigate.dart';

class EssentialDetailsAppbar extends StatelessWidget {
  const EssentialDetailsAppbar({
    super.key,
    required this.index,
    required this.item,
  });

  final int index;
  final EssentialNotes item;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 1.h, right: 2.w, left: 2.w),
          color: Theme.of(context).primaryColor,
          child: Column(
            children: [
              Text(
                ''
                'Essential',
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      fontSize: 15.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      // fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 20.w,
                    // height: 8.h,
                    child: Column(
                      children: [
                        // SizedBox(
                        //   height: 1.h,
                        // ),
                        GestureDetector(
                          onTap: () {
                            Navigation.instance.goBack();
                          },
                          child: SizedBox(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 16.sp,
                                ),
                                Text(
                                  'Back',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      ?.copyWith(
                                        fontSize: 11.2.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        // fontWeight: FontWeight.bold,
                                        fontFamily: "Roboto",
                                        // fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                    // width: 20.w,
                    child: GestureDetector(
                      onTap: () {
                        showPopupMenu(context);
                      },
                      child: const Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showPopupMenu(BuildContext context) async {
    // Define the popup menu items
    List<PopupMenuEntry<String>> items = [
      PopupMenuItem<String>(
        value: 'item1',
        padding: EdgeInsets.symmetric(horizontal: 4.w,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              Constances.shareImage,
              color: Colors.white,
              fit: BoxFit.fitWidth,
              width: 7.w,
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              "Share Via",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white70,
                    fontSize: 10.sp,
                  ),
            ),
          ],
        ),
      ),
      PopupMenuDivider(
        height: 0.5.h,
      ),
      PopupMenuItem<String>(
        value: 'item2',
        padding: EdgeInsets.symmetric(horizontal: 4.w,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              Constances.deleteImage,
              color: Colors.white,
              fit: BoxFit.fitWidth,
              width: 7.w,
            ),
            SizedBox(
              width: 2.w,
            ),
            Row(
              children: [
                Text(
                  "Delete",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.red,
                        fontSize: 10.sp,
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
    );

    // Handle the selected menu item
    if (selectedValue != null) {
      // Perform actions based on the selected item
      switch (selectedValue) {
        case 'item1':
          Navigation.instance.goBack();
          break;
        case 'item2':
          // Handle item 2 selection
          if (!context.mounted) return;
          Provider.of<Repository>(context, listen: false).removeEssential(item);
          Navigation.instance.navigateAndRemoveUntil(Routes.dashboard);
          break;
      }
    }
  }
}
