import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';

class AddNewCard extends StatelessWidget {
  const AddNewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 2.w, vertical: 0.5.h),
        decoration: const BoxDecoration(
          color: Constances.lightBlueBackground,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          children: [
            Text(
              'Add New',
              style:
              Theme.of(context).textTheme.headline4?.copyWith(
                fontSize: 11.2.sp,
                color: Colors.white,
                fontFamily: "PublicSans",
                // fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(
              Icons.add,
              color: Colors.white,
              // size:19.sp,
            ),
          ],
        ),
      ),
    );
  }
}