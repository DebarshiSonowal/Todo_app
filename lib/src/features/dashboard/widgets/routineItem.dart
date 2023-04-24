import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class routineItem extends StatelessWidget {
  const routineItem({
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 21, // Image radius
            backgroundImage: type != 1
                ? Image.asset(
                    img,
                    fit: BoxFit.fill,
                    height: type == 1 ? 5.h : 8.h,
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
                    height: type == 1 ? 5.h : 8.h,
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
          // SizedBox(
          //   width: 20.w,
          //   child: Center(
          //     child: Image.file(
          //       File(img),
          //       fit: BoxFit.fill,
          //       height: type == 1 ? 5.h : 8.h,
          //       width: type == 1 ? 11.w : 17.w,
          //       errorBuilder: (error,str,_){
          //         return Image.asset(
          //           img,
          //           fit: BoxFit.fill,
          //           height: type == 1 ? 5.h : 8.h,
          //           width: type == 1 ? 11.w : 17.w,
          //         );
          //       },
          //     ),
          //   ),
          // ),
          SizedBox(
            width: type == 1 ? 20.w : 25.w,
            height: type == 1 ? 5.h : 3.h,
            child: Column(
              children: [
                Text(
                  txt,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: type == 1
                            ? Colors.black
                            : Theme.of(context).primaryColor,
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
    );
  }
}
