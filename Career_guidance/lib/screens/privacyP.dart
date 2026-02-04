import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Career Guidance App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CopyrightNoticePage(),
    );
  }
}

class CopyrightNoticePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Copyright Notice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Intellectual Property Rights',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'The content, design, graphics, and other materials on this career guidance app are protected by copyright, trademark, and other intellectual property laws. The rights are owned by or licensed to us, unless otherwise stated.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Use of Content',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Users are granted a limited, non-exclusive, non-transferable license to access and use the app and its content for personal, non-commercial purposes only. Any other use, including reproduction, modification, distribution, transmission, republication, display, or performance of the content on this app is strictly prohibited without our prior written consent.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Infringement',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'If you believe that any content on our app infringes your copyright or other intellectual property rights, please contact us with the following information:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              BulletPoint(
                  text:
                      'A description of the copyrighted work or other intellectual property that you claim has been infringed.'),
              BulletPoint(
                  text:
                      'A description of where the material that you claim is infringing is located on the app.'),
              BulletPoint(
                  text: 'Your address, telephone number, and email address.'),
              BulletPoint(
                  text:
                      'A statement by you that you have a good-faith belief that the disputed use is not authorized by the copyright owner, its agent, or the law.'),
              BulletPoint(
                  text:
                      'A statement by you, made under penalty of perjury, that the above information in your notice is accurate and that you are the copyright or intellectual property owner or authorized to act on the copyright or intellectual property owner\'s behalf.'),
              SizedBox(height: 16),
              Text(
                'Contact Information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'For any copyright-related issues, please contact us at:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Email: [brandkart2015@gmail.com]\n'
                'Address: [INNOVATE SPAHERE venture by BRANDKARTT,at.post Satara, Dist. Satara MH, 415004]\n',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;

  BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(fontSize: 16)),
          Expanded(child: Text(text, style: TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
