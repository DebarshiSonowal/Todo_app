import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/constants.dart';

class AmPmSwitch extends StatelessWidget {
  const AmPmSwitch({
    super.key,
    required this.value,
    required this.text,
  });

  final bool value;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          // color: value ? null : const Color(0xff596077),
          //1f253b
          gradient: value ? Constances.AmPmSwitchGradient : null,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          // shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontSize: 14.sp,
                  color: Colors.white,
                  fontFamily: "RobotoFlex",
                  // fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
