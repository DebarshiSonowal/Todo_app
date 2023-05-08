import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({
    super.key, required this.onTap,
  });
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onTap(),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(
            1.5.w,
          ),
          child: Text(
            "Create",
            style:
            Theme.of(context).textTheme.headline3?.copyWith(
              color: Colors.black,
              fontSize: 12.5.sp,
              fontFamily: "Rubik",
              // fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}