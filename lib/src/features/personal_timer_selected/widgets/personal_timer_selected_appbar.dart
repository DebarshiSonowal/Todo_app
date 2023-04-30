import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../services/Navigate.dart';

class PersonalTimerSelectedAppbar extends StatelessWidget {
  const PersonalTimerSelectedAppbar({Key? key, required this.showDelete}) : super(key: key);


  final bool showDelete;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 4.5.h,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigation.instance.goBack();
                },
                child: SizedBox(
                  child: showDelete
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Cancel',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(
                          fontSize: 13.sp,
                          color: Colors.white,
                          fontFamily: "PublicSans",
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                      : Row(
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
                          fontFamily: "PublicSans",
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              showDelete
                  ? GestureDetector(
                onTap: () {
                  Navigation.instance.goBack();
                },
                child: SizedBox(
                  child: Text(
                    'Delete',
                    style:
                    Theme.of(context).textTheme.headline4?.copyWith(
                      fontSize: 13.sp,
                      color: Colors.red,
                      fontFamily: "PublicSans",
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
                  : Container()
            ],
          ),
        ],
      ),
      // actions: [

      // ],
    );
  }
}
