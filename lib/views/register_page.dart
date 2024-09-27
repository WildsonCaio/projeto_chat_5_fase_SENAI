import 'package:flutter/material.dart';
import 'package:flutter_application_5/components/custom_button.dart';
import 'package:flutter_application_5/components/custom_input.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.edit, size: 150,),
            Text(
              'Cadastro',
              style: TextStyle(fontSize: 24),
            ),
            CustomInput(labelText: 'Nome'),
            CustomInput(labelText: 'Telefone'),
            CustomInput(labelText: 'Email'),
            CustomInput(labelText: 'Senha', obscure: true),
            CustomInput(labelText: 'Repita sua Senha', obscure: true),
            CustomButton(titleButton: 'Cadastrar')
          ],
        ),
      ),
    );
  }
}
