import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/models/models.dart';
import 'package:quizapp/quiz/quiz_state.dart';

class QuestionPage extends StatelessWidget {
  final Question question;
  const QuestionPage({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<QuizState>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Text(question.text),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: question.options.map((opt) {
              return Container(
                height: 90,
                margin: const EdgeInsets.only(bottom: 10),
                color: Colors.black26,
                child: InkWell(
                  onTap: () {
                    state.selected = opt;
                    _bottomSheet(context, opt, state);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(
                          state.selected == opt
                              ? FontAwesomeIcons.checkCircle
                              : FontAwesomeIcons.circle,
                          size: 30,
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 16),
                            child: Text(
                              opt.value,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }

  _bottomSheet(BuildContext context, Option opt, QuizState state) {
    bool correct = opt.correct;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 250,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(correct ? "Good job!" : "Wrong"),
                Text(
                  opt.detail,
                  style: const TextStyle(fontSize: 18, color: Colors.white54),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: correct ? Colors.green : Colors.red),
                    onPressed: () {
                      if (correct) {
                        state.nextPage();
                      }
                      Navigator.pop(context);
                    },
                    child: Text(
                      correct ? "Onward!" : "Try again",
                      style: const TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          );
        });
  }
}
