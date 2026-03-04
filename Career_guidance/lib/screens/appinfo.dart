import 'package:flutter/material.dart';
import 'package:careerguidance/screens/privacyP.dart';
import 'package:careerguidance/screens/terms_of_service.dart';

class AppInfoScreen extends StatelessWidget {
  const AppInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("App Information"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // App Icon and Name
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primaryContainer,
                  theme.colorScheme.secondaryContainer,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.school_rounded,
                    size: 48,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Career Guidance',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Version 1.0.0',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color:
                        theme.colorScheme.onPrimaryContainer.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // About Section
          _buildSectionHeader(theme, 'About the App'),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'This app is designed to help users assess their skills, interests, and aspirations to make informed decisions about their future careers. Through comprehensive quizzes and AI-powered guidance, users can explore various career paths and educational opportunities.',
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Developer Info
          _buildSectionHeader(theme, 'Developer'),
          const SizedBox(height: 12),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.business_rounded,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  title: const Text('Company'),
                  subtitle: const Text('INNOVATE SPHERE VENTURE\nBY BRANDKART'),
                  isThreeLine: true,
                ),
                const Divider(height: 1, indent: 56),
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.email_rounded,
                      color: theme.colorScheme.onSecondaryContainer,
                    ),
                  ),
                  title: const Text('Contact'),
                  subtitle: const Text('pruthvirajpawr12.pdp@gmail.com'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Key Features
          _buildSectionHeader(theme, 'Key Features'),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildFeatureItem(theme, Icons.psychology_outlined,
                      'Personalized career advice'),
                  _buildFeatureItem(theme, Icons.work_outline,
                      'Information on various professions'),
                  _buildFeatureItem(theme, Icons.support_agent_outlined,
                      'Access to AI career counseling'),
                  _buildFeatureItem(theme, Icons.quiz_outlined,
                      'Career quizzes and assessments',
                      isLast: true),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Permissions
          _buildSectionHeader(theme, 'Permissions'),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildPermissionItem(theme, Icons.wifi, 'Internet Access',
                      'Required for AI features'),
                  _buildPermissionItem(theme, Icons.storage, 'Storage Access',
                      'For saving data locally',
                      isLast: true),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Legal
          _buildSectionHeader(theme, 'Legal'),
          const SizedBox(height: 12),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.privacy_tip_outlined,
                      color: theme.colorScheme.primary),
                  title: const Text('Privacy Policy'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PrivacyPolicyScreen()),
                  ),
                ),
                Divider(
                    height: 1,
                    indent: 56,
                    color: theme.colorScheme.outlineVariant),
                ListTile(
                  leading: Icon(Icons.description_outlined,
                      color: theme.colorScheme.primary),
                  title: const Text('Terms of Service'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TermsOfServiceScreen()),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Package Info
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Package Name',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'com.innovatesphere.careerguidance',
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(ThemeData theme, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        title,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildFeatureItem(ThemeData theme, IconData icon, String text,
      {bool isLast = false}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Icon(icon, size: 20, color: theme.colorScheme.primary),
              const SizedBox(width: 12),
              Expanded(
                child: Text(text, style: theme.textTheme.bodyMedium),
              ),
            ],
          ),
        ),
        if (!isLast)
          Divider(height: 1, color: theme.colorScheme.outlineVariant),
      ],
    );
  }

  Widget _buildPermissionItem(
      ThemeData theme, IconData icon, String title, String subtitle,
      {bool isLast = false}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Icon(icon, size: 20, color: theme.colorScheme.secondary),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: theme.textTheme.bodyMedium),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (!isLast)
          Divider(height: 1, color: theme.colorScheme.outlineVariant),
      ],
    );
  }
}
