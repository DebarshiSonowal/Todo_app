import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/constants.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({
    super.key,
    required this.onTap,
    this.txt,
    this.color, this.txtColor,
  });

  final String? txt;
  final Function onTap;
  final Color? color,txtColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
            color: color ?? Constances.darkBlueBackground,
            borderRadius: const BorderRadius.all(Radius.circular(25))),

        width: 20.w, // <-- Your width
        // height: 2.h,
        padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.5.h),
        child: Center(
          child: Text(
            txt ?? 'Done',
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontSize: 13.sp,
                  color: txtColor?? Colors.white60,
                  fontFamily: "PublicSans",
                  // fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
