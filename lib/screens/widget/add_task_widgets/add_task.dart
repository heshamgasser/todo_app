import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/taskModel.dart';
import 'package:todo_app/provider/date_time_provider.dart';
import 'package:todo_app/screens/widget/add_task_widgets/custom_elevatedButton.dart';
import 'package:todo_app/screens/widget/add_task_widgets/custom_task_form_field.dart';
import 'package:todo_app/screens/widget/add_task_widgets/dateTimeWidget.dart';
import 'package:todo_app/shared/network/firebase/firebase_function.dart';

class AddingTask extends StatefulWidget {
  static final GlobalKey<FormState> formKey = GlobalKey();

  @override
  State<AddingTask> createState() => _AddingTaskState();
}

class _AddingTaskState extends State<AddingTask> {
  var titleController = TextEditingController();
  var detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DateProvider(),
      builder: (context, child) {
        var dateTimeProvider = Provider.of<DateProvider>(context);
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: AddingTask.formKey,
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
                    controller: titleController,
                    label: AppLocalizations.of(context)!.taskTitle,
                  ),
                  const SizedBox(height: 20),
                  CustomTaskFormField(
                    controller: detailController,
                    label: AppLocalizations.of(context)!.taskDetail,
                    maxLines: 5,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: DateTimeWidget(
                          dateText:
                              AppLocalizations.of(context)!.selectTaskDate,
                          dateOnTapped: () =>
                              dateTimeProvider.selectStartDate(context),
                          displayedDate: dateTimeProvider.startDate
                              .toString()
                              .substring(0, 10),
                          // timeText: AppLocalizations.of(context)!.startTime,
                          // timeOnTapped: () =>
                          //     dateTimeProvider.selectStartTime(context),
                          // displayedTime: dateTimeProvider.startTime,
                        ),
                      ),
                      // SizedBox(width: 20),
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * .2,
                      //   child: VerticalDivider(
                      //     thickness: 3,
                      //     color: Theme.of(context).colorScheme.surface,
                      //     indent: 20,
                      //     endIndent: 20,
                      //   ),
                      // ),
                      // SizedBox(width: 20),
                      // Expanded(
                      //   child: DateTimeWidget(
                      //     dateText: AppLocalizations.of(context)!.selectEndDate,
                      //     dateOnTapped: () =>
                      //         dateTimeProvider.selectEndDate(context),
                      //     displayedDate: dateTimeProvider.endDate
                      //         .toString()
                      //         .substring(0, 10),
                      //     // timeText: AppLocalizations.of(context)!.endTime,
                      //     // timeOnTapped: () =>
                      //     //     dateTimeProvider.selectEndTime(context),
                      //     // displayedTime: dateTimeProvider.endTime,
                      //   ),
                      // ),
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
                            if (AddingTask.formKey.currentState!.validate()) {
                              TaskModel taskModel = TaskModel(
                                  title: titleController.text,
                                  detail: detailController.text,
                                  startDate: Provider.of<DateProvider>(context,
                                          listen: false)
                                      .startDate
                                      .millisecondsSinceEpoch,
                                  // startTime: Provider.of<DateProvider>(context,
                                  //         listen: false)
                                  //     .startTime,
                                  // endDate: Provider.of<DateProvider>(context,
                                  //         listen: false)
                                  //     .endDate
                                  //     .millisecondsSinceEpoch,
                                  // endTime: Provider.of<DateProvider>(context,
                                  //         listen: false)
                                  //     .endTime,
                                  status: false);
                              FirebaseFunction.addTaskToFireStore(taskModel)
                                  .then(
                                (value) {
                                  Navigator.pop(context);
                                },
                              );
                            }
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
