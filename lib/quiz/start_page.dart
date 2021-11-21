import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/models/models.dart';
import 'package:quizapp/quiz/quiz_state.dart';

class StartPage extends StatelessWidget {
  final Quiz quiz;
  const StartPage({Key? key, required this.quiz}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<QuizState>(context);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            quiz.title,
            style: Theme.of(context).textTheme.headline4,
          ),
          const Divider(),
          Expanded(child: Text(quiz.description)),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: state.nextPage,
                label: const Text("Start quiz!"),
                icon: const Icon(Icons.pool),
              )
            ],
          ),
        ],
      ),
    );
  }
}
