import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/services/auth_service.dart';

class CustomButton extends StatelessWidget {
  String titleButton;
  Function? onPressed;

  CustomButton({super.key, required this.titleButton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => onPressed!(),
        child: Text(titleButton),
      ),
    );
  }
}
