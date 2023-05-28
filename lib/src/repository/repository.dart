import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:vishal_todo_app/src/constants/constants.dart';
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

  void deleteQuickNote(QuickNote quickNote) {
    quickNotes.remove(quickNote);
    notifyListeners();
  }

  void updateQuickNote(QuickNote quickNote, int index) {
    quickNotes[index] = quickNote;
    notifyListeners();
  }

  void addEssential(EssentialNotes list) {
    essentials.add(list);
    notifyListeners();
  }

  void removeEssential(EssentialNotes list) {
    essentials.remove(list);
    notifyListeners();
  }

  void updateEssentials(EssentialNotes list, int index) {
    essentials[index] = list;
    notifyListeners();
  }

  void updateEssentialCompleted(bool val, int index, int index2) {
    debugPrint(
        "${essentials[index].notes[index2].title} ${essentials[index].notes[index2].isCompleted} ${val}");
    essentials[index].notes[index2].isCompleted = val;

    notifyListeners();
  }

  void addEssentialItem(int index, EssentialNote item) {
    essentials[index].notes.add(item);
    notifyListeners();
  }

  void removeEssentialItem(int index, EssentialNote item) {
    essentials[index].notes.remove(item);
    notifyListeners();
  }

  void addNewEssentialItem(EssentialNote item) {
    essentials.add(
      EssentialNotes(
        [item],
        DateFormat("dd MMM yyyy").format(DateTime.now()),
      ),
    );
    notifyListeners();
  }

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

  updateBookmarkItem(BookmarkSubItem item, int index, int index2) {
    bookmarks[index].items![index2] = item;
    notifyListeners();
  }

  void deleteBookmarkItem(BookmarkSubItem item, int index) {
    print(item.title);
    bookmarks[index].items!.remove(item);

    notifyListeners();
  }

  void deleteBookmarkSubItem() {}

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
  void addRecentDailyReminder(DailyRoutineModel model) {
    recentModel = model;
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
