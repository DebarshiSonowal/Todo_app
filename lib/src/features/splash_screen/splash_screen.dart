import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/constants.dart';

import '../../primary.dart';
import '../../services/Navigate.dart';
import 'widgets/ink_well_overlay.dart';
import 'widgets/open_container_wrapper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          OpenContainerWrapper(
            transitionType: _transitionType,
            closedBuilder: (BuildContext _, VoidCallback openContainer) {
              return InkWellOverlay(
                openContainer: openContainer,
                child: SvgPicture.asset(
                  Constances.splashScreenImage,
                  height: 40.h,
                  width: 80.w,
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
          SvgPicture.asset(
            Constances.splashScreenIcon,
            height: 20.h,
            width: 37.w,
            fit: BoxFit.fill,
          ),
        ],
      ),
      // child: Center(
      //   child: Image.asset(
      //     Constances.splashScreenAnimation,
      //     fit: BoxFit.fill,
      //   ),
      // ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      // Navigation.instance.navigate(Constances.dashboard);
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (cont) => const OpenContainerTransformDemo(),
      //     ));
    });
  }
}
