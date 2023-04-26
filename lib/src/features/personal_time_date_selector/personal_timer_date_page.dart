import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../../repository/repository.dart';
import '../personal_enter_info/widgets/personal_info_page_card.dart';
import 'widgets/personal_time_date_appbar.dart';
import 'widgets/stacked_time_selector.dart';

class PersonalTimerDatePage extends StatefulWidget {
  const PersonalTimerDatePage({Key? key, required this.index})
      : super(key: key);
  final int index;

  @override
  State<PersonalTimerDatePage> createState() => _PersonalTimerDatePageState();
}

class _PersonalTimerDatePageState extends State<PersonalTimerDatePage> {
  File? attachment;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  late String dateTime;
  @override
  void initState() {
    super.initState();
    loadDataIntoFields();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(9.h),
        child: PersonalDateTimeAppBar(
          savePersonal: () {},
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
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 100.h,
              width: 100.w,
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
                vertical: 2.h,
              ),
              color: Colors.transparent,
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
                      file: attachment,
                    ),
                  ],
                ),
              ),
            ),
            PersonalStackedCardTimeDate(
              index: widget.index,
            ),
          ],
        ),
      ),
    );
  }
  void loadDataIntoFields() async {
    titleController.text = Provider.of<Repository>(context, listen: false)
        .personals[widget.index]
        .title ??
        "";
    descriptionController.text = Provider.of<Repository>(context, listen: false)
        .personals[widget.index]
        .description ??
        "";
    attachment = File(Provider.of<Repository>(context, listen: false)
        .personals[widget.index]
        .image ??
        "");
    dateTime =
    "${Provider.of<Repository>(context, listen: false).personals[widget.index].date} | ${Provider.of<Repository>(context, listen: false).personals[widget.index].time}";

    setState(() {
      attachment = File(Provider.of<Repository>(context, listen: false)
          .personals[widget.index]
          .image ??
          "");
    });
  }
}
