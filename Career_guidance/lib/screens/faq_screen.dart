import 'package:flutter/material.dart';

/// FAQ (Frequently Asked Questions) Page
/// 
/// Provides answers to common user questions in an expandable format
class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frequently Asked Questions'),
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
            
            // Search Box
            _buildSearchBox(),
            const SizedBox(height: 24),
            
            // FAQ Categories
            _buildCategorySection(
              'Getting Started',
              Icons.rocket_launch,
              Colors.purple,
              [
                _FAQItem(
                  question: 'What is Career Guidance App?',
                  answer: 'Career Guidance is an AI-powered mobile application designed to help students and professionals make informed career decisions. We provide personalized recommendations, interactive assessments, and 24/7 AI assistance to guide you on your professional journey.',
                ),
                _FAQItem(
                  question: 'How do I create an account?',
                  answer: 'Simply download the app and tap "Sign Up". Enter your email address, create a password, and verify your email. Once verified, you can start using all features of the app.',
                ),
                _FAQItem(
                  question: 'Is the app free to use?',
                  answer: 'Yes, Career Guidance App is completely free to use. All features including the AI chatbot, assessments, and career recommendations are available at no cost.',
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            _buildCategorySection(
              'Features & Functionality',
              Icons.star,
              Colors.amber,
              [
                _FAQItem(
                  question: 'How does the AI chatbot work?',
                  answer: 'Our AI chatbot uses advanced language models to understand your questions and provide personalized career guidance. Simply type your question about careers, education, or professional development, and the AI will provide helpful insights and recommendations.',
                ),
                _FAQItem(
                  question: 'What are career assessments?',
                  answer: 'Career assessments are interactive quizzes designed to evaluate your skills, interests, and personality traits. Based on your responses, we provide personalized career recommendations that match your profile.',
                ),
                _FAQItem(
                  question: 'How accurate are the career recommendations?',
                  answer: 'Our recommendations are based on comprehensive assessments and AI analysis. While they provide valuable insights, we encourage you to use them as a guide alongside your own research and consultation with career counselors.',
                ),
                _FAQItem(
                  question: 'Can I retake the assessments?',
                  answer: 'Yes! You can retake any assessment as many times as you like. Your most recent results will be used for career recommendations.',
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            _buildCategorySection(
              'Account & Privacy',
              Icons.security,
              Colors.green,
              [
                _FAQItem(
                  question: 'How is my data protected?',
                  answer: 'We take your privacy seriously. All data is encrypted during transmission and storage. We use Firebase Authentication and follow industry-standard security practices. See our Privacy Policy for detailed information.',
                ),
                _FAQItem(
                  question: 'Can I delete my account?',
                  answer: 'Yes, you can delete your account at any time from the Settings page. This will permanently remove all your data from our servers within 30 days.',
                ),
                _FAQItem(
                  question: 'Who can see my assessment results?',
                  answer: 'Your assessment results are private and visible only to you. We do not share your personal information or results with third parties without your explicit consent.',
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            _buildCategorySection(
              'Technical Support',
              Icons.build,
              Colors.blue,
              [
                _FAQItem(
                  question: 'The app is not working properly. What should I do?',
                  answer: 'First, try restarting the app. If the issue persists, check your internet connection and ensure you have the latest version of the app. If problems continue, contact our support team through the Contact Support page.',
                ),
                _FAQItem(
                  question: 'Why am I not receiving notifications?',
                  answer: 'Go to your device Settings > Apps > Career Guidance > Notifications and ensure notifications are enabled. Also check that you have enabled notifications in the app settings.',
                ),
                _FAQItem(
                  question: 'Which devices are supported?',
                  answer: 'Career Guidance App supports Android devices running Android 5.0 (API level 21) or higher. We also have web support for desktop access.',
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            _buildCategorySection(
              'Other Questions',
              Icons.help_outline,
              Colors.orange,
              [
                _FAQItem(
                  question: 'How often is the content updated?',
                  answer: 'We regularly update our career information, assessment questions, and AI training data to ensure you receive the most current and relevant guidance.',
                ),
                _FAQItem(
                  question: 'Can I use the app offline?',
                  answer: 'Some features like viewing saved results work offline, but most features including the AI chatbot require an internet connection for the best experience.',
                ),
                _FAQItem(
                  question: 'How can I provide feedback?',
                  answer: 'We love hearing from our users! You can provide feedback through the "Rate Our App" feature or contact us directly through the Contact Support page.',
                ),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Still Have Questions Card
            _buildStillHaveQuestionsCard(context),
            
            const SizedBox(height: 16),
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
            Icons.quiz,
            size: 64,
            color: Colors.purple.shade700,
          ),
          const SizedBox(height: 16),
          const Text(
            'Frequently Asked Questions',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Find answers to common questions about Career Guidance App',
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

  Widget _buildSearchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey.shade600),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search FAQs...',
                hintStyle: TextStyle(color: Colors.grey.shade500),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                // TODO: Implement search functionality
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySection(
    String title,
    IconData icon,
    Color color,
    List<_FAQItem> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...items.map((item) => _buildFAQCard(item, color)),
      ],
    );
  }

  Widget _buildFAQCard(_FAQItem item, Color accentColor) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Theme(
        data: ThemeData(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          title: Text(
            item.question,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          iconColor: accentColor,
          collapsedIconColor: Colors.grey.shade600,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                item.answer,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.6,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStillHaveQuestionsCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.purple, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.contact_support,
            size: 48,
            color: Colors.white,
          ),
          const SizedBox(height: 16),
          const Text(
            'Still Have Questions?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Can\'t find what you\'re looking for? Our support team is here to help!',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Go back to support screen
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.purple,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Contact Support',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FAQItem {
  final String question;
  final String answer;

  _FAQItem({required this.question, required this.answer});
}
