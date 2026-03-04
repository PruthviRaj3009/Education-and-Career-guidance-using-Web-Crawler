import 'dart:io';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:share_plus/share_plus.dart';

import '../services/file_manager_service.dart';
import '../services/pdf_report_service.dart';
import '../services/career_recommendation_service.dart';
import '../models/career_model.dart';

class FinalPage extends StatefulWidget {
  final Map<String, int> scores;
  final String topCategory;
  final List<String> topCategories;
  final int totalScore;
  final int maxScore;

  const FinalPage({
    super.key,
    required this.scores,
    required this.topCategory,
    required this.topCategories,
    required this.totalScore,
    required this.maxScore,
  });

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  final PdfReportService _pdfReportService = PdfReportService();
  final FileManagerService _fileManagerService = FileManagerService();
  File? _generatedFile;
  bool _isGenerating = false;
  late List<CareerRecommendation> _recommendations;

  @override
  void initState() {
    super.initState();
    log('[FinalPage] Initializing with scores: ${widget.scores}');
    log('[FinalPage] Top category: ${widget.topCategory}');

    // Generate intelligent career recommendations
    _recommendations = CareerRecommendationService.getRecommendations(
      scores: widget.scores,
      topCategories: widget.topCategories,
      topCategory: widget.topCategory,
      maxRecommendations: 5,
    );

    log('[FinalPage] Generated ${_recommendations.length} recommendations');
  }

  Map<String, double> get chartData {
    final Map<String, double> data = {};
    widget.scores.forEach((key, value) {
      if (value > 0) {
        data[key] = value.toDouble();
      }
    });
    return data;
  }

  int get scorePercentage {
    return widget.maxScore == 0
        ? 0
        : ((widget.totalScore / widget.maxScore) * 100).round();
  }

  String get profileSummary {
    return CareerRecommendationService.getProfileSummary(
      scores: widget.scores,
      topCategory: widget.topCategory,
      topCategories: widget.topCategories,
    );
  }

