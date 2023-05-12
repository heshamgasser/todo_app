import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/date_time_provider.dart';
import 'package:todo_app/screens/widget/add_task_widgets/custom_elevatedButton.dart';
import 'package:todo_app/screens/widget/add_task_widgets/custom_task_form_field.dart';
import 'package:todo_app/screens/widget/add_task_widgets/dateTimeWidget.dart';

class AddingTask extends StatelessWidget {
  AddingTask({Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController taskTitle = TextEditingController();
  TextEditingController taskdetail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DateProvider(),
      builder: (context, child) {
        var dateTimeProvider = Provider.of<DateProvider>(context);
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocalizations.of(context)!.addTask,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Divider(
                color: Theme.of(context).colorScheme.surface,
                thickness: 2,
                indent: MediaQuery.of(context).size.width * .3,
                endIndent: MediaQuery.of(context).size.width * .3,
              ),
              const SizedBox(height: 20),
              CustomTaskFormField(
                label: AppLocalizations.of(context)!.taskTitle,
                hint: AppLocalizations.of(context)!.taskTitle,
              ),
              const SizedBox(height: 20),
              CustomTaskFormField(
                label: AppLocalizations.of(context)!.taskDetail,
                hint: AppLocalizations.of(context)!.taskDetail,
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  DateTimeWidget(
                      dateText: AppLocalizations.of(context)!.selectStartDate,
                      dateOnTapped: () =>
                          dateTimeProvider.selectStartDate(context),
                      displayedDate: dateTimeProvider.startDate,
                      timeText: AppLocalizations.of(context)!.startTime,
                      timeOnTapped: () =>
                          dateTimeProvider.selectStartTime(context),
                      displayedtime: dateTimeProvider.startTime),
                  Spacer(),
                  DateTimeWidget(
                      dateText: AppLocalizations.of(context)!.selectEndDate,
                      dateOnTapped: () =>
                          dateTimeProvider.selectEndDate(context),
                      displayedDate: dateTimeProvider.endDate,
                      timeText: AppLocalizations.of(context)!.endTime,
                      timeOnTapped: () =>
                          dateTimeProvider.selectEndTime(context),
                      displayedtime: dateTimeProvider.endTime),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                        buttonText: AppLocalizations.of(context)!.add,
                        buttonColor: Theme.of(context).colorScheme.primary,
                        formKey: formKey),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomElevatedButton(
                      buttonText: AppLocalizations.of(context)!.cancel,
                      buttonColor: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
