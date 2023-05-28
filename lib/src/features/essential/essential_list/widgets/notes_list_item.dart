import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/routes.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import '../../../../constants/constants.dart';
import '../../../../models/essential_note.dart';
import '../../../../repository/repository.dart';

class NotesListItem extends StatelessWidget {
  const NotesListItem({
    super.key,
    required this.item, required this.index,
  });

  final EssentialNotes item;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.white,

      ),
      child:
      FocusedMenuHolder(
        menuWidth: 37.w,
        blurSize: 1.0,
        menuItemExtent: 44,
        menuBoxDecoration: const BoxDecoration(
          color: Color(0xff4f545d),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        duration: const Duration(milliseconds: 100),
        animateMenuItems: true,
        blurBackgroundColor: Colors.transparent,
        openWithTap: false,
        // borderColor: Color(0xff4f545d),
        // Open Focused-Menu on Tap rather than Long Press
        menuOffset: 10.0,
        // Offset value to show menuItem from the selected item
        bottomOffsetHeight: 80.0,

        // Offset height to consider, for showing the menu item ( for example bottom navigation bar), so that the popup menu will be shown on top of selected item.
        menuItems:[
          // Add Each FocusedMenuItem  for Menu Options
          FocusedMenuItem(
              backgroundColor: const Color(0xff4f545d),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 1.w,
                  ),
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
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white70,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
              onPressed: () {}),

          FocusedMenuItem(
              backgroundColor: const Color(0xff4f545d),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 1.w,
                  ),
                  Image.asset(
                    Constances.deleteImage,
                    color: Colors.white,
                    fit: BoxFit.fitWidth,
                    width: 6.w,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Row(
                    children: [
                      Text(
                        "Delete",
                        style:
                        Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.red,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              onPressed: () {
                Navigation.instance.navigate(Routes.essentialsDetails,args: index);
                // Navigation.instance.goBack();
              }),
        ],
        onPressed: () {
          Navigation.instance.navigate(Routes.essentialsDetails,args: index);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Constances.essentialItemColor,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 1.h,
            ),
            child: Column(
              children: [
                Text(
                  "${item.date}",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black,
                  ),
                ),
                Divider(
                  thickness: 0.03.h,
                  color: Colors.black87,
                ),
                ListView.separated(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.5.w,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var current = item.notes[index];
                    return Text(
                      "${index + 1}. ${current.title}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black,
                        fontSize: 13.sp,

                      ),
                    );
                  },
                  itemCount: item.notes.length > 5 ? 5 : item.notes.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 1.h,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // return GestureDetector(
    //   onTap: (){
    //     Navigation.instance.navigate(Routes.essentialsDetails,args: index);
    //   },
    //   // onLongPress: (){
    //   //   showPopupMenu(context);
    //   // },
    //   child: Card(
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(20),
    //     ),
    //     child: Container(
    //       decoration: BoxDecoration(
    //         color: Constances.essentialItemColor,
    //         borderRadius: BorderRadius.circular(20),
    //       ),
    //       padding: EdgeInsets.symmetric(
    //         vertical: 1.h,
    //       ),
    //       child: Column(
    //         children: [
    //           Text(
    //             "${item.date}",
    //             style: Theme.of(context).textTheme.bodyMedium?.copyWith(
    //               color: Colors.black,
    //             ),
    //           ),
    //           Divider(
    //             thickness: 0.03.h,
    //             color: Colors.black87,
    //           ),
    //           ListView.separated(
    //             padding: EdgeInsets.symmetric(
    //               horizontal: 2.5.w,
    //             ),
    //             physics: const NeverScrollableScrollPhysics(),
    //             shrinkWrap: true,
    //             itemBuilder: (context, index) {
    //               var current = item.notes[index];
    //               return Text(
    //                 "${index + 1}. ${current.title}",
    //                 overflow: TextOverflow.ellipsis,
    //                 maxLines: 1,
    //                 style: Theme.of(context).textTheme.bodyMedium?.copyWith(
    //                   color: Colors.black,
    //                   fontSize: 13.sp,
    //
    //                 ),
    //               );
    //             },
    //             itemCount: item.notes.length > 5 ? 5 : item.notes.length,
    //             separatorBuilder: (BuildContext context, int index) {
    //               return SizedBox(
    //                 height: 1.h,
    //               );
    //             },
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
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
        offset.dx,
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
        // Handle item 1 selection
          break;
        case 'item2':
        // Handle item 2 selection
          if(!context.mounted)return;
          Provider.of<Repository>(context, listen: false)
              .removeEssential(item);
          break;
      }
    }
  }
}