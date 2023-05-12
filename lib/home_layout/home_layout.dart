import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/home_layout_provider.dart';
import 'package:todo_app/screens/widget/add_task.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'Home Layout';

  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomelayoutProvider(),
      builder: (context, child) {
        var homeProvider = Provider.of<HomelayoutProvider>(context);
        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            // toolbarHeight: MediaQuery.of(context).size.height * .3,
            title: Text(
              'To Do List',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Theme.of(context).colorScheme.onSurface,
            shape: const CircularNotchedRectangle(),
            notchMargin: 12,
            child: BottomNavigationBar(
              selectedItemColor: Theme.of(context).colorScheme.primary,
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconSize: 30,
              currentIndex: homeProvider.index,
              onTap: (value) {
                homeProvider.indexChange(value);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.list,
                    ),
                    label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: const StadiumBorder(
                side: BorderSide(color: Colors.white, width: 3)),
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddingTask(),
                ),
              );
            },
            child: const Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
          ),
          body: homeProvider.tabs[homeProvider.index],
        );
      },
    );
  }
}
