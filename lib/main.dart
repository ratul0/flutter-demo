import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/ReminderProvider.dart';

import 'ListReminderScreen.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => ReminderProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          home: ListReminderScreen(),
        ),
      ),
    );
