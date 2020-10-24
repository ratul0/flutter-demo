import 'package:flutter/foundation.dart';
import 'package:reminder_app/reminder_model.dart';
import 'package:uuid/uuid.dart';

class ReminderProvider extends ChangeNotifier {
  List<Reminder> _reminders = [];

  List<Reminder> get reminders => _reminders;

  void addReminder(DateTime datetime,
      {Repetition repetition = Repetition.daily}) {
    _reminders.add(Reminder.name(Uuid().v1(), datetime, repetition, true));
    notifyListeners();
  }

  void toggleReminder(String id) {
    var reminder = _reminders.firstWhere((element) => element.id == id);
    reminder.isActive = !reminder.isActive;
    notifyListeners();
  }

  void updateFrequency(String id, Repetition repetition) {
    _reminders.firstWhere((element) => element.id == id).repetition =
        repetition;
    notifyListeners();
  }
}
