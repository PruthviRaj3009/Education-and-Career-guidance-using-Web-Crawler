import 'package:flutter/material.dart';

/// Help Documentation Page
/// 
/// Comprehensive user guide with step-by-step instructions
class HelpDocumentationScreen extends StatelessWidget {
  const HelpDocumentationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Documentation'),
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
            
            // Quick Start Guide
            _buildGuideSection(
              icon: Icons.play_circle_outline,
              title: 'Quick Start Guide',
              color: Colors.green,
              steps: [
                _GuideStep(
                  number: 1,
                  title: 'Create Your Account',
                  description: 'Download the app and sign up with your email address. Verify your email to activate your account.',
                ),
                _GuideStep(
                  number: 2,
                  title: 'Complete Your Profile',
                  description: 'Add your educational background, interests, and career goals to get personalized recommendations.',
                ),
                _GuideStep(
                  number: 3,
                  title: 'Take Assessments',
                  description: 'Complete our career assessment quizzes to discover your strengths and ideal career paths.',
                ),
                _GuideStep(
                  number: 4,
                  title: 'Explore Career Options',
                  description: 'Browse through career recommendations tailored to your profile and interests.',
                ),
                _GuideStep(
                  number: 5,
                  title: 'Chat with AI Assistant',
                  description: 'Ask questions and get personalized career guidance from our AI chatbot anytime.',
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Using the AI Chatbot
            _buildFeatureSection(
              icon: Icons.smart_toy,
              title: 'Using the AI Chatbot',
              color: Colors.purple,
              content: [
                _FeaturePoint(
                  title: 'Starting a Conversation',
                  description: 'Navigate to the "Scope of Growth" section from the home screen. The chatbot interface will open with a text input field.',
                ),
                _FeaturePoint(
                  title: 'Asking Questions',
                  description: 'Type your career-related questions in the text box. You can ask about:\n• Career paths for specific fields\n• Required skills and qualifications\n• Educational requirements\n• Industry trends and opportunities\n• Work-life balance in different careers',
                ),
                _FeaturePoint(
                  title: 'Getting Better Responses',
                  description: 'For more accurate answers, be specific in your questions. Instead of "What career should I choose?", try "What careers are available in computer science for someone interested in AI?"',
                ),
                _FeaturePoint(
                  title: 'Conversation History',
                  description: 'Your conversation history is saved during your session, allowing you to refer back to previous responses.',
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Taking Assessments
            _buildFeatureSection(
              icon: Icons.quiz,
              title: 'Career Assessments',
              color: Colors.blue,
              content: [
                _FeaturePoint(
                  title: 'Accessing Assessments',
                  description: 'Tap the "Aptitude Assessment" card on the home screen to begin your career assessment.',
                ),
                _FeaturePoint(
                  title: 'Completing the Quiz',
                  description: 'Answer all questions honestly. There are no right or wrong answers - the assessment is designed to understand your preferences and strengths.',
                ),
                _FeaturePoint(
                  title: 'Understanding Results',
                  description: 'After completing the assessment, you\'ll receive:\n• Career recommendations based on your responses\n• Skills assessment breakdown\n• Suggested career paths\n• Next steps for your career journey',
                ),
                _FeaturePoint(
                  title: 'Retaking Assessments',
                  description: 'You can retake assessments at any time to update your results as your interests evolve.',
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Account Management
            _buildFeatureSection(
              icon: Icons.account_circle,
              title: 'Account Management',
              color: Colors.orange,
              content: [
                _FeaturePoint(
                  title: 'Updating Profile',
                  description: 'Access your profile from the sidebar menu. You can update your personal information, educational background, and career interests.',
                ),
                _FeaturePoint(
                  title: 'Changing Password',
                  description: 'Go to Settings > Account > Change Password. You\'ll need to enter your current password and choose a new one.',
                ),
                _FeaturePoint(
                  title: 'Email Verification',
                  description: 'If you haven\'t verified your email, check your inbox for the verification link. Click the link to activate all features.',
                ),
                _FeaturePoint(
                  title: 'Deleting Account',
                  description: 'Go to Settings > Account > Delete Account. This action is permanent and will remove all your data within 30 days.',
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // App Settings
            _buildFeatureSection(
              icon: Icons.settings,
              title: 'App Settings',
              color: Colors.teal,
              content: [
                _FeaturePoint(
                  title: 'Theme Settings',
                  description: 'Toggle between light and dark mode from the sidebar menu for comfortable viewing at any time of day.',
                ),
                _FeaturePoint(
                  title: 'Notifications',
                  description: 'Manage your notification preferences in device settings. Control when and how you receive updates from the app.',
                ),
                _FeaturePoint(
                  title: 'Language',
                  description: 'The app currently supports English. More languages may be added in future updates.',
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Tips & Best Practices
            _buildTipsSection(),
            
            const SizedBox(height: 24),
            
            // Troubleshooting
            _buildTroubleshootingSection(),
            
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
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(
            Icons.menu_book,
            size: 64,
            color: Colors.purple.shade700,
          ),
          const SizedBox(height: 16),
          const Text(
            'Help & Documentation',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Everything you need to know about using Career Guidance App',
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

  Widget _buildGuideSection({
    required IconData icon,
    required String title,
    required Color color,
    required List<_GuideStep> steps,
  }) {
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
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ...steps.asMap().entries.map((entry) {
              final isLast = entry.key == steps.length - 1;
              return _buildStepItem(entry.value, color, isLast);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildStepItem(_GuideStep step, Color color, bool isLast) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${step.number}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 60,
                color: color.withOpacity(0.3),
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: isLast ? 0 : 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  step.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureSection({
    required IconData icon,
    required String title,
    required Color color,
    required List<_FeaturePoint> content,
  }) {
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
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...content.map((point) => _buildFeaturePoint(point)),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturePoint(_FeaturePoint point) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            point.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            point.description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipsSection() {
    return Card(
      elevation: 2,
      color: Colors.amber.shade50,
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
                Icon(Icons.tips_and_updates, color: Colors.amber.shade700, size: 24),
                const SizedBox(width: 12),
                const Text(
                  'Tips & Best Practices',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildTipItem('Complete all assessment questions for more accurate career recommendations'),
            _buildTipItem('Update your profile regularly as your interests and goals evolve'),
            _buildTipItem('Use specific questions when chatting with the AI for better responses'),
            _buildTipItem('Explore multiple career paths before making final decisions'),
            _buildTipItem('Save important chat conversations for future reference'),
          ],
        ),
      ),
    );
  }

  Widget _buildTipItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, size: 20, color: Colors.amber.shade700),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTroubleshootingSection() {
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
                Icon(Icons.build_circle_outlined, color: Colors.red.shade700, size: 24),
                const SizedBox(width: 12),
                const Text(
                  'Troubleshooting',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildTroubleshootItem(
              'App crashes or freezes',
              'Restart the app and clear the cache. If the issue persists, reinstall the app or contact support.',
            ),
            _buildTroubleshootItem(
              'Can\'t log in',
              'Ensure you\'re using the correct email and password. Try the "Forgot Password" option if needed.',
            ),
            _buildTroubleshootItem(
              'Chat not responding',
              'Check your internet connection. The AI chatbot requires an active internet connection to function.',
            ),
            _buildTroubleshootItem(
              'Assessment not loading',
              'Refresh the page or restart the app. Ensure you have a stable internet connection.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTroubleshootItem(String problem, String solution) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            problem,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            solution,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}

class _GuideStep {
  final int number;
  final String title;
  final String description;

  _GuideStep({
    required this.number,
    required this.title,
    required this.description,
  });
}

class _FeaturePoint {
  final String title;
  final String description;

  _FeaturePoint({
    required this.title,
    required this.description,
  });
}
