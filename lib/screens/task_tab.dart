import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/screens/widget/task_widget.dart';

class TaskTab extends StatelessWidget {
  static const String routeName = 'Task Tab';
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: selectedDate,
          firstDate: selectedDate,
          lastDate: DateTime.now().add(Duration(days: 30)),
          onDateSelected: (p0) {
            selectedDate = p0;
          },
          activeBackgroundDayColor: Theme.of(context).colorScheme.primary,
          leftMargin: 20,
          dayColor: Theme.of(context).colorScheme.surface,
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return TaskWidget('My Name Is Hesham');
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 20);
              },
              itemCount: 10),
        ),
      ],
    );
  }
}
