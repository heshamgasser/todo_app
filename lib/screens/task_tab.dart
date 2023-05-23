import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/models/taskModel.dart';
import 'package:todo_app/screens/widget/task_listTile/task_widget.dart';
import 'package:todo_app/shared/network/firebase/firebase_function.dart';

class TaskTab extends StatefulWidget {
  static const String routeName = 'Task Tab';

  @override
  State<TaskTab> createState() => _TaskTabState();
}

class _TaskTabState extends State<TaskTab> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: selectedDate,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 30)),
          onDateSelected: (p0) {
            setState(() {
              selectedDate = p0;
            });
          },
          activeBackgroundDayColor: Theme.of(context).colorScheme.primary,
          leftMargin: 20,
          dayColor: Theme.of(context).colorScheme.surface,
          locale: 'en',
        ),
        SizedBox(height: 20),
        StreamBuilder(
          stream: FirebaseFunction.getTasksFromFireStore(selectedDate),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Column(
                children: [
                  Text(AppLocalizations.of(context)!.wrongMessage),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(AppLocalizations.of(context)!.tryAgain),
                  ),
                ],
              );
            }

            List<TaskModel> tasks =
                snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
            return Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return TaskWidget(tasks[index]);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                  itemCount: tasks.length),
            );
          },
        ),
      ],
    );
  }
}
