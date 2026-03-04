import 'dart:developer';
import '../models/career_model.dart';
import 'career_database.dart';

/// Intelligent career recommendation service
/// Analyzes quiz scores and provides personalized career matches
class CareerRecommendationService {
  /// Generate top career recommendations based on quiz scores
  /// Returns 3-5 most relevant careers with match scores
  static List<CareerRecommendation> getRecommendations({
    required Map<String, int> scores,
    required List<String> topCategories,
    required String topCategory,
    int maxRecommendations = 5,
  }) {
    log('[CareerRecommendation] Generating recommendations for categories: $topCategories');
    log('[CareerRecommendation] Top category: $topCategory');
    log('[CareerRecommendation] Scores: $scores');

    // Get all potential careers
    final allCareers = CareerDatabase.careers;
    final recommendations = <CareerRecommendation>[];

    // Calculate match score for each career
    for (final career in allCareers) {
      final matchScore = _calculateMatchScore(
        career: career,
        scores: scores,
        topCategories: topCategories,
        topCategory: topCategory,
      );

      if (matchScore > 0) {
        final matchReason = _generateMatchReason(
          career: career,
          scores: scores,
          topCategories: topCategories,
          matchScore: matchScore,
        );

        recommendations.add(CareerRecommendation(
          career: career,
          matchScore: matchScore,
          matchReason: matchReason,
        ));
      }
    }

    // Sort by match score (descending)
    recommendations.sort((a, b) => b.matchScore.compareTo(a.matchScore));

    // Take top N recommendations
    final topRecommendations = recommendations.take(maxRecommendations).toList();

    log('[CareerRecommendation] Generated ${topRecommendations.length} recommendations');
    for (final rec in topRecommendations) {
      log('[CareerRecommendation] ${rec.career.title}: ${rec.matchPercentage}%');
    }

    return topRecommendations;
  }

  /// Calculate match score for a career based on quiz results
  /// Score range: 0-100
  static int _calculateMatchScore({
    required CareerModel career,
    required Map<String, int> scores,
    required List<String> topCategories,
    required String topCategory,
  }) {
    int totalScore = 0;

    // 1. Category Match Score (40 points max)
    int categoryScore = 0;
    for (final careerCategory in career.categories) {
      if (topCategory == careerCategory) {
        categoryScore += 20; // Primary category match
      } else if (topCategories.contains(careerCategory)) {
        categoryScore += 10; // Secondary category match
      }
    }
    categoryScore = categoryScore.clamp(0, 40);
    totalScore += categoryScore;

    // 2. Score Distribution Analysis (30 points max)
    int distributionScore = 0;
    for (final careerCategory in career.categories) {
      final categoryScore = scores[careerCategory] ?? 0;
      // Reward higher scores in relevant categories
      distributionScore += (categoryScore * 2).clamp(0, 10);
    }
    distributionScore = distributionScore.clamp(0, 30);
    totalScore += distributionScore;

    // 3. Career Priority Bonus (15 points max)
    // Careers with higher base priority get bonus points
    final priorityScore = (career.basePriority * 1.5).round().clamp(0, 15);
    totalScore += priorityScore;

    // 4. Versatility Bonus (15 points max)
    // Careers matching multiple categories get bonus
    final matchingCategories = career.categories
        .where((cat) => topCategories.contains(cat))
        .length;
    final versatilityScore = (matchingCategories * 5).clamp(0, 15);
    totalScore += versatilityScore;

    return totalScore.clamp(0, 100);
  }

  /// Generate personalized match reason based on user's quiz results
  static String _generateMatchReason({
    required CareerModel career,
    required Map<String, int> scores,
    required List<String> topCategories,
    required int matchScore,
  }) {
    final reasons = <String>[];

    // Identify strongest matching categories
    final matchingCategories = career.categories
        .where((cat) => topCategories.contains(cat))
        .toList();

    if (matchingCategories.isNotEmpty) {
      final categoryNames = matchingCategories
          .map((cat) => _formatCategoryName(cat))
          .join(' and ');
      reasons.add('Your strong $categoryNames abilities align well with this role');
    }

    // Analyze score distribution
    final topScores = scores.entries
        .where((entry) => career.categories.contains(entry.key))
        .toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    if (topScores.isNotEmpty && topScores.first.value > 10) {
      final skillArea = _formatCategoryName(topScores.first.key);
      reasons.add('Your high score in $skillArea indicates strong potential');
    }

    // Add match quality indicator
    if (matchScore >= 80) {
      reasons.add('Excellent match for your skill profile');
    } else if (matchScore >= 60) {
      reasons.add('Very good match for your interests');
    } else {
      reasons.add('Good match based on your quiz responses');
    }

    return reasons.join('. ') + '.';
  }

  /// Format category name for display
  static String _formatCategoryName(String category) {
    final Map<String, String> categoryDisplayNames = {
      'technology': 'technical',
      'creative': 'creative',
      'business': 'business',
      'social': 'interpersonal',
      'leadership': 'leadership',
      'research': 'analytical',
      'sports': 'physical',
    };

    return categoryDisplayNames[category] ?? category;
  }

  /// Get category strength description
  static String getCategoryStrength(String category, int score) {
    if (score >= 15) {
      return 'Exceptional strength in ${_formatCategoryName(category)} skills';
    } else if (score >= 10) {
      return 'Strong ${_formatCategoryName(category)} abilities';
    } else if (score >= 5) {
      return 'Developing ${_formatCategoryName(category)} skills';
    } else {
      return 'Basic ${_formatCategoryName(category)} foundation';
    }
  }

  /// Generate overall profile summary
  static String getProfileSummary({
    required Map<String, int> scores,
    required String topCategory,
    required List<String> topCategories,
  }) {
    final topScore = scores[topCategory] ?? 0;
    final categoryName = _formatCategoryName(topCategory);

    final summary = StringBuffer();
    summary.write('Based on your quiz responses, you demonstrate ');
    
    if (topScore >= 15) {
      summary.write('exceptional $categoryName abilities');
    } else if (topScore >= 10) {
      summary.write('strong $categoryName skills');
    } else {
      summary.write('good $categoryName potential');
    }

    if (topCategories.length > 1) {
      final secondaryCategories = topCategories
          .skip(1)
          .take(2)
          .map((cat) => _formatCategoryName(cat))
          .join(' and ');
      summary.write(', with additional strengths in $secondaryCategories areas');
    }

    summary.write('. You are well-suited for careers that leverage these capabilities.');

    return summary.toString();
  }
}
