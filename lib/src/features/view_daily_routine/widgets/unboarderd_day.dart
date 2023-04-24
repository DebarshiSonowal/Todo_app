import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class UnboarderedDay extends StatelessWidget {
  const UnboarderedDay({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        color: Colors.transparent,
      ),
      width: 8.w,
      child: Column(
        children: [
          Text(
            DateFormat("EEE")
                .format(
              DateTime.now().add(
                Duration(days: index),
              ),
            )
                .substring(0, 1),
            style: Theme.of(context).textTheme.headline5?.copyWith(
              color: Colors.white70,
              // fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            DateFormat("dd").format(
              DateTime.now().add(
                Duration(days: index),
              ),
            ),
            style: Theme.of(context).textTheme.headline5?.copyWith(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}