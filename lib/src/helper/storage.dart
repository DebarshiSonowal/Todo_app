import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vishal_todo_app/src/models/bookmark.dart';
import 'package:vishal_todo_app/src/models/quick_note.dart';
import 'package:vishal_todo_app/src/models/reminder_list_item.dart';

import '../models/daily_routine_model.dart';
import '../models/essential_note.dart';

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

  void saveListToDailyRoutineSharedPreferences(
      List<DailyRoutineModel> list) async {
    List<String> encodedList =
        list.map((item) => jsonEncode(item.toJson())).toList();
    await sharedpreferences.setStringList('DailyRoutineList', encodedList);
  }

  Future<List<DailyRoutineModel>>
      getListFromDailyRoutineSharedPreferences() async {
    List<String>? encodedList =
        sharedpreferences.getStringList('DailyRoutineList');
    if (encodedList == null) {
      return [];
    }
    List<DailyRoutineModel> list = encodedList
        .map((item) => DailyRoutineModel.fromJson(jsonDecode(item)))
        .toList();
    return list;
  }
  void saveListToPersonalRoutineSharedPreferences(
      List<DailyRoutineModel> list) async {
    List<String> encodedList =
    list.map((item) => jsonEncode(item.toJson())).toList();
    await sharedpreferences.setStringList('PersonalList', encodedList);
  }

  Future<List<DailyRoutineModel>>
  getListFromPersonalRoutineSharedPreferences() async {
    List<String>? encodedList =
    sharedpreferences.getStringList('PersonalList');
    if (encodedList == null) {
      return [];
    }
    List<DailyRoutineModel> list = encodedList
        .map((item) => DailyRoutineModel.fromJson(jsonDecode(item)))
        .toList();
    return list;
  }


  void saveListToBookmarkRoutineSharedPreferences(
      List<Bookmark> list) async {
    List<String> encodedList =
    list.map((item) => jsonEncode(item.toJson())).toList();
    await sharedpreferences.setStringList('BookmarkList', encodedList);
  }

  Future<List<Bookmark>>
  getListFromBookmarklRoutineSharedPreferences() async {
    List<String>? encodedList =
    sharedpreferences.getStringList('BookmarkList');
    if (encodedList == null) {
      return [];
    }
    List<Bookmark> list = encodedList
        .map((item) => Bookmark.fromJson(jsonDecode(item)))
        .toList();
    return list;
  }


void saveListToEssentialRoutineSharedPreferences(
      List<EssentialNotes> list) async {
    List<String> encodedList =
    list.map((item) => jsonEncode(item.toJson())).toList();
    await sharedpreferences.setStringList('EssentialList', encodedList);
  }

  Future<List<EssentialNotes>> getListFromEssentialRoutineSharedPreferences() async {
    List<String>? encodedList =
    sharedpreferences.getStringList('EssentialList');
    if (encodedList == null) {
      return [];
    }
    List<EssentialNotes> list = encodedList
        .map((item) => EssentialNotes.fromJson(jsonDecode(item)))
        .toList();
    return list;
  }

  void saveListToQuickRoutineSharedPreferences(
      List<QuickNote> list) async {
    List<String> encodedList =
    list.map((item) => jsonEncode(item.toJson())).toList();
    await sharedpreferences.setStringList('QuickNotesList', encodedList);
  }

  Future<List<QuickNote>> getListFromQuickRoutineSharedPreferences() async {
    List<String>? encodedList =
    sharedpreferences.getStringList('QuickList');
    if (encodedList == null) {
      return [];
    }
    List<QuickNote> list = encodedList
        .map((item) => QuickNote.fromJson(jsonDecode(item)))
        .toList();
    return list;
  }


}
