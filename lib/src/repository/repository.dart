import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:vishal_todo_app/src/constants/constants.dart';
import 'package:vishal_todo_app/src/models/personal_model.dart';
import 'package:vishal_todo_app/src/models/reminder_list_item.dart';
import 'package:vishal_todo_app/src/models/timer_section_option_model.dart';

import '../models/bookmark.dart';
import '../models/daily_routine_model.dart';

class Repository extends ChangeNotifier {
  List<DailyRoutineModel> models = [
        // DailyRoutineModel(
        //   "Drink Lemon Tea",
        //   "6:30 PM",
        //   DateTime.now().subtract(
        //     const Duration(
        //       days: 1,
        //       hours: 2,
        //     ),
        //   ),
        //   Constances.coffeeImage,
        //   [],
        //   TimerSelectionOptions("buzz", 40, false),
        // ),
        // DailyRoutineModel(
        //   "Shower",
        //   "3:30 PM",
        //   DateTime.now().subtract(
        //     const Duration(
        //       days: 4,
        //       hours: 1,
        //     ),
        //   ),
        //   Constances.bathtubImage,
        //   [
        //     ReminderListItem(
        //       "Morning Shower",
        //       "9:30 AM",
        //       DateTime.now().subtract(
        //         const Duration(
        //           days: 4,
        //           hours: 4,
        //         ),
        //       ),
        //       false,
        //     ),
        //     ReminderListItem(
        //       "Afternoon Shower",
        //       "3:30 PM",
        //       DateTime.now().subtract(
        //         const Duration(
        //           days: 4,
        //           hours: 4,
        //         ),
        //       ),
        //       false,
        //     ),
        //   ],
        //   TimerSelectionOptions("ring", 50, true),
        // )
      ],
      personals = [];

  // List<Personal> personals=[];

  // void addPersonal(Personal data){
  //   personals.add(data);
  //   notifyListeners();
  // }
  //
  // void updatePersonal(Personal data,int index){
  //   personals[index] = data;
  //   notifyListeners();
  // }
  //
  // void removePersonal(Personal data){
  //   personals.remove(data);
  //   notifyListeners();
  // }

  List<Bookmark> bookmarks = [
    // Bookmark(
    //   title: "Adobe",
    //   image: Constances.adobeImage,
    //   items: [
    //     BookmarkSubItem(
    //       title: "My favorite",
    //       link: "https://major-project-backend-m8rs.onrender.com"
    //     ),
    //   ]
    // ),
  ];

  void addBookmark(Bookmark bookmark) {
    bookmarks.add(bookmark);
    notifyListeners();
  }

  void updateBookmark(Bookmark bookmark, int index) {
    bookmarks[index] = bookmark;
    notifyListeners();
  }

  void deleteBookmark(Bookmark bookmark) {
    bookmarks.remove(bookmark);
    notifyListeners();
  }

  addBookmarkItem(BookmarkSubItem item, int index) {
    bookmarks[index].items!.add(item);
    notifyListeners();
  }

  updateBookmarkItem(BookmarkSubItem item, int index,int index2) {
    bookmarks[index].items![index2] = item;
    notifyListeners();
  }
  void deleteBookmarkItem(BookmarkSubItem item, int index) {
    print(item.title);
    bookmarks[index].items!.remove(item);

    notifyListeners();
  }
  void deleteBookmarkSubItem(){

  }

  void updateReminderListItem(int index, ReminderListItem item, int num) {
    models[index].reminders[num] = item;
    notifyListeners();
  }

  void updateReminderListItemPersonal(
      int index, ReminderListItem item, int num) {
    personals[index].reminders[num] = item;
    notifyListeners();
  }

  void updateReminderListItemReminder(int index, bool val, int num) {
    models[index].reminders[num].isEnabled = val;
    notifyListeners();
  }

  void updateReminderListItemReminderPersonal(int index, bool val, int num) {
    personals[index].reminders[num].isEnabled = val;
    notifyListeners();
  }

  void updateTimeSelection(int index, int num, DateTime val) {
    models[index].reminders[num].timeDate = val;
    models[index].reminders[num].time = DateFormat("hh:m a").format(val);
    notifyListeners();
  }

  void updateTimeSelectionPersonal(int index, int num, DateTime val) {
    personals[index].reminders[num].timeDate = val;
    personals[index].reminders[num].time = DateFormat("hh:m a").format(val);
    notifyListeners();
  }

  void addReminderListItem(int index, ReminderListItem item) {
    models[index].reminders.add(item);
    notifyListeners();
  }

  void addReminderListItemPersonal(int index, ReminderListItem item) {
    personals[index].reminders.add(item);
    notifyListeners();
  }

  void addDailyReminder(DailyRoutineModel model) {
    models.add(model);
    notifyListeners();
  }

  void addPersonal(DailyRoutineModel model) {
    personals.add(model);
    notifyListeners();
  }

  void updateTimerOptions(
      TimerSelectionOptions options, int index, int index2) {
    models[index].reminders[index2].options = options;
    notifyListeners();
  }

  void updateTimerOptionsPersonal(
      TimerSelectionOptions options, int index, int index2) {
    personals[index].reminders[index2].options = options;
    notifyListeners();
  }

  void modifyDailyReminder(int index, DailyRoutineModel model) {
    models[index] = model;
    notifyListeners();
  }

  void modifyPersonals(int index, DailyRoutineModel model) {
    personals[index] = model;
    notifyListeners();
  }

  void removeDailyReminder(int index) {
    models.removeAt(index);
    notifyListeners();
  }

  void removePersonal(int index) {
    personals.removeAt(index);
    notifyListeners();
  }

  void removePersonalBy(DailyRoutineModel val) {
    personals.remove(val);
    notifyListeners();
  }

  void removeAllDailyReminders() {
    models.clear();
    notifyListeners();
  }

  void removeAllPersonal() {
    personals.clear();
    notifyListeners();
  }
}
