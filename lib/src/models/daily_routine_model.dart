import 'reminder_list_item.dart';
import 'timer_section_option_model.dart';

class DailyRoutineModel {
  String? title, titleTime, image,text;
  DateTime? dateTime;
  // TimerSelectionOptions? options;
  List<ReminderListItem> reminders = [];
  bool? isTimer,isDaily;
  List<int> weekDays=[];
  List<DateTime> monthly=[];
  int? type;
  DailyRoutineModel(
    this.title,
    this.titleTime,
    this.dateTime,
    this.image,
    this.reminders,
    this.type,
    this.text,
    // this.options,
  );

  Map<String, dynamic> toJson() => {
        'title': title,
        'titleTime': titleTime,
        'image': image,
        'dateTime': dateTime,
        // 'options': options,
        'reminders': reminders,
      };

  DailyRoutineModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        titleTime = json['titleTime'],
        dateTime = json['dateTime'],
        image = json['image'],
        reminders = json['reminders'] == null
            ? []
            : (json['reminders'] as List)
                .map((e) => ReminderListItem.fromJson(e))
                .toList()
  // ,
        // options = json['options']
  ;
}
