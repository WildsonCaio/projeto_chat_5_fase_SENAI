import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {

  Map user;

  DetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user['firstName']),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Voltar para Home'),
        ),
      ),
    );
  }
}
