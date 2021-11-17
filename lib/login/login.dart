import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/services/auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const FlutterLogo(
              size: 150,
            ),
            Flexible(
              child: LoginButton(
                color: Colors.blue,
                text: "Sign in with Google",
                loginMethod: AuthService().googleLogin,
                icon: FontAwesomeIcons.google,
              ),
            ),
            Flexible(
              child: LoginButton(
                color: Colors.black,
                text: "Sign in with Apple (in progress)",
                loginMethod: () {},
                icon: FontAwesomeIcons.apple,
              ),
            ),
            Flexible(
              child: LoginButton(
                color: Colors.deepPurple,
                text: "Sign in as guest",
                loginMethod: AuthService().anonymousLogin,
                icon: FontAwesomeIcons.userNinja,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function loginMethod;

  const LoginButton(
      {Key? key,
      required this.color,
      required this.text,
      required this.icon,
      required this.loginMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton.icon(
        onPressed: () => loginMethod(),
        icon: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        label: Text(text),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(20),
          backgroundColor: color,
        ),
      ),
    );
  }
}
