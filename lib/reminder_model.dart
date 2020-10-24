class Reminder {
  String id;
  DateTime dateTime;
  Repetition repetition;
  bool isActive;

  Reminder.name(this.id, this.dateTime, this.repetition, this.isActive);
}

enum Repetition { daily, weekly, monthly }
