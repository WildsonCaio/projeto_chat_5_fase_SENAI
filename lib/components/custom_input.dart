import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {

  String labelText;
  bool obscure;
  TextEditingController controller;
  TextInputType? keyboardType;
  dynamic maxLines;
  

  CustomInput({super.key, 
  required this.labelText,
  this.obscure = false,
  required this.controller,
  this.keyboardType,
  this.maxLines = 1
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        maxLines: maxLines,
        minLines: 1,
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          filled: true,
          fillColor: Colors.white
        ),
      ),
    );
  }
}