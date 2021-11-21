import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/models/models.dart';
import 'package:quizapp/services/auth.dart';
import 'package:quizapp/shared/loading_indicator.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var report = Provider.of<Report>(context);
    var user = AuthService().user;

    if (user != null) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Profile"),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Quizzes completed: ${report.total}"),
                Text("User name: ${user.displayName ?? "Guest"}"),
                Text("E-mail: ${user.email ?? ""}"),
                ElevatedButton(
                    child: const Text("Sign out"),
                    onPressed: () async {
                      await AuthService().signOut();
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil("/", (route) => false);
                    })
              ],
            ),
          ));
    } else {
      return const LoadingIndicator();
    }
  }
}
