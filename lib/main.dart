import 'package:flutter/material.dart';
import 'package:todo_app/home_layout/home_layout.dart';
import 'package:todo_app/screens/setting_tab.dart';
import 'package:todo_app/screens/task_tab.dart';
import 'package:todo_app/shared/style/myThemeData.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (context) => HomeLayout(),
        // SplashScreen.roteName:(context) => SplashScreen(),
        TaskTab.routeName: (context) => TaskTab(),
        SettingTab.routeName: (context) => SettingTab(),
      },
    );
  }
}
