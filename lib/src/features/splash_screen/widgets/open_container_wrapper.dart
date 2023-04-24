import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:vishal_todo_app/src/features/splash_screen/splash_screen_two.dart';

class OpenContainerWrapper extends StatelessWidget {
  const OpenContainerWrapper({
    required this.closedBuilder,
    required this.transitionType,
    // required this.onClosed,
  });

  final CloseContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;

  // final ClosedCallback<bool?> onClosed;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: transitionType,
      openBuilder: (BuildContext context, VoidCallback call) {
        return SplashScreenTwo(
          // openContainer: call,
        );
      },
      // onClosed: onClosed,
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}
