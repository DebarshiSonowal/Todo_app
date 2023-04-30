import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';

class imageItem extends StatelessWidget {
  const imageItem({
    super.key,
    required this.image,
    required this.onTap,
    required this.text,
  });

  final String image, text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        children: [
          (image == null||image=="")
              ? Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.black87,
                    )
                  ),
                  padding: EdgeInsets.all(4.4.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      Constances.plusIcon,
                      color: Colors.red,
                      fit: BoxFit.cover,
                      height: 10.sp,
                      width: 10.sp,
                    ),
                  ),
                )
              : Image.file(
                  File(image),
                  fit: BoxFit.fill,
                  height: 6.h,
                  width: 13.w,
                ),
          SizedBox(
            width: 20.w,
            height: 3.h,
            child: Column(
              children: [
                Text(
                  text,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Colors.black,
                        fontSize: 10.sp,
                        fontFamily: "PublicSans",
                        // fontWeight: FontWeight.bold,
                        // fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
