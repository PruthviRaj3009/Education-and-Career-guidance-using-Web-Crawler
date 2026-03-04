import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = context.watch<ThemeController>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Header Section
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Appearance',
              style: theme.textTheme.titleSmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          
          // Theme Settings Card
          Card(
            child: Column(
              children: [
                _buildThemeOption(
                  context: context,
                  controller: controller,
                  icon: Icons.brightness_auto,
                  title: 'System Default',
                  subtitle: 'Follow system theme',
                  themeMode: ThemeMode.system,
                ),
                Divider(height: 1, indent: 56, color: theme.colorScheme.outlineVariant),
                _buildThemeOption(
                  context: context,
                  controller: controller,
                  icon: Icons.light_mode,
                  title: 'Light Mode',
                  subtitle: 'Always use light theme',
                  themeMode: ThemeMode.light,
                ),
                Divider(height: 1, indent: 56, color: theme.colorScheme.outlineVariant),
                _buildThemeOption(
                  context: context,
                  controller: controller,
                  icon: Icons.dark_mode,
                  title: 'Dark Mode',
                  subtitle: 'Always use dark theme',
                  themeMode: ThemeMode.dark,
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // App Info Section
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'About',
              style: theme.textTheme.titleSmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          
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
                      Icons.info_outline,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  title: const Text('App Version'),
                  subtitle: const Text('1.0.0'),
                ),
                Divider(height: 1, indent: 56, color: theme.colorScheme.outlineVariant),
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.business,
                      color: theme.colorScheme.onSecondaryContainer,
                    ),
                  ),
                  title: const Text('Developer'),
                  subtitle: const Text('INNOVATE SPHERE VENTURE'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildThemeOption({
    required BuildContext context,
    required ThemeController controller,
    required IconData icon,
    required String title,
    required String subtitle,
    required ThemeMode themeMode,
  }) {
    final theme = Theme.of(context);
    final isSelected = controller.themeMode == themeMode;
    
    return InkWell(
      onTap: () => controller.setThemeMode(themeMode),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSelected
                    ? theme.colorScheme.primaryContainer
                    : theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: isSelected
                    ? theme.colorScheme.onPrimaryContainer
                    : theme.colorScheme.onSurfaceVariant,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: theme.colorScheme.primary,
                size: 24,
              )
            else
              Icon(
                Icons.circle_outlined,
                color: theme.colorScheme.outlineVariant,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}
