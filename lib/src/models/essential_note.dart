class EssentialNote {
  String? title;
  bool? isCompleted;

  EssentialNote(this.title, this.isCompleted);
}

class EssentialNotes{
  List<EssentialNote> notes=[];
  String? date;

  EssentialNotes(this.notes, this.date);
}