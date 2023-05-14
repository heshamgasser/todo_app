import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/date_time_provider.dart';

class DateTimeWidget extends StatelessWidget {
  String dateText;
  Function dateOnTapped;
  String displayedDate;
  String timeText;
  Function timeOnTapped;
  String displayedTime;

  DateTimeWidget(
      {required this.dateText,
      required this.dateOnTapped,
      required this.displayedDate,
      required this.timeText,
      required this.timeOnTapped,
      required this.displayedTime});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<DateProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          dateText,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(height: 10),
        InkWell(
          onTap: () => dateOnTapped(),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.surface),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              displayedDate,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          timeText,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(height: 10),
        InkWell(
          onTap: () => timeOnTapped(),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.surface),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              displayedTime,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
      ],
    );
  }
}
