import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vishal_todo_app/src/constants/constants.dart';
import 'package:vishal_todo_app/src/helper/storage.dart';
import 'package:vishal_todo_app/src/models/personal_model.dart';
import 'package:vishal_todo_app/src/models/reminder_list_item.dart';
import 'package:vishal_todo_app/src/models/timer_section_option_model.dart';

import '../models/bookmark.dart';
import '../models/daily_routine_model.dart';
import '../models/essential_note.dart';
import '../models/quick_note.dart';

class Repository extends ChangeNotifier {
  List<DailyRoutineModel> models = [], personals = [];
  DailyRoutineModel? recentModel;
  List<Bookmark> bookmarks = [];

  List<EssentialNotes> essentials = [];

  List<QuickNote> quickNotes = [];

  void addQuickNote(QuickNote quickNote) {
    quickNotes.add(quickNote);
    notifyListeners();
  }

  void fetchData() async{
    final response = await Storage.instance.getListFromDailyRoutineSharedPreferences();
    final response1 = await Storage.instance.getListFromPersonalRoutineSharedPreferences();
    final response3 = await Storage.instance.getListFromBookmarklRoutineSharedPreferences();
    final response4 = await Storage.instance.getListFromEssentialRoutineSharedPreferences();
    final response5 = await Storage.instance.getListFromQuickRoutineSharedPreferences();
    models = response;
    personals = response1;
    bookmarks = response3;
    essentials = response4;
    quickNotes = response5;
    notifyListeners();
  }

  void updateDailyRoutineCalendarWeekly(List<int> days, List<DateTime> dates) {
    recentModel?.weekDays = days;
    recentModel?.monthly = dates;
    notifyListeners();
  }

  // void removeDailyRoutineCalendarWeekly(int value){
  //   recentModel?.weekDays.remove(value);
  //   notifyListeners();
  // }

  void deleteQuickNote(QuickNote quickNote) {
    quickNotes.remove(quickNote);
    notifyListeners();
    Storage.instance.saveListToQuickRoutineSharedPreferences(quickNotes);
  }

  void updateQuickNote(QuickNote quickNote, int index) {
    quickNotes[index] = quickNote;
    notifyListeners();
    Storage.instance.saveListToQuickRoutineSharedPreferences(quickNotes);
  }

  void addEssential(EssentialNotes list) {
    essentials.add(list);
    notifyListeners();
    Storage.instance.saveListToEssentialRoutineSharedPreferences(essentials);
  }

  void removeEssential(EssentialNotes list) {
    essentials.remove(list);
    notifyListeners();
    Storage.instance.saveListToEssentialRoutineSharedPreferences(essentials);
  }

  void updateEssentials(EssentialNotes list, int index) {
    essentials[index] = list;
    notifyListeners();
    Storage.instance.saveListToEssentialRoutineSharedPreferences(essentials);
  }

  void updateEssentialCompleted(bool val, int index, int index2) {
    debugPrint(
        "${essentials[index].notes[index2].title} ${essentials[index].notes[index2].isCompleted} ${val}");
    essentials[index].notes[index2].isCompleted = val;

    notifyListeners();
    Storage.instance.saveListToEssentialRoutineSharedPreferences(essentials);
  }

  void addEssentialItem(int index, EssentialNote item) {
    essentials[index].notes.add(item);
    notifyListeners();
    Storage.instance.saveListToEssentialRoutineSharedPreferences(essentials);
  }

  void removeEssentialItem(int index, EssentialNote item) {
    essentials[index].notes.remove(item);
    notifyListeners();
    Storage.instance.saveListToEssentialRoutineSharedPreferences(essentials);
  }

  void addNewEssentialItem(EssentialNote item) {
    essentials.add(
      EssentialNotes(
        [item],
        DateFormat("dd MMM yyyy").format(DateTime.now()),
      ),
    );
    notifyListeners();
    Storage.instance.saveListToEssentialRoutineSharedPreferences(essentials);
  }

  void addBookmark(Bookmark bookmark) {
    bookmarks.add(bookmark);
    notifyListeners();
    Storage.instance.saveListToBookmarkRoutineSharedPreferences(bookmarks);
  }

  void updateBookmark(Bookmark bookmark, int index) {
    bookmarks[index] = bookmark;
    notifyListeners();
    Storage.instance.saveListToBookmarkRoutineSharedPreferences(bookmarks);
  }

  void deleteBookmark(Bookmark bookmark) {
    bookmarks.remove(bookmark);
    notifyListeners();
  }

  addBookmarkItem(BookmarkSubItem item, int index) {
    bookmarks[index].items!.add(item);
    notifyListeners();
    Storage.instance.saveListToBookmarkRoutineSharedPreferences(bookmarks);
  }

  updateBookmarkItem(BookmarkSubItem item, int index, int index2) {
    bookmarks[index].items![index2] = item;
    notifyListeners();
    Storage.instance.saveListToBookmarkRoutineSharedPreferences(bookmarks);
  }

  void deleteBookmarkItem(BookmarkSubItem item, int index) {
    print(item.title);
    bookmarks[index].items!.remove(item);

    notifyListeners();
    Storage.instance.saveListToBookmarkRoutineSharedPreferences(bookmarks);
  }

