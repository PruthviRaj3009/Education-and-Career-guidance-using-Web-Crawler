import 'package:flutter/material.dart';
import 'package:careerguidance/utils/email_helper.dart';

/// Professional About Us page for Career Guidance application
/// 
/// Features:
/// - App introduction and purpose
/// - Mission & Vision statements
/// - Key features showcase
/// - Technology stack display
/// - Developer/Team information
/// - Contact and feedback section
class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
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
        child: Column(
          children: [
            // Hero Section
            _buildHeroSection(context, isDark),
            
            // Main Content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildIntroductionSection(context),
                  const SizedBox(height: 24),
                  _buildMissionVisionSection(context),
                  const SizedBox(height: 24),
                  _buildFeaturesSection(context),
                  const SizedBox(height: 24),
                  _buildTechnologyStackSection(context),
                  const SizedBox(height: 24),
                  _buildTeamSection(context),
                  const SizedBox(height: 24),
                  _buildValuesSection(context),
                  const SizedBox(height: 24),
                  _buildContactSection(context),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Hero Section with App Logo/Icon
  Widget _buildHeroSection(BuildContext context, bool isDark) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.purple.shade700,
            Colors.blue.shade600,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Icon(
              Icons.school_rounded,
              size: 64,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Career Guidance',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Your AI-Powered Path to Success',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  // Introduction Section
  Widget _buildIntroductionSection(BuildContext context) {
    return _buildSectionCard(
      context: context,
      icon: Icons.info_outline,
      iconColor: Colors.blue,
      title: 'About Our App',
      child: const Text(
        'Career Guidance is an innovative mobile application designed to empower students '
        'and professionals in making informed career decisions. Leveraging cutting-edge '
        'AI technology, we provide personalized career recommendations, educational resources, '
        'and real-time assistance to help you navigate your professional journey with confidence.\n\n'
        'Whether you\'re a student exploring career options, a professional seeking growth, '
        'or someone planning a career transition, our intelligent platform offers the guidance '
        'you need to achieve your goals.',
        style: TextStyle(
          fontSize: 15,
          height: 1.6,
        ),
      ),
    );
  }

  // Mission & Vision Section
  Widget _buildMissionVisionSection(BuildContext context) {
    return _buildSectionCard(
      context: context,
      icon: Icons.flag_outlined,
      iconColor: Colors.deepPurple,
      title: 'Our Mission & Vision',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMissionVisionItem(
            icon: Icons.rocket_launch,
            title: 'Mission',
            description: 'To democratize career guidance by providing accessible, '
                'AI-powered tools that help individuals discover their true potential '
                'and make informed career decisions.',
            color: Colors.purple,
          ),
          const SizedBox(height: 16),
          _buildMissionVisionItem(
            icon: Icons.visibility_outlined,
            title: 'Vision',
            description: 'To become the world\'s most trusted career guidance platform, '
                'empowering millions of individuals to achieve their professional dreams '
                'through technology and personalized support.',
            color: Colors.blue,
          ),
          const SizedBox(height: 16),
          _buildMissionVisionItem(
            icon: Icons.favorite_outline,
            title: 'Value for Users',
            description: 'Save time, reduce uncertainty, and gain confidence in your career '
                'decisions with personalized AI recommendations, comprehensive resources, '
                'and 24/7 intelligent assistance.',
            color: Colors.teal,
          ),
        ],
      ),
    );
  }

  Widget _buildMissionVisionItem({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Features Section
  Widget _buildFeaturesSection(BuildContext context) {
    return _buildSectionCard(
      context: context,
      icon: Icons.stars,
      iconColor: Colors.amber,
      title: 'Key Features',
      child: Column(
        children: [
          _buildFeatureItem(
            icon: Icons.smart_toy,
            title: 'AI-Powered Chatbot',
            description: 'Get instant career guidance with our intelligent AI assistant '
                'powered by advanced language models.',
            gradient: const LinearGradient(
              colors: [Colors.purple, Colors.deepPurple],
            ),
          ),
          _buildFeatureItem(
            icon: Icons.psychology,
            title: 'Personalized Recommendations',
            description: 'Receive tailored career suggestions based on your skills, '
                'interests, and goals through smart assessments.',
            gradient: const LinearGradient(
              colors: [Colors.blue, Colors.cyan],
            ),
          ),
          _buildFeatureItem(
            icon: Icons.quiz,
            title: 'Interactive Assessments',
            description: 'Discover your strengths and potential career paths with '
                'comprehensive quizzes and evaluations.',
            gradient: const LinearGradient(
              colors: [Colors.teal, Colors.green],
            ),
          ),
          _buildFeatureItem(
            icon: Icons.library_books,
            title: 'Educational Resources',
            description: 'Access curated learning materials, guides, and resources '
                'to enhance your professional development.',
            gradient: const LinearGradient(
              colors: [Colors.orange, Colors.deepOrange],
            ),
          ),
          _buildFeatureItem(
            icon: Icons.auto_awesome,
            title: 'Modern User Interface',
            description: 'Enjoy a sleek, intuitive design with dark mode support '
                'and smooth animations for the best user experience.',
            gradient: const LinearGradient(
              colors: [Colors.pink, Colors.purple],
            ),
          ),
          _buildFeatureItem(
            icon: Icons.cloud,
            title: 'Cloud-Powered Backend',
            description: 'Secure authentication and real-time data sync powered '
                'by Firebase for reliable performance.',
            gradient: const LinearGradient(
              colors: [Colors.indigo, Colors.blue],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String title,
    required String description,
    required Gradient gradient,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: gradient.scale(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade700,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Technology Stack Section
  Widget _buildTechnologyStackSection(BuildContext context) {
    return _buildSectionCard(
      context: context,
      icon: Icons.code,
      iconColor: Colors.green,
      title: 'Technology Stack',
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          _buildTechChip('Flutter', Icons.flutter_dash, Colors.blue),
          _buildTechChip('Dart', Icons.code, Colors.cyan),
          _buildTechChip('Firebase', Icons.local_fire_department, Colors.orange),
          _buildTechChip('OpenAI API', Icons.smart_toy, Colors.green),
          _buildTechChip('Provider', Icons.widgets, Colors.purple),
          _buildTechChip('Material 3', Icons.palette, Colors.teal),
          _buildTechChip('Android', Icons.android, Colors.lightGreen),
          _buildTechChip('Web Support', Icons.web, Colors.indigo),
        ],
      ),
    );
  }

  Widget _buildTechChip(String label, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  // Team Section
  Widget _buildTeamSection(BuildContext context) {
    return _buildSectionCard(
      context: context,
      icon: Icons.groups,
      iconColor: Colors.deepOrange,
      title: 'Our Team',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Developed by INNOVATE SPHERE',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'A venture by Brandkart, an IT services company based in Satara. '
            'At Innovate Sphere IT Solutions, we offer a diverse range of IT consulting '
            'services tailored to meet the dynamic needs of modern businesses.',
            style: TextStyle(
              fontSize: 14,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.blue.withOpacity(0.2),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.lightbulb_outline, color: Colors.amber.shade700),
                    const SizedBox(width: 8),
                    const Text(
                      'Our Commitment',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'We are dedicated to delivering innovative solutions that drive efficiency, '
                  'enhance productivity, and elevate technological capabilities. Our team of '
                  'experienced IT professionals works tirelessly to create tools that make '
                  'a real difference in people\'s lives.',
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Values Section
  Widget _buildValuesSection(BuildContext context) {
    return _buildSectionCard(
      context: context,
      icon: Icons.favorite_border,
      iconColor: Colors.red,
      title: 'Our Core Values',
      child: Column(
        children: [
          _buildValueItem(
            icon: Icons.accessibility_new,
            title: 'Accessibility',
            description: 'Making quality career guidance available to everyone, everywhere.',
            color: Colors.blue,
          ),
          const SizedBox(height: 12),
          _buildValueItem(
            icon: Icons.lightbulb_outline,
            title: 'Innovation',
            description: 'Continuously improving with cutting-edge AI and technology.',
            color: Colors.orange,
          ),
          const SizedBox(height: 12),
          _buildValueItem(
            icon: Icons.trending_up,
            title: 'Simplicity',
            description: 'Complex career decisions made simple through intuitive design.',
            color: Colors.green,
          ),
          const SizedBox(height: 12),
          _buildValueItem(
            icon: Icons.school,
            title: 'Student-Focused',
            description: 'Designed with students and young professionals in mind.',
            color: Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildValueItem({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Contact Section
  Widget _buildContactSection(BuildContext context) {
    return _buildSectionCard(
      context: context,
      icon: Icons.contact_support,
      iconColor: Colors.teal,
      title: 'Contact & Feedback',
      child: Column(
        children: [
          const Text(
            'We\'d love to hear from you! Whether you have questions, feedback, '
            'or need support, feel free to reach out.',
            style: TextStyle(
              fontSize: 14,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 20),
          _buildContactButton(
            icon: Icons.email,
            label: 'Email Us',
            subtitle: EmailHelper.adminEmail,
            onTap: () => EmailHelper.sendInquiryEmail(context),
            color: Colors.blue,
          ),
          const SizedBox(height: 12),
          _buildContactButton(
            icon: Icons.feedback,
            label: 'Send Feedback',
            subtitle: 'Help us improve',
            onTap: () => EmailHelper.sendFeedbackEmail(context),
            color: Colors.orange,
          ),
          const SizedBox(height: 12),
          _buildContactButton(
            icon: Icons.help_outline,
            label: 'Get Support',
            subtitle: 'We\'re here to help',
            onTap: () => EmailHelper.sendSupportEmail(context),
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildContactButton({
    required IconData icon,
    required String label,
    required String subtitle,
    required VoidCallback onTap,
    required Color color,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: color.withOpacity(0.3),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: Colors.white, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: color),
          ],
        ),
      ),
    );
  }

  // Reusable Section Card
  Widget _buildSectionCard({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    required Widget child,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
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
                    color: iconColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: iconColor, size: 24),
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
            child,
          ],
        ),
      ),
    );
  }

  // Helper Methods - Now using EmailHelper utility
}

// Extension to scale gradient opacity
extension GradientScale on Gradient {
  Gradient scale(double opacity) {
    if (this is LinearGradient) {
      final gradient = this as LinearGradient;
      return LinearGradient(
        colors: gradient.colors.map((c) => c.withOpacity(opacity)).toList(),
        begin: gradient.begin,
        end: gradient.end,
      );
    }
    return this;
  }
}
