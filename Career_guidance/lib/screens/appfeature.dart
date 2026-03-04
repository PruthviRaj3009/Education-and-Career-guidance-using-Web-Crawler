import 'package:flutter/material.dart';
import 'package:careerguidance/screens/gptpage.dart';

class AppFeaturesScreen extends StatelessWidget {
  const AppFeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Features"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primaryContainer,
                    theme.colorScheme.tertiaryContainer,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.rocket_launch_rounded,
                    size: 48,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Key Features',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Discover what makes our app special',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer.withOpacity(0.8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Features
            FeatureTile(
              icon: Icons.quiz_outlined,
              iconColor: theme.colorScheme.primary,
              title: 'Career Assessment Quiz',
              description:
                  'Take a comprehensive quiz to identify your strengths, interests, and career goals with personalized insights.',
            ),
            FeatureTile(
              icon: Icons.explore_outlined,
              iconColor: theme.colorScheme.secondary,
              title: 'Career Exploration',
              description:
                  'Explore various career paths and gain detailed information on how to achieve your dream career.',
            ),
            FeatureTile(
              icon: Icons.chat_bubble_outline,
              iconColor: theme.colorScheme.tertiary,
              title: 'AI-Powered Chatbot',
              description:
                  'Get instant career guidance through our intelligent chatbot. Ask questions anytime and receive personalized advice.',
            ),
            FeatureTile(
              icon: Icons.recommend_outlined,
              iconColor: Colors.orange,
              title: 'Personalized Recommendations',
              description:
                  'Receive tailored career recommendations based on your quiz results, interests, and aspirations.',
            ),
            
            const SizedBox(height: 24),
            
            // CTA Button
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChatPage()),
                  );
                },
                icon: const Icon(Icons.chat),
                label: const Text('Start Career Discussion'),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class FeatureTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;

  const FeatureTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 28,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  Text(
                    description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
