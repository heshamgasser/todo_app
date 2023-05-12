import 'package:flutter/material.dart';

class DateTimeWidget extends StatelessWidget {
  String text;

  DateTimeWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
