import 'package:flutter/material.dart';

/// Terms of Service Page
/// 
/// Legal terms and conditions for using the Career Guidance app
class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Service'),
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
            _buildHeader(),
            const SizedBox(height: 24),
            _buildSection(
              'Acceptance of Terms',
              'By downloading, accessing, or using the Career Guidance mobile application, '
              'you agree to be bound by these Terms of Service. If you do not agree to these '
              'terms, please do not use our app.\n\n'
              'These terms constitute a legally binding agreement between you and INNOVATE SPHERE '
              '(operated by Brandkart). We reserve the right to modify these terms at any time, '
              'and your continued use of the app constitutes acceptance of any changes.',
            ),
            _buildSection(
              'Eligibility',
              'You must be at least 13 years old to use this app. If you are under 18, you '
              'must have permission from a parent or legal guardian.\n\n'
              'By using this app, you represent and warrant that:\n'
              '• You have the legal capacity to enter into these terms\n'
              '• All information you provide is accurate and truthful\n'
              '• You will comply with all applicable laws and regulations',
            ),
            _buildSection(
              'User Account Responsibilities',
              'When you create an account, you agree to:\n\n'
              '• Provide accurate and complete information\n'
              '• Maintain the security of your account credentials\n'
              '• Accept responsibility for all activities under your account\n'
              '• Notify us immediately of any unauthorized access\n'
              '• Not share your account with others\n\n'
              'You are solely responsible for maintaining the confidentiality of your password '
              'and account information.',
            ),
            _buildSection(
              'Acceptable Use',
              'You agree to use the Career Guidance app only for lawful purposes. You must not:\n\n'
              '• Use the app in any way that violates applicable laws or regulations\n'
              '• Attempt to gain unauthorized access to any part of the app\n'
              '• Interfere with or disrupt the app\'s functionality\n'
              '• Upload malicious code, viruses, or harmful content\n'
              '• Impersonate any person or entity\n'
              '• Harass, abuse, or harm other users\n'
              '• Use automated systems (bots) to access the app\n'
              '• Reverse engineer or attempt to extract source code',
            ),
            _buildSection(
              'Intellectual Property Rights',
              'All content, features, and functionality of the Career Guidance app, including '
              'but not limited to text, graphics, logos, icons, images, audio clips, and software, '
              'are the exclusive property of INNOVATE SPHERE or its licensors.\n\n'
              'These materials are protected by copyright, trademark, and other intellectual '
              'property laws. You may not:\n\n'
              '• Copy, modify, or create derivative works\n'
              '• Distribute, sell, or transfer any content\n'
              '• Use our trademarks without permission\n'
              '• Remove or alter any copyright notices',
            ),
            _buildSection(
              'AI-Generated Content Disclaimer',
              'Our app uses AI technology to provide career guidance and recommendations. '
              'You acknowledge and agree that:\n\n'
              '• AI responses are for informational purposes only\n'
              '• Recommendations should not be considered professional career counseling\n'
              '• AI may occasionally produce inaccurate or incomplete information\n'
              '• You should verify important information independently\n'
              '• We are not liable for decisions made based on AI recommendations\n\n'
              'Always consult with qualified career counselors or professionals for important '
              'career decisions.',
            ),
            _buildSection(
              'Third-Party Services',
              'Our app integrates with third-party services including Firebase and OpenAI. '
              'Your use of these services is subject to their respective terms of service:\n\n'
              '• Firebase: https://firebase.google.com/terms\n'
              '• OpenAI: https://openai.com/policies/terms-of-use\n\n'
              'We are not responsible for the availability, accuracy, or content of third-party services.',
            ),
            _buildSection(
              'Limitation of Liability',
              'TO THE FULLEST EXTENT PERMITTED BY LAW:\n\n'
              '• The app is provided "AS IS" without warranties of any kind\n'
              '• We do not guarantee uninterrupted or error-free service\n'
              '• We are not liable for any indirect, incidental, or consequential damages\n'
              '• Our total liability shall not exceed the amount you paid (if any) to use the app\n'
              '• We are not responsible for career decisions or outcomes\n\n'
              'Some jurisdictions do not allow limitation of liability, so these limitations '
              'may not apply to you.',
            ),
            _buildSection(
              'Indemnification',
              'You agree to indemnify and hold harmless INNOVATE SPHERE, Brandkart, and their '
              'affiliates from any claims, damages, losses, liabilities, and expenses (including '
              'legal fees) arising from:\n\n'
              '• Your use of the app\n'
              '• Your violation of these terms\n'
              '• Your violation of any rights of another party\n'
              '• Your content or conduct on the app',
            ),
            _buildSection(
              'Termination',
              'We reserve the right to suspend or terminate your account and access to the app '
              'at any time, with or without notice, for:\n\n'
              '• Violation of these Terms of Service\n'
              '• Fraudulent or illegal activity\n'
              '• Abuse of the service\n'
              '• Extended periods of inactivity\n\n'
              'You may terminate your account at any time through the app settings. Upon '
              'termination, your right to use the app will immediately cease.',
            ),
            _buildSection(
              'Data and Privacy',
              'Your use of the app is subject to our Privacy Policy, which explains how we '
              'collect, use, and protect your personal information. Please review the Privacy '
              'Policy to understand our practices.',
            ),
            _buildSection(
              'Changes to Terms',
              'We may update these Terms of Service from time to time. We will notify you of '
              'material changes by:\n\n'
              '• Posting the updated terms in the app\n'
              '• Sending an email notification\n'
              '• Displaying a prominent notice\n\n'
              'Your continued use after changes become effective constitutes acceptance of the '
              'new terms.',
            ),
            _buildSection(
              'Governing Law',
              'These Terms of Service shall be governed by and construed in accordance with the '
              'laws of India, without regard to conflict of law principles. Any disputes shall '
              'be subject to the exclusive jurisdiction of the courts in Maharashtra, India.',
            ),
            _buildSection(
              'Contact Information',
              'If you have questions about these Terms of Service, please contact us at:\n\n'
              'Email: pruthvirajpawr12.pdp@gmail.com\n'
              'Company: INNOVATE SPHERE by Brandkart\n'
              'Location: Satara, Maharashtra, India',
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
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.gavel, color: Colors.blue.shade700, size: 32),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Terms of Service',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Please read these terms carefully before using Career Guidance App. '
            'By using our service, you agree to these terms.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
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
          const SizedBox(height: 8),
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
