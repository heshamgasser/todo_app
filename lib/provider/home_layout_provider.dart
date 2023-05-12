import 'package:flutter/material.dart';

import '../screens/setting_tab.dart';
import '../screens/task_tab.dart';

class HomelayoutProvider extends ChangeNotifier {
  int index = 0;

  List<Widget> tabs = [TaskTab(), SettingTab()];

  void indexChange(int value) {
    index = value;
    notifyListeners();
  }
}
