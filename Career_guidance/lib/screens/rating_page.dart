import 'package:flutter/material.dart';
import 'package:careerguidance/utils/email_helper.dart';

/// Professional Rating Page
/// 
/// Allows users to rate the app and provide feedback with validation
/// and a polished user experience
class RateScreen extends StatefulWidget {
  const RateScreen({super.key});

  @override
  State<RateScreen> createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> with SingleTickerProviderStateMixin {
  int _rating = 0;
  final TextEditingController _feedbackController = TextEditingController();
  bool _isSubmitting = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _submitRating() async {
    // Validation
    if (_rating == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(Icons.warning, color: Colors.white),
              SizedBox(width: 8),
              Text('Please select a rating before submitting'),
            ],
          ),
          backgroundColor: Colors.orange.shade700,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    // Build feedback email content
    final String feedbackContent = '''
Rating: $_rating stars (${_getRatingLabel()})

Feedback:
${_feedbackController.text.isNotEmpty ? _feedbackController.text : '(No additional feedback provided)'}

---
Submitted via Career Guidance App
''';

    // Send feedback via email
    await EmailHelper.sendFeedbackEmail(context, feedbackText: feedbackContent);

    if (!mounted) return;

    setState(() => _isSubmitting = false);

    // Show success dialog
    _showThankYouDialog();
  }

  void _showThankYouDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle,
                  size: 64,
                  color: Colors.green.shade600,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Thank You!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Your ${_rating}-star rating has been submitted successfully.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'We appreciate your feedback and will use it to improve our app.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.of(context).pop(); // Return to previous screen
              },
              child: const Text(
                'Close',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        );
      },
    );

    // Clear form
    setState(() {
      _rating = 0;
      _feedbackController.clear();
    });
  }

  String _getRatingLabel() {
    switch (_rating) {
      case 1:
        return 'Poor';
      case 2:
        return 'Fair';
      case 3:
        return 'Good';
      case 4:
        return 'Very Good';
      case 5:
        return 'Excellent';
      default:
        return 'Tap a star to rate';
    }
  }

  Color _getRatingColor() {
    switch (_rating) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.amber;
      case 4:
        return Colors.lightGreen;
      case 5:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rate Our App'),
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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            _buildHeader(),
            const SizedBox(height: 32),
            
            // Star Rating
            _buildStarRating(),
            const SizedBox(height: 12),
            
            // Rating Label
            _buildRatingLabel(),
            const SizedBox(height: 32),
            
            // Feedback Section
            _buildFeedbackSection(),
            const SizedBox(height: 32),
            
            // Submit Button
            _buildSubmitButton(),
            const SizedBox(height: 16),
            
            // Info Text
            _buildInfoText(),
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
            Icons.star_rounded,
            size: 64,
            color: Colors.amber.shade600,
          ),
          const SizedBox(height: 16),
          const Text(
            'How would you rate our app?',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Your feedback helps us improve and provide better career guidance',
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

  Widget _buildStarRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final starIndex = index + 1;
        final isSelected = starIndex <= _rating;
        
        return GestureDetector(
          onTap: () {
            setState(() => _rating = starIndex);
            _animationController.forward().then((_) {
              _animationController.reverse();
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: ScaleTransition(
              scale: _rating == starIndex ? _scaleAnimation : const AlwaysStoppedAnimation(1.0),
              child: Icon(
                isSelected ? Icons.star : Icons.star_border,
                size: 48,
                color: isSelected ? Colors.amber.shade600 : Colors.grey.shade400,
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildRatingLabel() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Text(
        _getRatingLabel(),
        key: ValueKey<String>(_getRatingLabel()),
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: _getRatingColor(),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildFeedbackSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.comment_outlined, size: 20, color: Colors.purple.shade700),
            const SizedBox(width: 8),
            const Text(
              'Additional Feedback (Optional)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _feedbackController,
          maxLines: 5,
          maxLength: 500,
          decoration: InputDecoration(
            hintText: 'Tell us what you think...\n'
                'What features do you like? What can we improve?',
            hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade500,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.purple, width: 2),
            ),
            filled: true,
            fillColor: Colors.grey.shade50,
            counterStyle: TextStyle(color: Colors.grey.shade600),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: _isSubmitting ? null : _submitRating,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        disabledBackgroundColor: Colors.grey.shade300,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
      ),
      child: _isSubmitting
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : const Text(
              'Submit Rating',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
    );
  }

  Widget _buildInfoText() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, size: 20, color: Colors.blue.shade700),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Your rating and feedback are anonymous and help us improve the app for everyone.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.blue.shade900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
