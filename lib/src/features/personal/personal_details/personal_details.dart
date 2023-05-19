import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/constants.dart';
import 'package:vishal_todo_app/src/models/daily_routine_model.dart';

import '../../../constants/routes.dart';
import '../../../repository/repository.dart';
import '../../../services/Navigate.dart';
import '../add_personal/widgets/add_personal_page_appbar.dart';
import 'widgets/personal_details_card.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(9.h),
        child: const AddPersonalPageAppbar(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 1.h,
        ),
        child: Column(
          children: [
            Consumer<Repository>(builder: (context, data, _) {
              var item = data.personals[index];
              return PersonalDetailsCard(item: item);
            }),
          ],
        ),
      ),
    );
  }
}


