import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Email Helper Utility
/// 
/// Provides reusable email functionality throughout the app.
/// Uses url_launcher with mailto: scheme to open the device's email client.
/// 
/// Example usage:
/// ```dart
/// await EmailHelper.sendEmail(
///   context: context,
///   subject: 'App Inquiry',
///   body: 'Hello Admin,\n\nI would like to...',
/// );
/// ```
class EmailHelper {
  // Admin email address (can be changed in one place)
  static const String adminEmail = 'pruthvirajpawr12.pdp@gmail.com';
  
  /// Send email using device's email client
  /// 
  /// [context] - BuildContext for showing error dialogs
  /// [subject] - Email subject line (optional)
  /// [body] - Email body content (optional)
  /// [recipient] - Override default admin email (optional)
  static Future<void> sendEmail({
    required BuildContext context,
    String? subject,
    String? body,
    String? recipient,
  }) async {
    final String emailTo = recipient ?? adminEmail;
    
    // Build mailto URI with proper encoding
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: emailTo,
      query: _encodeQueryParameters({
        if (subject != null && subject.isNotEmpty) 'subject': subject,
        if (body != null && body.isNotEmpty) 'body': body,
      }),
    );

    try {
      // Check if the device can handle mailto: URLs
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        if (context.mounted) {
          _showErrorDialog(
            context,
            'No Email App Found',
            'Please install an email app to send emails.\n\n'
            'You can manually send an email to:\n$emailTo',
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        _showErrorDialog(
          context,
          'Error',
          'Failed to open email app. Please try again.\n\n'
          'Error: ${e.toString()}',
        );
      }
    }
  }

  /// Send App Inquiry Email
  /// 
  /// Used for general inquiries from About Us page
  static Future<void> sendInquiryEmail(BuildContext context) async {
    await sendEmail(
      context: context,
      subject: 'Career Guidance App - Inquiry',
      body: 'Hello Admin,\n\n'
          'I am contacting you regarding the Career Guidance app.\n\n'
          'My inquiry:\n\n\n'
          'Thank you!',
    );
  }

  /// Send Feedback Email
  /// 
  /// Used for user feedback submission
  static Future<void> sendFeedbackEmail(BuildContext context, {String? feedbackText}) async {
    final String bodyContent = feedbackText != null && feedbackText.isNotEmpty
        ? 'Feedback:\n$feedbackText\n\n'
            'Device Information:\n'
            '(Please include your device model if relevant)\n\n'
            'Additional Suggestions:\n\n'
        : 'Feedback:\n\n\n'
            'Device Information:\n'
            '(Please include your device model if relevant)\n\n'
            'Suggestions:\n\n';

    await sendEmail(
      context: context,
      subject: 'Career Guidance App - Feedback',
      body: bodyContent,
    );
  }

  /// Send Support Request Email
  /// 
  /// Used for technical support inquiries
  static Future<void> sendSupportEmail(BuildContext context) async {
    await sendEmail(
      context: context,
      subject: 'Career Guidance App - Support Request',
      body: 'Issue Description:\n\n\n'
          'Steps to Reproduce:\n'
          '1. \n'
          '2. \n'
          '3. \n\n'
          'Expected Behavior:\n\n\n'
          'Actual Behavior:\n\n\n'
          'Device Information:\n'
          '(Please include device model and Android version)\n\n',
    );
  }

  /// Send Bug Report Email
  /// 
  /// Used for reporting bugs
  static Future<void> sendBugReportEmail(BuildContext context) async {
    await sendEmail(
      context: context,
      subject: 'Career Guidance App - Bug Report',
      body: 'Bug Description:\n\n\n'
          'Steps to Reproduce:\n'
          '1. \n'
          '2. \n'
          '3. \n\n'
          'Expected Result:\n\n\n'
          'Actual Result:\n\n\n'
          'Screenshots/Error Messages:\n'
          '(Please attach if available)\n\n'
          'Device Information:\n'
          '(Device model, Android version, App version)\n\n',
    );
  }

  /// Send Feature Request Email
  /// 
  /// Used for suggesting new features
  static Future<void> sendFeatureRequestEmail(BuildContext context) async {
    await sendEmail(
      context: context,
      subject: 'Career Guidance App - Feature Request',
      body: 'Feature Request:\n\n\n'
          'Problem This Feature Would Solve:\n\n\n'
          'Proposed Solution:\n\n\n'
          'Additional Context:\n\n\n'
          'How This Would Help Users:\n\n',
    );
  }

  /// Send General Contact Email
  /// 
  /// Generic contact email with minimal template
  static Future<void> sendContactEmail(BuildContext context) async {
    await sendEmail(
      context: context,
      subject: 'Career Guidance App - Contact',
      body: 'Hello,\n\n\n\nBest regards,',
    );
  }

  /// Helper method to encode query parameters properly
  /// 
  /// Ensures special characters are properly encoded in the mailto: URL
  static String _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((entry) => '${Uri.encodeComponent(entry.key)}=${Uri.encodeComponent(entry.value)}')
        .join('&');
  }

  /// Show error dialog when email functionality fails
  static void _showErrorDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Row(
            children: [
              const Icon(Icons.error_outline, color: Colors.red),
              const SizedBox(width: 8),
              Text(title),
            ],
          ),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('OK'),
            ),
            if (title == 'No Email App Found')
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  // Copy email to clipboard would be nice here
                },
                child: const Text('Copy Email'),
              ),
          ],
        );
      },
    );
  }

  /// Copy admin email to clipboard (bonus utility)
  static void copyEmailToClipboard(BuildContext context) {
    // This would require clipboard package
    // For now, just show the email
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Admin Email'),
        content: SelectableText(
          adminEmail,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
