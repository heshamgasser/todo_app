import 'package:flutter/material.dart';

import '../screens/widget/task_listTile/task_widget.dart';

class TaskProvider extends ChangeNotifier {
  TextEditingController taskTitle = TextEditingController();
  TextEditingController taskdetail = TextEditingController();

  List<TaskWidget> todoList = [];

  void addTodoTask() {
    String title = taskTitle.text;
    String content = taskdetail.text;
    taskTitle.text = '';
    taskdetail.text = '';
    todoList.add(TaskWidget(title));
  }
}
