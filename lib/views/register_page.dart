import 'package:flutter/material.dart';
import 'package:flutter_application_5/components/custom_button.dart';
import 'package:flutter_application_5/components/custom_input.dart';
import 'package:flutter_application_5/services/auth_service.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.edit,
              size: 150,
              color: Colors.lightBlue,
            ),
            Text(
              'Cadastro',
              style: TextStyle(fontSize: 24),
            ),
            CustomInput(
              controller: nameController,
              labelText: 'Nome',
            ),
            CustomInput(
              controller: phoneController,
              labelText: 'Telefone',
            ),
            CustomInput(
              controller: emailController,
              labelText: 'Email',
            ),
            CustomInput(
                controller: passwordController,
                labelText: 'Senha',
                obscure: true),
            CustomInput(
                controller: passwordController,
                labelText: 'Repita sua Senha',
                obscure: true),
            CustomButton(
                onPressed: () async {
                  try {
                    await FirebaseAuthService().register(
                        emailController.text, passwordController.text);
                    Navigator.pop(context);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          e.toString(),
                        ),
                      ),
                    );
                  }
                },
                titleButton: 'Cadastrar')
          ],
        ),
      ),
    );
  }
}
