import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import 'account_info_sheet.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constances.bottomBarColor,
      padding: EdgeInsets.symmetric(
        vertical: 0.5.h,
        horizontal: 0.5.w,
      ),
      width: double.infinity,
      child: Card(
        color: Constances.bottomBarColor,
        child: Row(
          children: [
            //  profileImage
            GestureDetector(
              onTap: () {
                _showActionSheet(context);
              },
              child: SvgPicture.asset(
                Constances.profileImage,
                height: 5.h,
                width: 10.w,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              "Vishal",
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: Colors.white,
                    fontFamily: "PublicSans",
                    // fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => const accountInfoSheet(),
    );
  }
}
