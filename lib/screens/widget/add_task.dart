import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/date_time_provider.dart';
import 'package:todo_app/screens/widget/custom_task_form_field.dart';
import 'package:todo_app/screens/widget/dateTimeWidget.dart';

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
                  const Spacer(),
                  DateTimeWidget(AppLocalizations.of(context)!.selectStartDate),
                  const Spacer(
                    flex: 8,
                  ),
                  DateTimeWidget(AppLocalizations.of(context)!.selectEndDate),
                  const Spacer()
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      dateTimeProvider.selectStartDate(context);
                    },
                    child: Text(
                      dateTimeProvider.startDate,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  const Spacer(
                    flex: 8,
                  ),
                  InkWell(
                    onTap: () {
                      dateTimeProvider.selectEndDate(context);
                    },
                    child: Text(
                      dateTimeProvider.endDate,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  const Spacer()
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Spacer(),
                  DateTimeWidget(AppLocalizations.of(context)!.startTime),
                  const Spacer(
                    flex: 8,
                  ),
                  DateTimeWidget(AppLocalizations.of(context)!.endTime),
                  const Spacer()
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      dateTimeProvider.selectStartTime(context);
                    },
                    child: Text(
                      dateTimeProvider.startTime,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  const Spacer(
                    flex: 8,
                  ),
                  InkWell(
                    onTap: () {
                      dateTimeProvider.selectEndTime(context);
                    },
                    child: Text(
                      dateTimeProvider.endTime,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  const Spacer()
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.error,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.cancel,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
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
