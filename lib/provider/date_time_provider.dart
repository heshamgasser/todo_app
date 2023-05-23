import 'package:flutter/material.dart';

class DateProvider extends ChangeNotifier {
  // var startDate = DateTime.now();

  var startDate = DateUtils.dateOnly(DateTime.now());

  void selectStartDate(BuildContext context) async {
    DateTime? selectedStartDate = await showDatePicker(
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
    if (selectedStartDate != null) {
      // startDate = selectedStartDate;
      startDate = DateUtils.dateOnly(selectedStartDate);
    }
    notifyListeners();
  }

// var endDate = DateTime.now();
// var endDate = DateUtils.dateOnly(DateTime.now());

// void selectEndDate(BuildContext context) async {
//   DateTime? selectedEndDate = await showDatePicker(
//     builder: (context, child) =>
//         Theme(
//             data: Theme.of(context).copyWith(
//                 colorScheme: Theme
//                     .of(context)
//                     .colorScheme
//                     .copyWith(
//                     primary: Theme
//                         .of(context)
//                         .colorScheme
//                         .primary,
//                     surface: Theme
//                         .of(context)
//                         .colorScheme
//                         .onSurface,
//                     onPrimary: Theme
//                         .of(context)
//                         .colorScheme
//                         .surface,
//                     onSurface: Theme
//                         .of(context)
//                         .colorScheme
//                         .surface)),
//             child: child!),
//     context: context,
//     initialDate: DateTime.now(),
//     firstDate: DateTime.now(),
//     lastDate: DateTime.now().add(
//       const Duration(days: 365 * 2),
//     ),
//   );
//   if (selectedEndDate != null) {
//     endDate = DateUtils.dateOnly(selectedEndDate);
//   }
//   notifyListeners();
// }

//   String startTime = TimeOfDay.now().toString().substring(10, 15);
//
//   void selectStartTime(BuildContext context) async {
//     TimeOfDay? selectedStartTime = await showTimePicker(
//         builder: (context, child) => Theme(
//             data: Theme.of(context).copyWith(
//                 colorScheme: Theme.of(context).colorScheme.copyWith(
//                     primary: Theme.of(context).colorScheme.primary,
//                     surface: Theme.of(context).colorScheme.onSurface,
//                     onPrimary: Theme.of(context).colorScheme.surface,
//                     onSurface: Theme.of(context).colorScheme.surface)),
//             child: child!),
//         context: context,
//         initialTime: TimeOfDay.now());
//     if (selectedStartTime != null) {
//       startTime = selectedStartTime.toString().substring(10, 15);
//     }
//     notifyListeners();
//   }
//
//   String endTime = TimeOfDay.now().toString().substring(10, 15);
//
//   void selectEndTime(BuildContext context) async {
//     TimeOfDay? selectedEndTime = await showTimePicker(
//         builder: (context, child) => Theme(
//             data: Theme.of(context).copyWith(
//                 colorScheme: Theme.of(context).colorScheme.copyWith(
//                     primary: Theme.of(context).colorScheme.primary,
//                     surface: Theme.of(context).colorScheme.onSurface,
//                     onPrimary: Theme.of(context).colorScheme.surface,
//                     onSurface: Theme.of(context).colorScheme.surface)),
//             child: child!),
//         context: context,
//         initialTime: TimeOfDay.now());
//     if (selectedEndTime != null) {
//       endTime = selectedEndTime.toString().substring(10, 15);
//     }
//     notifyListeners();
//   }
// }
}
