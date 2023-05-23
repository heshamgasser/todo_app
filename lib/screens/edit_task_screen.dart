import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/screens/widget/edit_tasks_widget/edit_task_text_field.dart';

class EditTasksScreen extends StatelessWidget {
  static const routeName = 'Edit Task Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.editTask,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Divider(
                color: Theme.of(context).colorScheme.surface,
                thickness: 2,
                indent: MediaQuery.of(context).size.width * .3,
                endIndent: MediaQuery.of(context).size.width * .3,
              ),
              SizedBox(height: 10),
              EditTextFormField(hintText: 'This is Title'),
              SizedBox(height: 20),
              EditTextFormField(hintText: 'This is Task Detail'),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
