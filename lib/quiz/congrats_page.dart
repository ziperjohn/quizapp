import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/models/models.dart';
import 'package:quizapp/services/firestore.dart';

class CongratsPage extends StatelessWidget {
  final Quiz quiz;
  const CongratsPage({Key? key, required this.quiz}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Congrats! You completed the ${quiz.title} quiz",
            textAlign: TextAlign.center,
          ),
          const Divider(),
          Image.asset("assets/congrats.gif"),
          ElevatedButton.icon(
              onPressed: () {
                FirestoreService().updateUserReport(quiz);
                Navigator.pushNamedAndRemoveUntil(
                    context, "/topics", (route) => false);
              },
              label: const Text(" Mark completed!"),
              icon: const Icon(FontAwesomeIcons.check))
        ],
      ),
    );
  }
}
