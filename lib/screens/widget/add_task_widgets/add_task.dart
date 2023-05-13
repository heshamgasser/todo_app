import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/date_time_provider.dart';
import 'package:todo_app/screens/widget/add_task_widgets/custom_elevatedButton.dart';
import 'package:todo_app/screens/widget/add_task_widgets/custom_task_form_field.dart';
import 'package:todo_app/screens/widget/add_task_widgets/dateTimeWidget.dart';

class AddingTask extends StatelessWidget {
  AddingTask({Key? key}) : super(key: key);
  static final GlobalKey<FormState> formKey = GlobalKey();
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
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
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
                    controller: taskTitle,
                  ),
                  const SizedBox(height: 20),
                  CustomTaskFormField(
                    label: AppLocalizations.of(context)!.taskDetail,
                    controller: taskdetail,
                    maxLines: 5,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: DateTimeWidget(
                            dateText:
                                AppLocalizations.of(context)!.selectStartDate,
                            dateOnTapped: () =>
                                dateTimeProvider.selectStartDate(context),
                            displayedDate: dateTimeProvider.startDate,
                            timeText: AppLocalizations.of(context)!.startTime,
                            timeOnTapped: () =>
                                dateTimeProvider.selectStartTime(context),
                            displayedtime: dateTimeProvider.startTime),
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .2,
                        child: VerticalDivider(
                          thickness: 3,
                          color: Theme.of(context).colorScheme.surface,
                          indent: 20,
                          endIndent: 20,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: DateTimeWidget(
                            dateText:
                                AppLocalizations.of(context)!.selectEndDate,
                            dateOnTapped: () =>
                                dateTimeProvider.selectEndDate(context),
                            displayedDate: dateTimeProvider.endDate,
                            timeText: AppLocalizations.of(context)!.endTime,
                            timeOnTapped: () =>
                                dateTimeProvider.selectEndTime(context),
                            displayedtime: dateTimeProvider.endTime),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          buttonText: AppLocalizations.of(context)!.add,
                          buttonColor: Theme.of(context).colorScheme.primary,
                          onpressed: () {
                            if (formKey.currentState!.validate()) {}
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomElevatedButton(
                          buttonText: AppLocalizations.of(context)!.cancel,
                          buttonColor: Theme.of(context).colorScheme.error,
                          onpressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
