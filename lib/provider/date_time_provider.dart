import 'package:flutter/material.dart';

class DateProvider extends ChangeNotifier {
  String startDate = DateTime.now().toString().substring(0, 10);

  void selectStartDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      builder: (context, child) => Theme(
          data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: Theme.of(context).colorScheme.primary,
                  surface: Theme.of(context).colorScheme.onSurface,
                  onPrimary: Theme.of(context).colorScheme.surface,
                  onSurface: Theme.of(context).colorScheme.surface)),
          child: child!),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365 * 2),
      ),
    );
    if (selectedDate != null) {
      startDate = selectedDate.toString().substring(0, 10);
    }
    notifyListeners();
  }

  String endDate = DateTime.now().toString().substring(0, 10);

  void selectEndDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      builder: (context, child) => Theme(
          data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: Theme.of(context).colorScheme.primary,
                  surface: Theme.of(context).colorScheme.onSurface,
                  onPrimary: Theme.of(context).colorScheme.surface,
                  onSurface: Theme.of(context).colorScheme.surface)),
          child: child!),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365 * 2),
      ),
    );
    if (selectedDate != null) {
      endDate = selectedDate.toString().substring(0, 10);
    }
    notifyListeners();
  }

  String startTime = TimeOfDay.now().toString().substring(10, 15);

  void selectStartTime(BuildContext context) async {
    TimeOfDay? selectedStartTime = await showTimePicker(
        builder: (context, child) => Theme(
            data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: Theme.of(context).colorScheme.primary,
                    surface: Theme.of(context).colorScheme.onSurface,
                    onPrimary: Theme.of(context).colorScheme.surface,
                    onSurface: Theme.of(context).colorScheme.surface)),
            child: child!),
        context: context,
        initialTime: TimeOfDay.now());
    if (selectedStartTime != null) {
      startTime = selectedStartTime.toString().substring(10, 15);
    }
    notifyListeners();
  }

  String endTime = TimeOfDay.now().toString().substring(10, 15);

  void selectEndTime(BuildContext context) async {
    TimeOfDay? selectedEndTime = await showTimePicker(
        builder: (context, child) => Theme(
            data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: Theme.of(context).colorScheme.primary,
                    surface: Theme.of(context).colorScheme.onSurface,
                    onPrimary: Theme.of(context).colorScheme.surface,
                    onSurface: Theme.of(context).colorScheme.surface)),
            child: child!),
        context: context,
        initialTime: TimeOfDay.now());
    if (selectedEndTime != null) {
      endTime = selectedEndTime.toString().substring(10, 15);
    }
    notifyListeners();
  }
}
