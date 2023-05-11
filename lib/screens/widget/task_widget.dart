import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          isThreeLine: true,
          contentPadding: EdgeInsets.all(20),
          leading: SizedBox(
            height: MediaQuery.of(context).size.height * .2,
            child: VerticalDivider(
              color: Theme.of(context).colorScheme.primary,
              thickness: 3,
            ),
          ),
          title: Text(
            'Play Basket Ball',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          subtitle: Row(
            children: [
              Icon(
                CupertinoIcons.clock,
                color: Theme.of(context).colorScheme.surface,
                size: 15,
              ),
              SizedBox(width: 20),
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
    );
  }
}
