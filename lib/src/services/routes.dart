import 'package:flutter/material.dart';
import 'package:vishal_todo_app/src/features/dashboard/dashboard_screen.dart';
import '../constants/constants.dart';
import '../constants/routes.dart';

// import '../features/daily_routine/daily_routine_page.dart';
import '../features/add_bookmark/add_bookmark_page.dart';
import '../features/add_bookmark_sublist_item/add_bookmark_list_item.dart';
import '../features/add_daily_routine/add_daily_routine.dart';
import '../features/add_daily_routine_normal/add_daily_routine_normal.dart';
import '../features/add_personal/add_personal_page.dart';
import '../features/bookmark_list/bookmark_list_page.dart';
import '../features/bookmark_sublist/bookmark_sublist_page.dart';
import '../features/date_selected/date_selected_page.dart';
import '../features/edit_bookmark/edit_bookmark_page.dart';
import '../features/edit_daily_routine/edit_daily_routine.dart';
import '../features/edit_personal_info/edit_personal_info_page.dart';
import '../features/edit_timer_selected/edit_timer_selected.dart';
import '../features/personal_enter_info/personal_enter_info_page.dart';
import '../features/personal_time_date_selector/personal_timer_date_page.dart';
import '../features/splash_screen/splash_screen.dart';
import '../features/time_date_selector/time_date_selector.dart';
import '../features/timer_selected/timer_selected_page.dart';
import '../features/view_daily_routine/daily_routine_page.dart';
import '../widget/fade_transition_page_route.dart';
import 'Navigate.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // if (settings.name == null || settings.name == "") {
  //   return FadeTransitionPageRouteBuilder(page: HomeScreen());
  // }
  switch (settings.name) {
    case Routes.splashscreen:
      return FadeTransitionPageRouteBuilder(
        page: const SplashScreen(),
      );

    //Main
    case Routes.dashboard:
      return FadeTransitionPageRouteBuilder(
        page: const DashboardScreen(),
      );

    //routine
    case Routes.dailyRoutine:
      return FadeTransitionPageRouteBuilder(
        page: const DailyRoutinePage(),
      );
    case Routes.addDailyRoutine:
      return FadeTransitionPageRouteBuilder(
        page: const AddDailyRoutine(),
      );
    case Routes.addDailyRoutineNormal:
      return FadeTransitionPageRouteBuilder(
        page: AddDailyRoutineNormal(),
      );
    case Routes.timeDatePicker:
      return FadeTransitionPageRouteBuilder(
        page: TimeDateSelector(
          // title: settings.arguments as String,
          index: settings.arguments as int,
        ),
      );
    case Routes.editDailyRoutineNormal:
      return FadeTransitionPageRouteBuilder(
        page: EditDailyRoutine(
          index: settings.arguments as int,
        ),
      );
    case Routes.timePicker:
      return FadeTransitionPageRouteBuilder(
        page: TimerSelectedPage(
          index: settings.arguments as int,
        ),
      );
    case Routes.datePicker:
      return FadeTransitionPageRouteBuilder(
        page: DateSelectedPage(
          index: settings.arguments as int,
        ),
      );
    case Routes.editTimePicker:
      return FadeTransitionPageRouteBuilder(
        page: EditTimerSelected(
          index: settings.arguments as String,
        ),
      );

    //personal
    case Routes.addPersonal:
      return FadeTransitionPageRouteBuilder(
        page: const AddPersonalPage(),
      );
    case Routes.addPersonalInfo:
      return FadeTransitionPageRouteBuilder(
        page: const PersonalEnterInfoPage(),
      );

    case Routes.editPersonalInfo:
      return FadeTransitionPageRouteBuilder(
        page: EditPersonalInfoPage(index: settings.arguments as int),
      );
    case Routes.personalTimeDateSelector:
      return FadeTransitionPageRouteBuilder(
        page: PersonalTimerDatePage(index: settings.arguments as int),
      );

    //bookmark
    case Routes.bookmark:
      return FadeTransitionPageRouteBuilder(
        page: const BookmarkListPage(),
      );
    case Routes.bookmarkList:
      return FadeTransitionPageRouteBuilder(
        page: BookmarkSublistPage(
          index: settings.arguments as int,
        ),
      );
    case Routes.addBookmark:
      return FadeTransitionPageRouteBuilder(
        page: AddBookmarkPage(),
      );
    case Routes.addBookmarkSubItem:
      return FadeTransitionPageRouteBuilder(
        page: AddBookmarkSubItemPage(
          index: settings.arguments as int,
        ),
      );
    case Routes.editBookmark:
      return FadeTransitionPageRouteBuilder(
        page: EditBookmarkPage(index: settings.arguments as String),
      );

    default:
      return FadeTransitionPageRouteBuilder(
        page: Container(),
      );
  }
}
