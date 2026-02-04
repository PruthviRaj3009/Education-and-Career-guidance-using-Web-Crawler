import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support'),
        backgroundColor: const Color.fromARGB(255, 209, 85, 231),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'How can we help you?',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to contact support screen or perform an action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 218, 135, 232),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Contact Support',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Color.fromARGB(255, 252, 252, 253),
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to FAQs screen or perform an action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 218, 135, 232),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'FAQs',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Color.fromARGB(255, 252, 252, 253),
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to help documentation or perform an action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 218, 135, 232),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Help Documentation',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Color.fromARGB(255, 252, 252, 253),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
