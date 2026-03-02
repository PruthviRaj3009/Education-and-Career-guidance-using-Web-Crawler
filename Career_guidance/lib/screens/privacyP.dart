import 'package:flutter/material.dart';

/// Professional Privacy Policy Page
/// 
/// Comprehensive privacy policy with all required sections for a
/// production Flutter application
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            _buildHeader(),
            const SizedBox(height: 24),
            
            // Information We Collect
            _buildSection(
              icon: Icons.info_outline,
              title: 'Information We Collect',
              content: [
                _buildSubsection(
                  'Personal Information',
                  'We collect information that you provide directly to us, including:\n\n'
                  '• Account information (name, email address, password)\n'
                  '• Profile information (educational background, career interests)\n'
                  '• Quiz and assessment responses\n'
                  '• Feedback and communication with our support team',
                ),
                _buildSubsection(
                  'Automatically Collected Information',
                  'When you use our app, we automatically collect certain information:\n\n'
                  '• Device information (model, operating system, unique identifiers)\n'
                  '• Usage data (features accessed, time spent, interaction patterns)\n'
                  '• Log data (IP address, browser type, access times)\n'
                  '• Analytics data to improve our services',
                ),
              ],
            ),
            
            // How We Use Your Data
            _buildSection(
              icon: Icons.psychology_outlined,
              title: 'How We Use Your Data',
              content: [
                _buildBulletList([
                  'Provide personalized career guidance and recommendations',
                  'Improve and optimize our AI chatbot responses',
                  'Send you important updates and notifications',
                  'Analyze usage patterns to enhance user experience',
                  'Prevent fraud and ensure platform security',
                  'Comply with legal obligations and enforce our Terms of Service',
                ]),
              ],
            ),
            
            // Data Protection
            _buildSection(
              icon: Icons.security,
              title: 'Data Protection & Security',
              content: [
                _buildParagraph(
                  'We take the security of your personal information seriously and implement '
                  'industry-standard measures to protect your data:\n\n'
                  '• Encryption: All data transmitted between your device and our servers is encrypted using SSL/TLS protocols\n'
                  '• Secure Storage: Your data is stored on secure Firebase servers with restricted access\n'
                  '• Authentication: We use Firebase Authentication with secure password hashing\n'
                  '• Access Controls: Only authorized personnel have access to user data\n'
                  '• Regular Audits: We conduct regular security assessments and updates',
                ),
              ],
            ),
            
            // Third-Party Services
            _buildSection(
              icon: Icons.share,
              title: 'Third-Party Services',
              content: [
                _buildParagraph(
                  'Our app integrates with the following third-party services that may '
                  'collect and process your data:',
                ),
                _buildSubsection(
                  'Firebase (Google)',
                  'We use Firebase for authentication, cloud storage, and analytics. '
                  'Firebase may collect device information, usage data, and analytics data.\n'
                  'Privacy Policy: https://firebase.google.com/support/privacy',
                ),
                _buildSubsection(
                  'OpenAI API',
                  'We use OpenAI\'s API to power our AI chatbot. Your chat conversations '
                  'are processed by OpenAI to generate responses.\n'
                  'Privacy Policy: https://openai.com/policies/privacy-policy',
                ),
                _buildSubsection(
                  'Analytics Services',
                  'We may use analytics tools to understand how users interact with our app '
                  'and improve our services.',
                ),
              ],
            ),
            
            // Data Sharing
            _buildSection(
              icon: Icons.people_outline,
              title: 'Data Sharing & Disclosure',
              content: [
                _buildParagraph(
                  'We do not sell, trade, or rent your personal information to third parties. '
                  'We may share your information only in the following circumstances:',
                ),
                _buildBulletList([
                  'With Service Providers: Trusted third-party services that help us operate our app (e.g., Firebase, OpenAI)',
                  'Legal Requirements: When required by law, court order, or government authority',
                  'Business Transfers: In the event of a merger, acquisition, or sale of assets',
                  'With Your Consent: When you explicitly authorize us to share your information',
                  'To Protect Rights: To protect the rights, property, or safety of our users or others',
                ]),
              ],
            ),
            
            // Your Rights
            _buildSection(
              icon: Icons.verified_user,
              title: 'Your Rights & Choices',
              content: [
                _buildParagraph(
                  'You have the following rights regarding your personal information:',
                ),
                _buildBulletList([
                  'Access: Request a copy of the personal data we hold about you',
                  'Correction: Request correction of inaccurate or incomplete data',
                  'Deletion: Request deletion of your account and associated data',
                  'Portability: Request your data in a portable format',
                  'Withdraw Consent: Opt-out of certain data processing activities',
                  'Object: Object to processing of your data for specific purposes',
                ]),
                _buildParagraph(
                  '\nTo exercise any of these rights, please contact us at pruthvirajpawr12.pdp@gmail.com',
                ),
              ],
            ),
            
            // Data Retention
            _buildSection(
              icon: Icons.schedule,
              title: 'Data Retention',
              content: [
                _buildParagraph(
                  'We retain your personal information for as long as necessary to provide '
                  'our services and fulfill the purposes outlined in this policy:\n\n'
                  '• Account data: Retained while your account is active\n'
                  '• Usage data: Typically retained for 12-24 months\n'
                  '• Legal data: Retained as required by applicable laws\n\n'
                  'When you delete your account, we will delete or anonymize your personal '
                  'information within 30 days, except where we are legally required to retain it.',
                ),
              ],
            ),
            
            // Children's Privacy
            _buildSection(
              icon: Icons.child_care,
              title: 'Children\'s Privacy',
              content: [
                _buildParagraph(
                  'Our service is not directed to children under the age of 13. We do not '
                  'knowingly collect personal information from children under 13. If you are '
                  'a parent or guardian and believe your child has provided us with personal '
                  'information, please contact us immediately, and we will delete such information.',
                ),
              ],
            ),
            
            // International Users
            _buildSection(
              icon: Icons.public,
              title: 'International Data Transfers',
              content: [
                _buildParagraph(
                  'Your information may be transferred to and processed in countries other '
                  'than your country of residence. These countries may have data protection '
                  'laws that differ from your jurisdiction. By using our service, you consent '
                  'to the transfer of your information to our servers and third-party service '
                  'providers located globally.',
                ),
              ],
            ),
            
            // Changes to Policy
            _buildSection(
              icon: Icons.update,
              title: 'Changes to This Policy',
              content: [
                _buildParagraph(
                  'We may update this Privacy Policy from time to time to reflect changes '
                  'in our practices or for legal, operational, or regulatory reasons. We will '
                  'notify you of any material changes by:\n\n'
                  '• Posting the updated policy in the app\n'
                  '• Sending you an email notification\n'
                  '• Displaying a prominent notice in the app\n\n'
                  'Your continued use of the app after changes become effective constitutes '
                  'acceptance of the updated policy.',
                ),
              ],
            ),
            
            // Contact Information
            _buildSection(
              icon: Icons.contact_mail,
              title: 'Contact Us',
              content: [
                _buildParagraph(
                  'If you have any questions, concerns, or requests regarding this Privacy '
                  'Policy or our data practices, please contact us:',
                ),
                _buildContactInfo(),
              ],
            ),
            
            const SizedBox(height: 16),
            _buildLastUpdated(),
            const SizedBox(height: 32),
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
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.purple.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.privacy_tip, color: Colors.purple.shade700, size: 32),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Privacy Policy',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple.shade900,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Career Guidance App is committed to protecting your privacy and ensuring '
            'the security of your personal information. This Privacy Policy explains how '
            'we collect, use, share, and protect your data when you use our mobile application.',
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Colors.grey.shade800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required IconData icon,
    required String title,
    required List<Widget> content,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: Colors.purple.shade700, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...content,
        ],
      ),
    );
  }

  Widget _buildSubsection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            content,
            style: TextStyle(
              fontSize: 14,
              height: 1.6,
              color: Colors.grey.shade800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          height: 1.6,
          color: Colors.grey.shade800,
        ),
      ),
    );
  }

  Widget _buildBulletList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('• ', style: TextStyle(fontSize: 14, color: Colors.grey.shade800)),
              Expanded(
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildContactInfo() {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildContactRow(Icons.business, 'INNOVATE SPHERE by Brandkart'),
          _buildContactRow(Icons.email, 'pruthvirajpawr12.pdp@gmail.com'),
          _buildContactRow(Icons.location_on, 'Satara, Maharashtra, India 415004'),
        ],
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.purple.shade700),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLastUpdated() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.amber.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.calendar_today, size: 16, color: Colors.amber.shade900),
          const SizedBox(width: 8),
          Text(
            'Last Updated: March 3, 2026',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.amber.shade900,
            ),
          ),
        ],
      ),
    );
  }
}
