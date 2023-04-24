class ReminderListItem {
  String? title, time;
  DateTime? timeDate;
  bool isEnabled = false;

  ReminderListItem(
    this.title,
    this.time,
    this.timeDate,
    this.isEnabled,
  );

  ReminderListItem.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        time = json['time'],
        timeDate = json['timeDate'],
        isEnabled = json['isEnabled'] ?? false;
}
