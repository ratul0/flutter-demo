import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/AddReminderScreen.dart';
import 'package:reminder_app/ReminderProvider.dart';
import 'package:reminder_app/reminder_model.dart';

class ListReminderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminders'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddReminderScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: Consumer<ReminderProvider>(
        builder: (_, rp, child) => Container(
          child: ListView.builder(
            itemCount: rp.reminders.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 3),
                child: Card(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              onTap: () {},
                              title: Text(
                                  "${DateFormat('dd-MM-yyyy hh:mm').format(rp.reminders[index].dateTime)}"),
                              trailing: Switch(
                                value: rp.reminders[index].isActive,
                                onChanged: (_) {
                                  rp.toggleReminder(rp.reminders[index].id);
                                },
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Radio(
                                  value: Repetition.daily,
                                  groupValue: rp.reminders[index].repetition,
                                  onChanged: (_) {
                                    rp.updateFrequency(rp.reminders[index].id,
                                        Repetition.daily);
                                  },
                                ),
                                Text(
                                  'Daily',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                Radio(
                                  value: Repetition.weekly,
                                  groupValue: rp.reminders[index].repetition,
                                  onChanged: (_) {
                                    rp.updateFrequency(rp.reminders[index].id,
                                        Repetition.weekly);
                                  },
                                ),
                                Text(
                                  'Weekly',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                                Radio(
                                  value: Repetition.monthly,
                                  groupValue: rp.reminders[index].repetition,
                                  onChanged: (_) {
                                    rp.updateFrequency(rp.reminders[index].id,
                                        Repetition.monthly);
                                  },
                                ),
                                Text(
                                  'Monthly',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
