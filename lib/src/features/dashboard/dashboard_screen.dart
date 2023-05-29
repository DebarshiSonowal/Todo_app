import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/routes.dart';
import 'package:vishal_todo_app/src/features/dashboard/widgets/bookmark_card.dart';
import 'package:vishal_todo_app/src/features/dashboard/widgets/custom_bottom_app_bar.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import 'widgets/app_bar_widget.dart';
import 'widgets/card_section.dart';
import 'widgets/dashboard_card.dart';
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
        preferredSize: Size.fromHeight(9.5.h),
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
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            children: [
              DashboardCard(
                type: "Daily Routine",
                onTapArrow: () {
                  Navigation.instance.navigate(Routes.dailyRoutine);
                },
                onTapItem: (index) {
                  // Navigation.instance.navigate(
                  //   Routes.editDailyRoutineNormal,
                  //   args: index,
                  //   // index == 1 ? "Drink lemon water" : "Shower",
                  // );
                  Navigation.instance.navigate(Routes.dailyRoutine);
                },
              ),
              SizedBox(
                height: 1.h,
              ),
              PersonalCard(
                type: "Personal",
                onTapItem: (int val) {
                  // Navigation.instance.navigate
                  Navigation.instance.navigate(Routes.addPersonal);
                },

              ),
              SizedBox(
                height: 1.h,
              ),
              const BookmarkCard(),
              SizedBox(
                height: 1.h,
              ),
              Consumer<Repository>(builder: (context, data, _) {
                return CardSection(
                  essentials: data.essentials,
                  quickNotes: data.quickNotes,
                );
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    Provider.of<Repository>(context,listen: false).fetchData();
  }
}


