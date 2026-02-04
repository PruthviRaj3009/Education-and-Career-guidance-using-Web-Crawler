import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: const Text("App Info"),
        gradient: const LinearGradient(
          colors: [Colors.purple, Colors.blue],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const Icon(
                  Icons.info,
                  color: Colors.purpleAccent,
                  size: 50,
                ),
                const SizedBox(height: 10),
                const Text(
                  "INNOVATE SPHERE Venture by brandkart which is IT/It servies Company based at Satara.At Innovate Sphere IT Solutions, we offer a diverse range of IT consulting services tailored to meet the dynamic needs of modern businesses. Our team of experienced IT professionals is dedicated to delivering innovative solutions that drive efficiency, enhance productivity, and elevate your technological capabilities."
                  "'contact mail': brandkart@gmail.com",
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
