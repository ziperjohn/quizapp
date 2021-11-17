import 'package:flutter/material.dart';
import 'package:quizapp/models/models.dart';

class TopicDetail extends StatelessWidget {
  final Topic topic;
  const TopicDetail({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Hero(
            tag: topic.img,
            child: Image.asset(
              "assets/covers/${topic.img}",
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Text(
            topic.title,
            style: const TextStyle(
              height: 2,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
