import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/task_provider.dart';

class TaskTab extends StatelessWidget {
  static const String routeName = 'Task Tab';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      builder: (context, child) {
        var taskPro = Provider.of<TaskProvider>(context);
        return ListView.separated(
            itemBuilder: (context, index) {
              return taskPro.todoList[index];
            },
            separatorBuilder: (context, index) => SizedBox(height: 20),
            itemCount: taskPro.todoList.length);
      },
    );
  }
}
