class QuickNote {
  String? description, date, time;

  QuickNote(this.description, this.date, this.time);


  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'date': date,
      'description': description,
    };
  }

  QuickNote.fromJson(Map<String, dynamic> json)
      :description = json['description'],
        time= json['time'],
        date = json['date'];

}