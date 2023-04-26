import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/routes.dart';

import '../../constants/constants.dart';
import '../../models/personal_model.dart';
import '../../repository/repository.dart';
import '../../services/Navigate.dart';
import 'widgets/add_personal_info_appbar.dart';
import 'widgets/personal_info_page_card.dart';

class PersonalEnterInfoPage extends StatefulWidget {
  const PersonalEnterInfoPage({Key? key}) : super(key: key);

  @override
  State<PersonalEnterInfoPage> createState() => _PersonalEnterInfoPageState();
}

class _PersonalEnterInfoPageState extends State<PersonalEnterInfoPage> {
  File? attachment;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(9.h),
        child: AddPeronalInfoAppbar(
          savePersonal: () {
            Provider.of<Repository>(context, listen: false).addPersonal(
              Personal(
                id: Random.secure().nextInt(1000),
                title: titleController.text,
                description: descriptionController.text,
                image: attachment!.path,
                date: DateFormat("dd MMM yyyy").format(DateTime.now()),
                time: DateFormat("HH:MM a").format(DateTime.now()),
              ),
            );
            Navigation.instance.navigate(
              Routes.personalTimeDateSelector,
              args: Provider.of<Repository>(context, listen: false)
                      .personals
                      .length -
                  1,
            );
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
          vertical: 1.h,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset(
              Constances.backgroundImage,
            ).image,
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PersonalInfoPageCard(
                titleController: titleController,
                imageUpdate: (File file) {
                  setState(() {
                    attachment = file;
                  });
                },
                descriptionController: descriptionController,
                delete: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