  void deleteBookmarkSubItem() {}

  void updateReminderListItem(int index, ReminderListItem item, int num) {
    models[index].reminders[num] = item;
    Storage.instance.saveListToDailyRoutineSharedPreferences(models);
    notifyListeners();
  }

  void updateReminderListItemPersonal(
      int index, ReminderListItem item, int num) {
    personals[index].reminders[num] = item;
    notifyListeners();
  }

  void updateReminderListItemReminder(int index, bool val, int num) {
    models[index].reminders[num].isEnabled = val;
    Storage.instance.saveListToDailyRoutineSharedPreferences(models);
    notifyListeners();
  }

  void updateReminderListItemReminderPersonal(int index, bool val, int num) {
    personals[index].reminders[num].isEnabled = val;
    notifyListeners();
  }

  void updateTimeSelection(int index, int num, DateTime val) {
    models[index].reminders[num].timeDate = val;
    models[index].reminders[num].time = DateFormat("hh:m a").format(val);
    Storage.instance.saveListToDailyRoutineSharedPreferences(models);
    notifyListeners();
  }

  void updateTimeSelectionPersonal(int index, int num, DateTime val) {
    personals[index].reminders[num].timeDate = val;
    personals[index].reminders[num].time = DateFormat("hh:m a").format(val);
    notifyListeners();
    Storage.instance.saveListToPersonalRoutineSharedPreferences(personals);
  }

  void addReminderListItem(int index, ReminderListItem item) {
    models[index].reminders.add(item);
    Storage.instance.saveListToDailyRoutineSharedPreferences(models);
    notifyListeners();
  }
  void addReminderListItemRecent(int index, ReminderListItem item) {
   recentModel?.reminders.add(item);
    Storage.instance.saveListToDailyRoutineSharedPreferences(models);
    notifyListeners();
  }

  void addReminderListItemPersonal(int index, ReminderListItem item) {
    personals[index].reminders.add(item);
    Storage.instance.saveListToPersonalRoutineSharedPreferences(personals);
    notifyListeners();
  }

  void addDailyReminder(DailyRoutineModel model) {
    models.add(model);
    Storage.instance.saveListToDailyRoutineSharedPreferences(models);
    notifyListeners();
  }

  void addRecentDailyReminder(DailyRoutineModel model) {
    recentModel = model;
    notifyListeners();
  }

  void addPersonal(DailyRoutineModel model) {
    personals.add(model);

    notifyListeners();
    Storage.instance.saveListToPersonalRoutineSharedPreferences(personals);
  }

  void updateTimerOptions(
      TimerSelectionOptions options, int index, int index2) {
    models[index].reminders[index2].options = options;
    Storage.instance.saveListToDailyRoutineSharedPreferences(models);
    notifyListeners();
  }

  void updateTimerOptionsPersonal(
      TimerSelectionOptions options, int index, int index2) {
    personals[index].reminders[index2].options = options;
    notifyListeners();
    Storage.instance.saveListToPersonalRoutineSharedPreferences(personals);
  }

  void modifyDailyReminder(int index, DailyRoutineModel model) {
    models[index] = model;
    Storage.instance.saveListToDailyRoutineSharedPreferences(models);
    notifyListeners();
  }

  void modifyPersonals(int index, DailyRoutineModel model) {
    personals[index] = model;
    notifyListeners();
    Storage.instance.saveListToPersonalRoutineSharedPreferences(personals);
  }

  void removeDailyReminder(int index) {
    models.removeAt(index);
    Storage.instance.saveListToDailyRoutineSharedPreferences(models);
    notifyListeners();
  }

  void removePersonal(int index) {
    personals.removeAt(index);
    notifyListeners();
    Storage.instance.saveListToPersonalRoutineSharedPreferences(personals);
  }

  void removePersonalBy(DailyRoutineModel val) {
    personals.remove(val);
    notifyListeners();
    Storage.instance.saveListToPersonalRoutineSharedPreferences(personals);
  }

  void removeAllDailyReminders() {
    models.clear();
    Storage.instance.saveListToDailyRoutineSharedPreferences(models);
    notifyListeners();
  }

  void removeAllPersonal() {
    personals.clear();
    notifyListeners();
    Storage.instance.saveListToPersonalRoutineSharedPreferences(personals);
  }

  void updateRemindersRecent(List<ReminderListItem> reminders) {
    recentModel?.reminders = reminders;
    notifyListeners();
    debugPrint("Reminder");
  }

  void updateTimerOptionsRecent(
      TimerSelectionOptions timerSelectionOptions, int parse2, int parse3) {
    recentModel?.reminders[parse3].options = timerSelectionOptions;
    notifyListeners();
  }

  void updateParticularIndexRecent(int index, int index2, DateTime? timeDate,
      TimerSelectionOptions? options, String? time) {
    recentModel?.reminders[index2].options = options;
    recentModel?.reminders[index2].timeDate = timeDate;
    recentModel?.reminders[index2].time = time;
    notifyListeners();
  }

  void setRecent(DailyRoutineModel model) {
    recentModel = model;
    notifyListeners();
  }
}
