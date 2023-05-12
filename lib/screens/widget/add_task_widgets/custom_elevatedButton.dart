import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  String buttonText;
  Color buttonColor;
  GlobalKey<FormState>? formKey;

  CustomElevatedButton(
      {required this.buttonText,
      required this.buttonColor,
      this.formKey = null});

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
        if (formKey != null) {
          if (formKey!.currentState!.validate()) {}
        } else {
          Navigator.pop(context);
        }
      },
      child: Text(
        buttonText,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
