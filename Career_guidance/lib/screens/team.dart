import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  Widget _buildTeamMemberCard(
    BuildContext context,
    String imagePath,
    String name,
    String dob,
    String gender,
    String address,
    String email,
    String contact,
    //String placement,
    List<String> information,
  ) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildInfoRow(Icons.cake, 'Date of Birth', dob),
            _buildInfoRow(Icons.person, 'Gender', gender),
            _buildInfoRow(Icons.home, 'Permanent Address', address),
            _buildInfoRow(Icons.email, 'E-Mail', email),
            _buildInfoRow(Icons.phone, 'Mobile/Contact No.', contact),
            //_buildInfoRow(Icons.work, 'Placement Details', placement),
            const SizedBox(height: 10),
            const Text(
              'working on:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            ...information.map((info) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    info,
                    style: const TextStyle(fontSize: 14),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(icon, color: Colors.purpleAccent),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '$label: $value',
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: const Text("About Team"),
        gradient: const LinearGradient(
          colors: [Colors.purple, Colors.blue],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // Container(
            //   height: 50,
            //   width: 50,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     image:
            //         DecorationImage(image: AssetImage('assets\tanishka.jpg')),
            //   ),
            // ),
            _buildTeamMemberCard(
              context,
              "assets/tanishka.jpg",
              "Tanishka Pramod Rakte",
              "21/04/2002",
              "Female",
              "Balaji Nagar, Pune",
              "tanishkarakte@gmail.com",
              "84460 52977",
              // "Placed at HSBC",
              [
                "working on backend development that is Supervisor learning Algorithms, web crwler and web scraper technology"
              ],
            ),
            const SizedBox(height: 20),
            _buildTeamMemberCard(
              context,
              "assets/20240504_140051.jpg",
              "Prathamesh Dnyaneshwar Pawar",
              "17/02/2002",
              "Male",
              "Khandala, Satara",
              "prathamesh.research1702@gmail.com",
              "86983 80351",
              //"M.Tech",
              [
                "working on tha frontend development in flutter, as well as the working on tha backend development part of Application",
              ],
            ),
            const SizedBox(height: 20),
            _buildTeamMemberCard(
              context,
              "assets/kunal.jpg",
              "Kunal Vitthal Shinde",
              "14/04/2002",
              "Male",
              "Satara, Satara",
              "thekunalshinde@gmail.com",
              "76203 97194",
              //"Placed at Tech Mahindra",
              [
                " working on data bases algorithm traning, web crawler, web scraper technology",
              ],
            ),
          ],
        ),
      ),
    );
  }
}
