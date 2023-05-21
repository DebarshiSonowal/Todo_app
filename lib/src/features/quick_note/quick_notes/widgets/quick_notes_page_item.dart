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
          onLongPress: (){
            showPopupMenu(context);
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

        item.time!=""?Theme(
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
            icon: Image.asset(
              Constances.bellImage,
              color: const Color(0xffFFC700),
              height: 22.sp,
              width: 22.sp,
            ),
          ),
        ):Container()
      ],
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
              .deleteQuickNote(item);
          // Navigation.instance.goBack();
          break;
      }
    }
  }
}
