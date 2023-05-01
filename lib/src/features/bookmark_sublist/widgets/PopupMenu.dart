import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import '../../../constants/constants.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
         decoration: BoxDecoration(
           color: Constances.blueBackground,
           borderRadius: BorderRadius.circular(15),
         ),
          height: 12.h,
          width: 40.w,
          margin: EdgeInsets.only(
            right: 1.w,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 3.w,
            vertical: 1.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigation.instance.goBack();
                },
                child: Row(
                  children: [
                    Image.asset(
                      Constances.shareImage,
                      color: Colors.white,
                      fit: BoxFit.fitWidth,
                      width: 7.w,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      "Share Via",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.white70,
                                fontSize: 12.sp,
                              ),
                    ),
                  ],
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: () {
                  Navigation.instance.goBack();
                },
                child: Row(
                  children: [
                    Image.asset(
                      Constances.deleteImage,
                      color: Colors.white,
                      fit: BoxFit.fitWidth,
                      width: 7.w,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      "Delete",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.red,
                                fontSize: 12.sp,
                              ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
