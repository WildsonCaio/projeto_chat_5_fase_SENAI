import 'package:flutter/material.dart';
import 'package:flutter_application_5/components/custom_button.dart';
import 'package:flutter_application_5/components/custom_input.dart';
import 'package:flutter_application_5/components/social_auth.dart';
import 'package:flutter_application_5/services/auth_service.dart';
import 'package:flutter_application_5/views/register_page.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(86, 243, 240, 240),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 14),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 180),
            CustomInput(
              controller: emailController,
              labelText: "Email",
            ),
            CustomInput(
              controller: passwordController,
              labelText: "Senha",
              obscure: true,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Recuperar Senha'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Digite seu email para recuperar seu acesso.'),
                            CustomInput(
                                labelText: 'Email',
                                controller: emailController),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () async {
                              FirebaseAuthService().recoverPassword(emailController.text);
                              Navigator.pop(context);
                            },
                            child: Text('Enviar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  'Esqueci minha senha',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ),
            CustomButton(
              onPressed: () async {
                try {
                  await FirebaseAuthService()
                      .login(emailController.text, passwordController.text);
                  Navigator.pushReplacementNamed(context, '/');
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Usuario ou senha incorretos'),
                    ),
                  );
                }
              },
              titleButton: "Entrar",
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Ainda não tem uma conta?'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ));
                  },
                  child: Text('Cadastre-se'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialAuth(
                  iconColor: Colors.white,
                  iconSocial:
                      "https://cdn-icons-png.flaticon.com/128/2875/2875404.png",
                  gradientColors: [
                    const Color.fromARGB(190, 243, 33, 33),
                    const Color.fromARGB(113, 82, 85, 86)
                  ],
                ),
                SocialAuth(
                  iconColor: Colors.white,
                  iconSocial:
                      "https://cdn-icons-png.flaticon.com/128/3128/3128304.png",
                  gradientColors: [
                    Colors.blue,
                    const Color.fromARGB(91, 3, 168, 244)
                  ],
                ),
                SocialAuth(
                  iconColor: Colors.white,
                  iconSocial:
                      "https://cdn-icons-png.flaticon.com/128/4926/4926625.png",
                  gradientColors: [
                    Colors.black,
                    const Color.fromARGB(91, 187, 197, 201)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
