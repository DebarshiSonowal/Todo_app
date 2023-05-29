import 'dart:math';

import 'package:intl/intl.dart';

import 'reminder_list_item.dart';
import 'timer_section_option_model.dart';

class DailyRoutineModel {
  String? title, titleTime, image, text;
  DateTime? dateTime;

  // TimerSelectionOptions? options;
  List<ReminderListItem> reminders = [];
  bool? isTimer, isDaily;
  List<int> weekDays = [];
  List<DateTime> monthly = [];
  int? type;
  int? id;

  DailyRoutineModel(
    this.title,
    this.titleTime,
    this.dateTime,
    this.image,
    this.reminders,
    this.type,
    this.text,
    // this.options,
  ) {
    id = Random.secure().nextInt(10000);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> remindersList =
        reminders.map((item) => item.toJson()).toList();
    // List<String> dateTimeListString = monthly
    //     .map((item) => item.toIso8601String())
    //     .toList();
    // var dates = monthly.isNotEmpty
    //     ? monthly.map((DateTime time) {
    //         print(" what is the ${time}");
    //         var dateRange = time.toIso8601String();
    //         return dateRange;
    //       })
    //     : "";
    List<String> dates = monthly.map((DateTime time) {
      return time.toIso8601String();
    }).toList();
    print(1);
    print(dateTime?.toIso8601String());
    print(2);
    print(dates);
    print(titleTime);
    return {
      'title': title,
      'titleTime': titleTime,
      'image': image,
      'dateTime': dateTime?.toIso8601String()??"",
      // 'options': options,
      'reminders': remindersList,
      'weekDays': weekDays,
      'monthly': dates,
      'type': type,
      'id': id,
    };
  }

  DailyRoutineModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        titleTime = json['titleTime'],
        dateTime = (json['dateTime']==null||json['dateTime']=="")?null:getValues(json['dateTime']),
        image = json['image'],
        reminders = json['reminders'] == null
            ? []
            : (json['reminders'] as List)
                .map((e) => ReminderListItem.fromJson(e))
                .toList(),
        monthly = (json['monthly'] == null || json['monthly'] == "")
            ? []
            : (json['monthly'] as List<dynamic>)
            .map((e) => DateTime.parse(e.toString()))
            .toList(),
        weekDays = json['weekDays'] == null
            ? []
            : (json['weekDays'] as List)
                .map((e) => int.parse(e.toString()))
                .toList(),
        type = json['type'],
        id = json['id'];

  static getValues(json) {
    print("whati si ${json} ${DateTime.parse(json)}");
    return DateTime.parse(json);
  }

// ,
// options = json['options']
}
