import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskWidget extends StatelessWidget {
  String taskTitle;

  TaskWidget(this.taskTitle);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20)),
        child: Slidable(
          startActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                borderRadius: BorderRadius.circular(20),
                onPressed: (context) {},
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
              SlidableAction(
                borderRadius: BorderRadius.circular(20),
                onPressed: (context) {},
                backgroundColor: Color(0xFF21B7CA),
                foregroundColor: Colors.white,
                icon: Icons.share,
                label: 'Share',
              ),
            ],
          ),
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                // An action can be bigger than the others.
                borderRadius: BorderRadius.circular(20),
                onPressed: (context) {},
                backgroundColor: Color(0xFF7BC043),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
              SlidableAction(
                borderRadius: BorderRadius.circular(20),
                onPressed: (context) {},
                backgroundColor: Color(0xFF0392CF),
                foregroundColor: Colors.white,
                icon: Icons.info,
                label: 'Open',
              ),
            ],
          ),
          enabled: true,
          direction: Axis.horizontal,
          child: ListTile(
            isThreeLine: true,
            contentPadding: const EdgeInsets.all(20),
            leading: SizedBox(
              height: MediaQuery.of(context).size.height * .2,
              child: VerticalDivider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 3,
              ),
            ),
            title: Text(
              taskTitle,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            subtitle: Row(
              children: [
                Icon(
                  CupertinoIcons.clock,
                  color: Theme.of(context).colorScheme.surface,
                  size: 15,
                ),
                const SizedBox(width: 20),
                Text(
                  '10:30 AM',
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
            trailing: Container(
              width: MediaQuery.of(context).size.width * .15,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(20)),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.done,
                    size: 30,
                    color: Theme.of(context).colorScheme.onSurface,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
