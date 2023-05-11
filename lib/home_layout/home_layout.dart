import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'Home Layout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .3,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 200, left: 50),
          child: Text(
            'To Do List',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
