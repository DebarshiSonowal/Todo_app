import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/routes.dart';
import 'package:vishal_todo_app/src/features/dashboard/widgets/bookmark_card.dart';
import 'package:vishal_todo_app/src/features/dashboard/widgets/custom_bottom_app_bar.dart';
import 'package:vishal_todo_app/src/models/essential_note.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import '../../constants/constants.dart';
import '../../models/custom_note.dart';
import 'widgets/app_bar_widget.dart';
import 'widgets/dashboard_card.dart';
import 'widgets/essential_demo_list.dart';
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
                height: 1.h,
              ),
              PersonalCard(
                type: "Personal",
                onTapItem: (int val) {},
              ),
              SizedBox(
                height: 1.h,
              ),
              const BookmarkCard(),
              SizedBox(
                height: 1.h,
              ),
              Consumer<Repository>(builder: (context, data, _) {
                return SizedBox(
                  height: 21.5.h,
                  child: Row(
                    children: [
                      notesCard(
                        image: Constances.notesImage,
                        list: data.essentials.isEmpty ? [] : [],
                        widget: data.essentials.isEmpty
                            ? Container()
                            : EssentialDemoList(
                                essential: data.essentials[0],
                              ),
                        onTap: () {
                          if (data.essentials.isEmpty) {
                            Navigation.instance
                                .navigate(Routes.addEssentialPage);
                          } else {
                            Navigation.instance.navigate(Routes.essentialsList);
                          }
                        },
                        name: "Essentials",
                        onArrowClick: () {
                          Navigation.instance.navigate(Routes.addEssentialPage);
                        },
                      ),
                      notesCard(
                        image: Constances.handImage,
                        list: data.quickNotes.isEmpty ? [] : [],
                        onTap: () {
                          Navigation.instance.navigate(Routes.quickNotesList);
                        },
                        name: "Quick",
                        onArrowClick: () {
                          Navigation.instance.navigate(Routes.addQuickPage);
                        },
                        widget: Text(
                          "${data.quickNotes.isEmpty ? "" : data.quickNotes.first.description}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 6,
                          style:
                              Theme.of(context).textTheme.headline4?.copyWith(
                                    color: Colors.white,
                                    fontSize: 11.sp,
                                    fontFamily: "PublicSans",
                                    // fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
