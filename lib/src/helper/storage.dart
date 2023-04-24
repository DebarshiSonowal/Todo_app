import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vishal_todo_app/src/models/reminder_list_item.dart';

import '../models/daily_routine_model.dart';

class Storage {
  // shared_preferences
  Storage._();

  static final Storage instance = Storage._();
  late SharedPreferences sharedpreferences;

  Future<void> initializeStorage() async {
    sharedpreferences = await SharedPreferences.getInstance();
  }

  Future<void> addNewReminder(DailyRoutineModel model) async {
    await sharedpreferences.setString("last", json.encode(model));
  }

  get lastAdded => sharedpreferences.getString("last") ?? "";

  // void logout() {}
  Future<void> clean() async {
    await sharedpreferences.clear();
  }
}
