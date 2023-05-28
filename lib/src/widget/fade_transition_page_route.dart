import 'package:flutter/material.dart';

class FadeTransitionPageRouteBuilder extends PageRouteBuilder {
  final Widget page;
  FadeTransitionPageRouteBuilder({required this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    opaque:false,
    barrierColor:null,
    barrierLabel:null,
    maintainState:true,
    transitionDuration: Duration(milliseconds: 100),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
  );
}


class RightLeftTransitionPageRouteBuilder extends PageRouteBuilder {
  final Widget page;

  RightLeftTransitionPageRouteBuilder({required this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    opaque: false,
    barrierColor: null,
    barrierLabel: null,
    maintainState: true,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0), // Slide from right to left
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
}
