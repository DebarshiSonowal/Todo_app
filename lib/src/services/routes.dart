import 'package:flutter/material.dart';
import 'package:vishal_todo_app/src/features/dashboard/dashboard_screen.dart';
import 'package:vishal_todo_app/src/features/essential/essential_list/essential_list_page.dart';
import 'package:vishal_todo_app/src/features/ringtone_picker/ringtone_picker.dart';

// import 'package:vishal_todo_app/src/features/essentials_edit/essentials_details_page.dart';
import '../constants/constants.dart';
import '../constants/routes.dart';

// import '../features/daily_routine/daily_routine_page.dart';
import '../features/bookmark/add_bookmark/add_bookmark_page.dart';
import '../features/bookmark/add_bookmark_sublist_item/add_bookmark_list_item.dart';
// import '../features/daily_routine/add_daily_routine/add_daily_routine.dart';
import '../features/daily_routine/add_daily_routine_normal/add_daily_routine_normal.dart';
import '../features/essential/add_essential/add_essential_page.dart';
import '../features/personal/add_personal/add_personal_page.dart';
import '../features/personal/personal_timer_selected/personal_timer_selected_page.dart';
import '../features/quick_note/add_quick_note_from_date/add_quick_note_from_date.dart';
import '../features/quick_note/add_quick_notes/add_quick_notes_page.dart';
import '../features/bookmark/bookmark_list/bookmark_list_page.dart';
import '../features/bookmark/bookmark_sublist/bookmark_sublist_page.dart';
import '../features/dashboard/widgets/show_calendar.dart';
import '../features/date_selected/date_selected_page.dart';
import '../features/bookmark/edit_bookmark/edit_bookmark_page.dart';
import '../features/daily_routine/edit_daily_routine/edit_daily_routine.dart';
import '../features/personal/edit_personal_info/edit_personal_info_page.dart';
import '../features/quick_note/edit_quick_notes/edit_quick_notes_page.dart';
import '../features/edit_time_picker_personal/edit_time_date_selected_personal.dart';
import '../features/edit_timer_selected/edit_timer_selected.dart';
import '../features/essential/essentials_details/essentials_details_page.dart';
import '../features/essential/essentials_edit/essentials_edit_page.dart';
import '../features/personal/personal_details/personal_details.dart';
import '../features/personal/personal_enter_info/personal_enter_info_page.dart';
import '../features/personal/personal_time_date_selector/personal_timer_date_page.dart';
import '../features/quick_note/quick_notes/quick_notes_page.dart';
import '../features/splash_screen/splash_screen.dart';
import '../features/time_date_selector/time_date_selector.dart';
import '../features/timer_selected/timer_selected_page.dart';
import '../features/daily_routine/view_daily_routine/daily_routine_page.dart';
import '../widget/fade_transition_page_route.dart';
import 'Navigate.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // if (settings.name == null || settings.name == "") {
  //   return FadeTransitionPageRouteBuilder(page: HomeScreen());
  // }
  switch (settings.name) {
    case Routes.splashscreen:
      return RightLeftTransitionPageRouteBuilder(
        page: const SplashScreen(),
      );

    //Main
    case Routes.dashboard:
      return RightLeftTransitionPageRouteBuilder(
        page: const DashboardScreen(),
      );
    case Routes.showCalendar:
      return RightLeftTransitionPageRouteBuilder(page: const ShowCalendar());

    //routine
    case Routes.dailyRoutine:
      return RightLeftTransitionPageRouteBuilder(
        page: const DailyRoutinePage(),
      );
    // case Routes.addDailyRoutine:
    //   return FadeTransitionPageRouteBuilder(
    //     page: const AddDailyRoutine(),
    //   );
    case Routes.addDailyRoutineNormal:
      return RightLeftTransitionPageRouteBuilder(
        page: AddDailyRoutineNormal(),
      );
    case Routes.timeDatePicker:
      return RightLeftTransitionPageRouteBuilder(
        page: TimeDateSelector(
          // title: settings.arguments as String,
          index: settings.arguments as int,
        ),
      );
    case Routes.editDailyRoutineNormal:
      return RightLeftTransitionPageRouteBuilder(
        page: EditDailyRoutine(
          index: settings.arguments as int,
        ),
      );
    case Routes.timePicker:
      return RightLeftTransitionPageRouteBuilder(
        page: TimerSelectedPage(
          index: settings.arguments as int,
        ),
      );
    case Routes.datePicker:
      return RightLeftTransitionPageRouteBuilder(
        page: DateSelectedPage(
          index: settings.arguments as int,
        ),
      );
    case Routes.editTimePicker:
      return RightLeftTransitionPageRouteBuilder(
        page: EditTimerSelected(
          index: settings.arguments as String,
        ),
      );

    //personal
    case Routes.addPersonal:
      return RightLeftTransitionPageRouteBuilder(
        page: const AddPersonalPage(),
      );
    case Routes.addPersonalInfo:
      return RightLeftTransitionPageRouteBuilder(
        page: const PersonalEnterInfoPage(),
      );
    case Routes.personalDetails:
      return RightLeftTransitionPageRouteBuilder(
        page: PersonalDetails(
          index: settings.arguments as int,
        ),
      );
    case Routes.editPersonalInfo:
      return RightLeftTransitionPageRouteBuilder(
        page: EditPersonalInfoPage(index: settings.arguments as int),
      );
    case Routes.personalTimeDateSelector:
      return RightLeftTransitionPageRouteBuilder(
        page: PersonalTimerDatePage(index: settings.arguments as int),
      );
    case Routes.editTimePickerPersonal:
      return RightLeftTransitionPageRouteBuilder(
        page: EditTimerSelectedPersonal(
          index: settings.arguments as String,
        ),
      );
    case Routes.personalTimePicker:
      return RightLeftTransitionPageRouteBuilder(
        page: PersonalTimerSelectedPage(
          index: settings.arguments as int,
        ),
      );

    //bookmark
    case Routes.bookmark:
      return RightLeftTransitionPageRouteBuilder(
        page: const BookmarkListPage(),
      );
    case Routes.bookmarkList:
      return RightLeftTransitionPageRouteBuilder(
        page: BookmarkSublistPage(
          index: settings.arguments as int,
        ),
      );
    case Routes.addBookmark:
      return RightLeftTransitionPageRouteBuilder(
        page: AddBookmarkPage(),
      );
    case Routes.addBookmarkSubItem:
      return RightLeftTransitionPageRouteBuilder(
        page: AddBookmarkSubItemPage(
          index: settings.arguments as int,
        ),
      );
    case Routes.editBookmark:
      return RightLeftTransitionPageRouteBuilder(
        page: EditBookmarkPage(index: settings.arguments as String),
      );

    //essential
    case Routes.addEssentialPage:
      return RightLeftTransitionPageRouteBuilder(
        page: const AddEssentialPage(),
      );
    case Routes.essentialsList:
      return RightLeftTransitionPageRouteBuilder(page: const EssentialListPage());
    case Routes.essentialsDetails:
      return RightLeftTransitionPageRouteBuilder(
          page: EssentialDetailsPage(index: settings.arguments as int));
    case Routes.essentialsEdit:
      return RightLeftTransitionPageRouteBuilder(
          page: EditEssentialPage(index: settings.arguments as int));

    //quick
    case Routes.addQuickPage:
      return RightLeftTransitionPageRouteBuilder(
        page: AddQuickNotesPage(),
      );
    case Routes.quickNotesList:
      return RightLeftTransitionPageRouteBuilder(
        page: const QuickNotesPage(),
      );
    case Routes.editQuickNotes:
      return RightLeftTransitionPageRouteBuilder(
        page: EditQuickNotesPage(
          index: settings.arguments as int,
        ),
      );
    case Routes.addQuickNoteFromDate:
      return RightLeftTransitionPageRouteBuilder(
        page: AddQuickNoteFromDate(
          dateTime: settings.arguments as String,
        ),
      );

    //ringtone
    case Routes.ringTonePicker:
      return RightLeftTransitionPageRouteBuilder(
        page: RingtonePickerScreen(
          input: settings.arguments as String,
        ),
      );

    default:
      return RightLeftTransitionPageRouteBuilder(
        page: Container(),
      );
  }
}
