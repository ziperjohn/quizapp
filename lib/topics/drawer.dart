import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/models/models.dart';

class TopicDrawer extends StatelessWidget {
  final List<Topic> topics;
  const TopicDrawer({Key? key, required this.topics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView.separated(
      shrinkWrap: true,
      itemCount: topics.length,
      itemBuilder: (BuildContext context, int index) {
        Topic topic = topics[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                topic.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
            ),
            QuizList(topic: topic),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    ));
  }
}

class QuizList extends StatelessWidget {
  final Topic topic;
  const QuizList({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: topic.quizzes.map((quiz) {
        return Card(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          elevation: 4,
          margin: const EdgeInsets.all(4),
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                title: Text(
                  quiz.title,
                ),
                subtitle: Text(quiz.description),
                // leading: QuizBadge(topic: topic, quizId: quiz.id),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

// class QuizBadge extends StatelessWidget {
//   final Topic topic;
//   final String quizId;
//   const QuizBadge({Key? key, required this.topic, required this.quizId})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Report report = Provider.of<Report>(context);

//     return Container();
//   }
// }
