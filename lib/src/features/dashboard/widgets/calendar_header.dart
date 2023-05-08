import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({
    super.key,
    required this.dateTime,
  });

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        DateFormat("MMM").format(dateTime),
        style: Theme.of(context).textTheme.headline3?.copyWith(
          color: Colors.white,
          fontFamily: "Rubik",
          // fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}