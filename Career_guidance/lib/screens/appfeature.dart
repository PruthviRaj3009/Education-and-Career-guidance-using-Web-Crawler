import 'package:flutter/material.dart';
import 'package:careerguidance/screens/gptpage.dart';

class AppFeaturesScreen extends StatelessWidget {
  const AppFeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Info"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Key Features',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            FeatureTile(
              number: '1',
              title: 'Career Assessment Quiz',
              description:
                  'Users can take a comprehensive quiz to identify their strengths, interests, and goals.',
            ),
            FeatureTile(
              number: '2',
              title: 'Career Exploration',
              description:
                  'Explore various career paths and gain information of that career patha and how to achive it.',
            ),
            FeatureTile(
              number: '3',
              title: 'Integrated Chatbot',
              description:
                  'A chatbot that makes your career guidance business easy to manage. Ditch the age-old forms and calls and switch to a rather innovative way of helping candidates.',
            ),
            FeatureTile(
              number: '4',
              title: 'Personalized Recommendations',
              description:
                  'Receive personalized recommendations based on quiz results and interests.',
            ),
            Center(
              child: Container(
                width: 200,
                child: Positioned(
                  bottom: 20,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChatPage()));
                    },
                    child: const Text(
                      "Career Discussion",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureTile extends StatelessWidget {
  final String number;
  final String title;
  final String description;

  const FeatureTile({
    required this.number,
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 198, 87, 218),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.0,
            backgroundColor: const Color.fromARGB(255, 52, 149, 227),
            child: Text(
              number,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 15.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5.0),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16.0, height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
