import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/routes.dart';
import 'package:vishal_todo_app/src/features/dashboard/widgets/bookmark_card.dart';
import 'package:vishal_todo_app/src/features/dashboard/widgets/custom_bottom_app_bar.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import '../../constants/constants.dart';
import '../../models/custom_note.dart';
import 'widgets/app_bar_widget.dart';
import 'widgets/dashboard_card.dart';
import 'widgets/notes_card.dart';
import 'widgets/personal_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(10.h),
        child: const AppBarWidget(),
      ),
      body: Container(
        height: 100.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 3.w,
          vertical: 0.5.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            children: [
              DashboardCard(
                type: "Daily Routine",
                onTapArrow: () {
                  Navigation.instance.navigate(Routes.dailyRoutine);
                },
                onTapItem: (index) {
                  Navigation.instance.navigate(
                    Routes.editDailyRoutineNormal,
                    args: index,
                    // index == 1 ? "Drink lemon water" : "Shower",
                  );
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),
              PersonalCard(
                type: "Personal",
                onTapItem: (int val) {},
              ),
              SizedBox(
                height: 1.5.h,
              ),
              const BookmarkCard(),
              SizedBox(
                height: 1.5.h,
              ),
              SizedBox(
                height: 18.h,
                child: Row(
                  children: [
                    notesCard(
                      image: Constances.notesImage,
                      list: [
                        CustomNote(title: "Rice", amount: "5 kg"),
                        CustomNote(title: "Wheat", amount: "8 kg"),
                        CustomNote(title: "Sugar", amount: "1 kg"),
                        CustomNote(title: "Oil", amount: "1 ltr"),
                      ],
                      onTap: () {},
                      name: "Notes",
                    ),
                    notesCard(
                      image: Constances.handImage,
                      list: [],
                      onTap: () {},
                      name: "Quick",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}