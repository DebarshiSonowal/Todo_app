import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:vishal_todo_app/src/constants/constants.dart';
import 'package:vishal_todo_app/src/models/personal_model.dart';
import 'package:vishal_todo_app/src/models/reminder_list_item.dart';
import 'package:vishal_todo_app/src/models/timer_section_option_model.dart';

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
  ];

  List<Personal> personals=[];

  void addPersonal(Personal data){
    personals.add(data);
    notifyListeners();
  }

  void updatePersonal(Personal data,int index){
    personals[index] = data;
    notifyListeners();
  }

  void removePersonal(Personal data){
    personals.remove(data);
    notifyListeners();
  }

  void updateReminderListItem(int index, ReminderListItem item, int num) {
    models[index].reminders[num] = item;
    notifyListeners();
  }

  void updateReminderListItemReminder(int index, bool val, int num) {
    models[index].reminders[num].isEnabled = val;
    notifyListeners();
  }

  void updateTimeSelection(int index, int num, DateTime val) {
    models[index].reminders[num].timeDate = val;
    models[index].reminders[num].time = DateFormat("hh:m a").format(val);
    notifyListeners();
  }

  void addReminderListItem(int index, ReminderListItem item) {
    models[index].reminders.add(item);
    notifyListeners();
  }

  void addDailyReminder(DailyRoutineModel model) {
    models.add(model);
    notifyListeners();
  }

  void modifyDailyReminder(int index, DailyRoutineModel model) {
    models[index] = model;
    notifyListeners();
  }

  void removeDailyReminder(int index) {
    models.removeAt(index);
    notifyListeners();
  }

  void removeAllDailyReminders() {
    models.clear();
    notifyListeners();
  }
}
