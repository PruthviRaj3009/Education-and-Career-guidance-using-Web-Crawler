import 'package:flutter/material.dart';
import 'package:careerguidance/screens/privacyP.dart';
import 'package:careerguidance/screens/terms_of_service.dart';

class AppInfoScreen extends StatelessWidget {
  const AppInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Info"),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Career Guidance App',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Version: 1.0.0',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Package Name: INNOVATE SPHERE.careerguidance',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'About the App',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'This app is designed to help users assess their skills, interests, and aspirations to make informed decisions about their future careers. Through a series of questions and activities, users can explore various career paths and educational opportunities.',
              style: TextStyle(fontSize: 18.0, height: 1.5),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Developer Information',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Developer: INNOVATE SPHERE VENTURE BY BRANDKART',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5.0),
                const Text(
                  'Contact: pruthvirajpawr12.pdp@gmail.com',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Key Features',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            const Text(
              '- Personalized career advice\n'
              '- Information on various professions\n'
              '- Access to career counseling services\n'
              '- Career quizzes and assessments\n',
              style: TextStyle(fontSize: 18.0, height: 1.5),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Permissions',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            const Text(
              '- Internet Access\n'
              '- Storage Access (if you are saving any data locally)',
              style: TextStyle(fontSize: 18.0, height: 1.5),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Privacy Policy and Terms of Service',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen()),
              ),
              child: const Text(
                'Privacy Policy',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.blue,
                    decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(height: 5.0),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TermsOfServiceScreen()),
              ),
              child: const Text(
                'Terms of Service',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.blue,
                    decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
