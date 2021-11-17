import 'package:flutter/material.dart';
import 'package:quizapp/models/models.dart';
import 'package:quizapp/services/firestore.dart';
import 'package:quizapp/shared/bottom_nav.dart';
import 'package:quizapp/shared/error_message.dart';
import 'package:quizapp/shared/loading_indicator.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
        future: FirestoreService().getTopics(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasError) {
            return Center(
              child: ErrorMessage(message: snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            var topics = snapshot.data!;

            return Scaffold(
              appBar: AppBar(
                title: const Text("Topics"),
                centerTitle: true,
              ),
              body: GridView.count(
                crossAxisCount: 2,
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                children: topics.map((topic) => Text(topic.title)).toList(),
              ),
              bottomNavigationBar: const BottomNavBar(),
            );
          } else {
            return const Center(
              child: Text("No topics found in Firestore. Check databese"),
            );
          }
        });
  }
}
