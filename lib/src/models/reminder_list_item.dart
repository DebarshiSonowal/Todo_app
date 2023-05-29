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
        timeDate = DateTime.parse(json['timeDate']??""),
        isEnabled = json['isEnabled'] ?? false,
        options = TimerSelectionOptions.fromJson(json['options']);

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'time': time,
      'timeDate': timeDate?.toIso8601String()??"",
      'isEnabled': isEnabled,
      'options': options!.toJson(),
    };
  }
}
