import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/constants.dart';
import 'package:vishal_todo_app/src/constants/routes.dart';
import 'package:vishal_todo_app/src/features/splash_screen/widgets/ink_well_overlay.dart';

import '../../services/Navigate.dart';

class SplashScreenTwo extends StatefulWidget {
  const SplashScreenTwo({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreenTwo> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Theme.of(context).accentColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Constances.splashScreenIcon,
            height: 20.h,
            width: 37.w,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            "To Do Reminder",
            style: Theme.of(context).textTheme.headline2?.copyWith(
              color: Colors.white,
              // fontSize: 11.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigation.instance.navigateAndRemoveUntil(Routes.dashboard);
    });
  }
}
