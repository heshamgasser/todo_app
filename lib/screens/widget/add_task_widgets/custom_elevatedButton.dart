import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  String buttonText;
  Color buttonColor;
  Function onpressed;

  CustomElevatedButton(
      {required this.buttonText,
      required this.buttonColor,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        padding: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        onpressed();
      },
      child: Text(
        buttonText,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
