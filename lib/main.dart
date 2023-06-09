import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/home_layout/home_layout.dart';
import 'package:todo_app/provider/app_provider.dart';
import 'package:todo_app/screens/edit_task_screen.dart';
import 'package:todo_app/screens/setting_tab.dart';
import 'package:todo_app/screens/task_tab.dart';
import 'package:todo_app/shared/style/myThemeData.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (context) => AppProvider(), child: TodoApp()));
}

class TodoApp extends StatelessWidget {
  TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    appProvider.getSharedPreferences();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: appProvider.themeMode,
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: Locale(appProvider.language),
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (context) => const HomeLayout(),
        // SplashScreen.roteName:(context) => SplashScreen(),
        TaskTab.routeName: (context) => TaskTab(),
        SettingTab.routeName: (context) => const SettingTab(),
        EditTasksScreen.routeName: (context) => EditTasksScreen(),
      },
    );
  }
}
