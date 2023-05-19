import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RoutineItem extends StatelessWidget {
  const RoutineItem({
    super.key,
    required this.img,
    required this.txt,
    required this.type,
    required this.onTap,
  });

  final String img, txt;
  final int type;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 20.sp, // Image radius
                backgroundImage: img.contains("assets")
                    ? Image.asset(
                        img,
                        fit: BoxFit.fill,
                        height: type == 1 ? 6.h : 6.h,
                        width: type == 1 ? 11.w : 17.w,
                        errorBuilder: (error, str, _) {
                          return Image.file(
                            File(img),
                            fit: BoxFit.fill,
                            height: type == 1 ? 5.h : 8.h,
                            width: type == 1 ? 11.w : 17.w,
                          );
                        },
                      ).image
                    : Image.file(
                        File(img),
                        fit: BoxFit.fill,
                        height: type == 1 ? 6.h : 8.h,
                        width: type == 1 ? 11.w : 17.w,
                        errorBuilder: (error, str, _) {
                          return Image.asset(
                            img,
                            fit: BoxFit.fill,
                            height: type == 1 ? 5.h : 8.h,
                            width: type == 1 ? 11.w : 17.w,
                          );
                        },
                      ).image,
              ),
            ),
            SizedBox(
              width: 20.w,
              // height: type == 1 ? 3.h : 3.h,
              child: Column(
                children: [
                  Text(
                    txt,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: type == 1
                              ? Colors.black
                              : Theme.of(context).primaryColor,
                          overflow: TextOverflow.fade,
                          fontSize: type != 1 ? 12.sp : 10.sp,
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
      ),
    );
  }
}
