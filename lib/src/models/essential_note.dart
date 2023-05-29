class EssentialNote {
  String? title;
  bool? isCompleted;

  EssentialNote(this.title, this.isCompleted);

  Map<String, dynamic> toJson() {

    return {
      'title': title,
      'isCompleted': isCompleted,
    };
  }

  EssentialNote.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        isCompleted = json['isCompleted']??false;



}

class EssentialNotes{
  List<EssentialNote> notes=[];
  String? date;

  EssentialNotes(this.notes, this.date);
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> remindersList =
        notes.map((item) => item.toJson()).toList() ?? [];
    return {
      'notes': notes??[],
      'date': date,
    };
  }

  EssentialNotes.fromJson(Map<String, dynamic> json)
      : date = json['date'],
        notes = (json['notes'] == null || json['notes'] == "")
            ? []
            : (json['notes'] as List<dynamic>)
            .map((e) => EssentialNote.fromJson(e))
            .toList();
}