  Future<void> _generateAndShareReport() async {
    if (_isGenerating) return;

    log('[FinalPage] Generating PDF report...');
    setState(() {
      _isGenerating = true;
    });

    try {
      await _fileManagerService.deleteOldReports();

      // Prepare career data for PDF
      final recommendedCareers =
          _recommendations.map((r) => r.career.title).toList();
      final recommendedDetails = _recommendations
          .map((r) => {
                'title': r.career.title,
                'description': r.career.description,
                'matchReason': r.matchReason,
                'matchPercentage': r.matchPercentage,
                'salary': r.career.salaryRange,
                'skills': r.career.skills,
                'path': r.career.educationPath,
              })
          .toList();

      final bytes = await _pdfReportService.buildReport(
        topCategory: widget.topCategory,
        topCategories: widget.topCategories,
        scores: widget.scores,
        totalScore: widget.totalScore,
        maxScore: widget.maxScore,
        recommendedCareers: recommendedCareers,
        recommendedDetails: recommendedDetails,
      );

      final file = await _fileManagerService.savePdfBytes(bytes);
      _generatedFile = file;

      log('[FinalPage] PDF generated successfully: ${file.path}');

      await Share.shareXFiles(
        [XFile(file.path)],
        text: 'Career Guidance Assessment Report',
      );

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('PDF report generated and ready to share!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      log('[FinalPage] Failed to generate PDF: $e');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to generate PDF report.'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isGenerating = false;
        });
      }
    }
  }

  Future<void> _cleanupTempFile() async {
    await _fileManagerService.deleteFile(_generatedFile);
    _generatedFile = null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final chartColors = [
      theme.colorScheme.primary,
      theme.colorScheme.secondary,
      theme.colorScheme.tertiary,
      const Color(0xFFF97316),
      const Color(0xFF64748B),
      const Color(0xFF10B981),
      const Color(0xFFEC4899),
    ];

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {
        if (didPop) {
          await _cleanupTempFile();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () async {
              await _cleanupTempFile();
              if (mounted) {
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text('Career Assessment Results'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Score Summary Header
              _buildScoreSummaryHeader(theme),

              // Profile Summary
              _buildProfileSummary(theme),

              // Download Button
              _buildDownloadSection(theme),

              // Top Career Matches
              _buildCareerMatches(theme),

              // Score Visualization
              if (chartData.isNotEmpty) _buildScoreChart(theme, chartColors),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScoreSummaryHeader(ThemeData theme) {
    return Container(
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
      ),
      child: Column(
        children: [
          Icon(
            Icons.emoji_events,
            size: 64,
            color: theme.colorScheme.onPrimaryContainer,
          ),
          const SizedBox(height: 16),
          Text(
            'Assessment Complete!',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Your Career Aptitude Score',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onPrimaryContainer.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Text(
                  '$scorePercentage%',
                  style: theme.textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${widget.totalScore} out of ${widget.maxScore} points',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSummary(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.person, color: theme.colorScheme.primary),
                  const SizedBox(width: 8),
                  Text(
                    'Your Profile',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                profileSummary,
                style: theme.textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDownloadSection(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: FilledButton.icon(
        onPressed: _isGenerating ? null : _generateAndShareReport,
        icon: _isGenerating
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : const Icon(Icons.download),
        label: Text(
            _isGenerating ? 'Generating Report...' : 'Download PDF Report'),
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  Widget _buildCareerMatches(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top Career Matches',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Based on your personality and interests',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _recommendations.length,
            itemBuilder: (context, index) {
              final recommendation = _recommendations[index];
              return _buildCareerCard(theme, recommendation, index + 1);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCareerCard(
      ThemeData theme, CareerRecommendation recommendation, int rank) {
    final career = recommendation.career;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with rank and match percentage
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '#$rank',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    career.title,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: _getMatchColor(recommendation.matchPercentage)
                        .withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${recommendation.matchPercentage}% Match',
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: _getMatchColor(recommendation.matchPercentage),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Description
            Text(
              career.description,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),

            // Why it matches
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.lightbulb_outline,
                    size: 20,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Why this matches you',
                          style: theme.textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          recommendation.matchReason,
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Salary
            Row(
              children: [
                Icon(
                  Icons.currency_rupee,
                  size: 18,
                  color: theme.colorScheme.secondary,
                ),
                const SizedBox(width: 4),
                Text(
                  'Salary Range: ',
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Expanded(
                  child: Text(
                    career.salaryRange,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Skills Required
            Text(
              'Skills Required',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: career.skills
                  .take(4)
                  .map((skill) => Chip(
                        label: Text(
                          skill,
                          style: theme.textTheme.bodySmall,
                        ),
                        padding: EdgeInsets.zero,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ))
                  .toList(),
            ),
            if (career.skills.length > 4)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  '+${career.skills.length - 4} more skills',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            const SizedBox(height: 12),

            // Education Path
            Text(
              'Suggested Education Path',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            ...career.educationPath.take(3).map((step) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 6),
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          step,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                )),
            if (career.educationPath.length > 3)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  '+${career.educationPath.length - 3} more steps',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreChart(ThemeData theme, List<Color> chartColors) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Score Distribution',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              PieChart(
                dataMap: chartData,
                animationDuration: const Duration(milliseconds: 2000),
                chartType: ChartType.ring,
                chartRadius: MediaQuery.of(context).size.width / 2.2,
                ringStrokeWidth: 40,
                centerText: "Skills",
                colorList: chartColors,
                chartValuesOptions: const ChartValuesOptions(
                  showChartValuesInPercentage: true,
                  showChartValues: true,
                  chartValueStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                legendOptions: const LegendOptions(
                  showLegends: true,
                  legendPosition: LegendPosition.bottom,
                  legendShape: BoxShape.circle,
                  legendTextStyle: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getMatchColor(int percentage) {
    if (percentage >= 80) {
      return Colors.green;
    } else if (percentage >= 60) {
      return Colors.orange;
    } else {
      return Colors.blue;
    }
  }
}
