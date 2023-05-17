import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';

class BookmarkAddListItem extends StatelessWidget {
  const BookmarkAddListItem({
    super.key,
    required this.onTap,
  });

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          color: Constances.blueBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
        ),
        height: 10.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                Constances.customCameraImage,
                // color: Colors.white38,
                fit: BoxFit.cover,
                height: 50.sp,
                width: 50.sp,
              ),
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              "Add File",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}