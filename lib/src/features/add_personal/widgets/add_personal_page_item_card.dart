import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../models/personal_model.dart';

class PersonalPageItemCard extends StatelessWidget {
  const PersonalPageItemCard({
    super.key,
    required this.data,
    required this.index,
  });

  final Personal data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 1.5.h,
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  Constances.editIcon,
                ),
              ],
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
              height: 1.h,
            ),
            Text(
              data.title ?? "",
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontSize: 12.sp,
                    color: Colors.white54,
                    fontWeight: FontWeight.w500,
                    // fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                  ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              '${data.date} | ${data.time}',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontSize: 10.sp,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                    // fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
