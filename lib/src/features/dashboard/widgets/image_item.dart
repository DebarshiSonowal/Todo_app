import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class imageItem extends StatelessWidget {
  const imageItem({
    super.key,
    required this.image,
    required this.onTap,
  });

  final String image;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Center(
        child: Image.asset(
          image,
          fit: BoxFit.fill,
          height: 6.h,
          width: 13.w,
        ),
      ),
    );
  }
}