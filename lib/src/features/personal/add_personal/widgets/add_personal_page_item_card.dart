import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/models/daily_routine_model.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/routes.dart';
import '../../../../models/personal_model.dart';
import '../../../../widget/personal_date_viewer_daily.dart';
import '../../../daily_routine/view_daily_routine/widgets/date_viewer_daily.dart';

class PersonalPageItemCard extends StatelessWidget {
  const PersonalPageItemCard({
    super.key,
    required this.data,
    required this.index,
  });

  final DailyRoutineModel data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigation.instance.navigate(Routes.editPersonalInfo,args: index);
        Navigation.instance.navigate(Routes.personalDetails, args: index);
      },
      onLongPress: () {
        showPopupMenu(context);
      },
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 1.h,
            horizontal: 3.w,
          ),
          decoration: const BoxDecoration(
            color: Constances.bottomBarColor,
            // border: Border.all(),
            borderRadius: BorderRadius.all(Radius.circular(25)),
            // shape: BoxShape.circle,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Provider.of<Repository>(context, listen: false)
                          .removePersonal(index);
                      Navigation.instance.goBack();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 1.w,
                        vertical: 0.2.h,
                      ),
                      child: Image.asset(
                        Constances.deleteImage,
                        scale: 28,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigation.instance
                          .navigate(Routes.editPersonalInfo, args: index);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 1.w,
                        vertical: 0.2.h,
                      ),
                      child: SvgPicture.asset(
                        Constances.editIcon,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 0.5.h,
              ),
              data.image == null
                  ? SvgPicture.asset(
                      height: 55.sp,
                      width: 65.sp,
                      Constances.addImageIcon,
                      color: Colors.grey[400],
                      fit: BoxFit.fill,
                    )
                  : ClipOval(
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(30.sp), //
                        child: Image.file(
                          File(data.image!),
                          fit: BoxFit.fill,
                          height: 55.sp,
                          width: 65.sp,
                        ),
                      ),
                    ),
              SizedBox(
                height: 0.5.h,
              ),
              Text(
                data.title ?? "",
                maxLines: 1,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      fontSize: 12.5.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      // fontWeight: FontWeight.bold,
                      fontFamily: "RobotoFlex",
                    ),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              SizedBox(
                width: 40.w,
                child: Center(
                  child: Text(
                    DateFormat("dd MMM yyyy | HH:mm a").format(data.dateTime!),
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontSize: 9.5.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          // fontWeight: FontWeight.bold,
                          fontFamily: "Rubik",
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              SizedBox(
                height: 3.h,
                width: double.infinity,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  // padding: EdgeInsets.symmetric(
                  //   horizontal: 1.w,
                  // ),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return PersonalDateViewerDaily(
                      index: index,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 1.5.w,
                    );
                  },
                  itemCount: 7,
                ),
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
              .removePersonal(index);
          Navigation.instance.goBack();
          break;
      }
    }
  }
}
