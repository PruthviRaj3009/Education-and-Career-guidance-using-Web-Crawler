/// Career data model with comprehensive information
class CareerModel {
  final String title;
  final String description;
  final String matchReason;
  final List<String> skills;
  final List<String> educationPath;
  final String salaryRange;
  final List<String> categories;
  final int basePriority;

  const CareerModel({
    required this.title,
    required this.description,
    required this.matchReason,
    required this.skills,
    required this.educationPath,
    required this.salaryRange,
    required this.categories,
    this.basePriority = 0,
  });
}

/// Career recommendation with calculated match score
class CareerRecommendation {
  final CareerModel career;
  final int matchScore;
  final String matchReason;

  const CareerRecommendation({
    required this.career,
    required this.matchScore,
    required this.matchReason,
  });

  int get matchPercentage => matchScore.clamp(0, 100);
}
