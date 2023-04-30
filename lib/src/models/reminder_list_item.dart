import 'timer_section_option_model.dart';

class ReminderListItem {
  String? title, time;
  DateTime? timeDate;
  bool isEnabled = false;
  TimerSelectionOptions? options;

  ReminderListItem(
    this.title,
    this.time,
    this.timeDate,
    this.isEnabled,
    this.options,
  );

  ReminderListItem.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        time = json['time'],
        timeDate = json['timeDate'],
        isEnabled = json['isEnabled'] ?? false,
        options = json['options'];
}
