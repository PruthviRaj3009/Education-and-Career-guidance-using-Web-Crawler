import 'package:flutter/material.dart';
import 'package:careerguidance/utils/email_helper.dart';

/// Contact Support Page
/// 
/// Provides multiple channels for users to contact support team
class ContactSupportScreen extends StatelessWidget {
  const ContactSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Support'),
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            _buildHeader(),
            const SizedBox(height: 24),
            
            // Contact Methods
            _buildContactMethod(
              icon: Icons.email,
              title: 'Email Support',
              subtitle: 'Get help via email',
              description: 'Send us an email and we\'ll respond within 24-48 hours',
              buttonText: 'Send Email',
              buttonColor: Colors.blue,
              onTap: () => EmailHelper.sendContactEmail(context),
            ),
            
            const SizedBox(height: 16),
            
            _buildContactMethod(
              icon: Icons.bug_report,
              title: 'Report a Bug',
              subtitle: 'Found an issue?',
              description: 'Help us improve by reporting bugs or technical issues',
              buttonText: 'Report Bug',
              buttonColor: Colors.red,
              onTap: () => EmailHelper.sendBugReportEmail(context),
            ),
            
            const SizedBox(height: 16),
            
            _buildContactMethod(
              icon: Icons.lightbulb_outline,
              title: 'Feature Request',
              subtitle: 'Have an idea?',
              description: 'Suggest new features or improvements',
              buttonText: 'Suggest Feature',
              buttonColor: Colors.amber,
              onTap: () => EmailHelper.sendFeatureRequestEmail(context),
            ),
            
            const SizedBox(height: 24),
            
            // Contact Information Card
            _buildContactInfoCard(),
            
            const SizedBox(height: 24),
            
            // Response Time Info
            _buildResponseTimeInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple.shade50, Colors.blue.shade50],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(
            Icons.support_agent,
            size: 64,
            color: Colors.purple.shade700,
          ),
          const SizedBox(height: 16),
          const Text(
            'We\'re Here to Help!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Choose a contact method below and our support team will assist you',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildContactMethod({
    required IconData icon,
    required String title,
    required String subtitle,
    required String description,
    required String buttonText,
    required Color buttonColor,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: buttonColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: buttonColor, size: 28),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfoCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.info_outline, color: Colors.purple.shade700),
                const SizedBox(width: 8),
                const Text(
                  'Contact Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            _buildInfoRow(
              Icons.business,
              'Company',
              'INNOVATE SPHERE by Brandkart',
            ),
            const SizedBox(height: 12),
            _buildInfoRow(
              Icons.email,
              'Email',
              EmailHelper.adminEmail,
            ),
            const SizedBox(height: 12),
            _buildInfoRow(
              Icons.location_on,
              'Location',
              'Satara, Maharashtra, India',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.grey.shade600),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildResponseTimeInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.access_time, color: Colors.green.shade700, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Response Time',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'We typically respond to all inquiries within 24-48 hours during business days',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green.shade800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
