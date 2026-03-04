import 'dart:developer';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';

class PdfReportService {
  PdfReportService();

  Future<List<int>> buildReport({
    required String topCategory,
    required List<String> topCategories,
    required Map<String, int> scores,
    required int totalScore,
    required int maxScore,
    required List<String> recommendedCareers,
    required List<Map<String, dynamic>> recommendedDetails,
  }) async {
    log('[PdfReport] Building professional PDF report...');
    
    final percentage = maxScore == 0 ? 0 : ((totalScore / maxScore) * 100).round();
    final totalQuestions = maxScore ~/ 5; // Estimate questions from max score
    final correctAnswers = totalScore ~/ 5; // Estimate correct answers
    final generatedDate = DateFormat('MMMM dd, yyyy').format(DateTime.now());
    
    final document = pw.Document();

    document.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(40),
        build: (context) => [
          // Title Section
          _buildTitleSection(generatedDate, percentage),
          pw.SizedBox(height: 30),
          
          // User Quiz Summary
          _buildQuizSummary(totalQuestions, correctAnswers, percentage),
          pw.SizedBox(height: 30),
          
          // Profile Summary
          _buildProfileSummary(topCategory, topCategories),
          pw.SizedBox(height: 30),
          
          // Score Breakdown
          _buildScoreBreakdown(scores),
          pw.SizedBox(height: 30),
          
          // Career Recommendations Header
          _buildSectionHeader('Top Career Recommendations'),
          pw.SizedBox(height: 16),
          
          // Career Details
          ...recommendedDetails.asMap().entries.map(
            (entry) => _buildCareerSection(entry.key + 1, entry.value),
          ),
        ],
      ),
    );

    log('[PdfReport] PDF document generated successfully');
    return document.save();
  }

  /// Build professional title section
  pw.Widget _buildTitleSection(String date, int percentage) {
    return pw.Container(
      decoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(width: 3, color: PdfColors.indigo),
        ),
      ),
      padding: const pw.EdgeInsets.only(bottom: 20),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Career Guidance Assessment Report',
            style: pw.TextStyle(
              fontSize: 28,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.indigo900,
            ),
          ),
          pw.SizedBox(height: 12),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Career Guidance App',
                    style: pw.TextStyle(
                      fontSize: 12,
                      color: PdfColors.grey700,
                    ),
                  ),
                  pw.SizedBox(height: 4),
                  pw.Text(
                    'Generated: $date',
                    style: pw.TextStyle(
                      fontSize: 12,
                      color: PdfColors.grey700,
                    ),
                  ),
                ],
              ),
              pw.Container(
                padding: const pw.EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: pw.BoxDecoration(
                  color: PdfColors.indigo100,
                  borderRadius: pw.BorderRadius.circular(8),
                ),
                child: pw.Column(
                  children: [
                    pw.Text(
                      'Overall Score',
                      style: pw.TextStyle(
                        fontSize: 10,
                        color: PdfColors.grey800,
                      ),
                    ),
                    pw.Text(
                      '$percentage%',
                      style: pw.TextStyle(
                        fontSize: 24,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.indigo,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Build quiz summary section
  pw.Widget _buildQuizSummary(int totalQuestions, int correctAnswers, int percentage) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(16),
      decoration: pw.BoxDecoration(
        color: PdfColors.grey100,
        borderRadius: pw.BorderRadius.circular(8),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Assessment Summary',
            style: pw.TextStyle(
              fontSize: 16,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.indigo900,
            ),
          ),
          pw.SizedBox(height: 12),
          pw.Row(
            children: [
              pw.Expanded(
                child: _buildSummaryItem('Total Questions', '$totalQuestions'),
              ),
              pw.Expanded(
                child: _buildSummaryItem('Completed', '$correctAnswers'),
              ),
              pw.Expanded(
                child: _buildSummaryItem('Score', '$percentage%'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  pw.Widget _buildSummaryItem(String label, String value) {
    return pw.Column(
      children: [
        pw.Text(
          value,
          style: pw.TextStyle(
            fontSize: 20,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.indigo,
          ),
        ),
        pw.SizedBox(height: 4),
        pw.Text(
          label,
          style: pw.TextStyle(
            fontSize: 10,
            color: PdfColors.grey700,
          ),
        ),
      ],
    );
  }

  /// Build profile summary
  pw.Widget _buildProfileSummary(String topCategory, List<String> topCategories) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(16),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: PdfColors.indigo200),
        borderRadius: pw.BorderRadius.circular(8),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Your Career Profile',
            style: pw.TextStyle(
              fontSize: 14,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.indigo900,
            ),
          ),
          pw.SizedBox(height: 8),
          pw.Text(
            'Primary Strength: ${_titleCase(topCategory)}',
            style: pw.TextStyle(fontSize: 11, color: PdfColors.grey800),
          ),
          pw.SizedBox(height: 4),
          pw.Text(
            'Top Interests: ${topCategories.map(_titleCase).join(', ')}',
            style: pw.TextStyle(fontSize: 11, color: PdfColors.grey800),
          ),
        ],
      ),
    );
  }

  /// Build score breakdown table
  pw.Widget _buildScoreBreakdown(Map<String, int> scores) {
    final sortedScores = scores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Detailed Score Breakdown'),
        pw.SizedBox(height: 12),
        pw.Table(
          border: pw.TableBorder.all(color: PdfColors.grey300),
          children: [
            // Header row
            pw.TableRow(
              decoration: const pw.BoxDecoration(color: PdfColors.indigo50),
              children: [
                _buildTableCell('Category', isHeader: true),
                _buildTableCell('Score', isHeader: true),
                _buildTableCell('Strength Level', isHeader: true),
              ],
            ),
            // Data rows
            ...sortedScores.map((entry) => pw.TableRow(
              children: [
                _buildTableCell(_titleCase(entry.key)),
                _buildTableCell('${entry.value}'),
                _buildTableCell(_getStrengthLevel(entry.value)),
              ],
            )),
          ],
        ),
      ],
    );
  }

  pw.Widget _buildTableCell(String text, {bool isHeader = false}) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Text(
        text,
        style: pw.TextStyle(
          fontSize: 10,
          fontWeight: isHeader ? pw.FontWeight.bold : pw.FontWeight.normal,
          color: isHeader ? PdfColors.indigo900 : PdfColors.grey800,
        ),
      ),
    );
  }

  String _getStrengthLevel(int score) {
    if (score >= 15) return 'Exceptional';
    if (score >= 10) return 'Strong';
    if (score >= 5) return 'Developing';
    return 'Basic';
  }

  /// Build section header
  pw.Widget _buildSectionHeader(String title) {
    return pw.Container(
      padding: const pw.EdgeInsets.only(bottom: 8),
      decoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(width: 2, color: PdfColors.indigo),
        ),
      ),
      child: pw.Text(
        title,
        style: pw.TextStyle(
          fontSize: 18,
          fontWeight: pw.FontWeight.bold,
          color: PdfColors.indigo900,
        ),
      ),
    );
  }

  /// Build professional career section
  pw.Widget _buildCareerSection(int rank, Map<String, dynamic> detail) {
    final title = detail['title'] ?? 'Unknown Career';
    final description = detail['description'] ?? '';
    final matchReason = detail['matchReason'] ?? '';
    final matchPercentage = detail['matchPercentage'] ?? 0;
    final salary = detail['salary'] ?? '';
    final skills = detail['skills'] as List<String>? ?? [];
    final path = detail['path'] as List<String>? ?? [];

    return pw.Container(
      margin: const pw.EdgeInsets.only(bottom: 24),
      padding: const pw.EdgeInsets.all(16),
      decoration: pw.BoxDecoration(
        color: PdfColors.grey50,
        borderRadius: pw.BorderRadius.circular(8),
        border: pw.Border.all(color: PdfColors.grey300),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          // Career header with rank and match
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Row(
                children: [
                  pw.Container(
                    width: 30,
                    height: 30,
                    decoration: pw.BoxDecoration(
                      color: PdfColors.indigo,
                      shape: pw.BoxShape.circle,
                    ),
                    child: pw.Center(
                      child: pw.Text(
                        '#$rank',
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.white,
                        ),
                      ),
                    ),
                  ),
                  pw.SizedBox(width: 12),
                  pw.Text(
                    title,
                    style: pw.TextStyle(
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.indigo900,
                    ),
                  ),
                ],
              ),
              pw.Container(
                padding: const pw.EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: pw.BoxDecoration(
                  color: _getMatchColorPdf(matchPercentage),
                  borderRadius: pw.BorderRadius.circular(12),
                ),
                child: pw.Text(
                  '$matchPercentage% Match',
                  style: pw.TextStyle(
                    fontSize: 10,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.white,
                  ),
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 12),
          
          // Description
          if (description.isNotEmpty) ...[
            pw.Text(
              description,
              style: pw.TextStyle(fontSize: 10, color: PdfColors.grey800),
            ),
            pw.SizedBox(height: 12),
          ],
          
          // Why it matches
          if (matchReason.isNotEmpty) ...[
            pw.Container(
              padding: const pw.EdgeInsets.all(10),
              decoration: pw.BoxDecoration(
                color: PdfColors.indigo50,
                borderRadius: pw.BorderRadius.circular(6),
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Why this matches you:',
                    style: pw.TextStyle(
                      fontSize: 10,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.indigo900,
                    ),
                  ),
                  pw.SizedBox(height: 4),
                  pw.Text(
                    matchReason,
                    style: pw.TextStyle(fontSize: 9, color: PdfColors.grey800),
                  ),
                ],
              ),
            ),
            pw.SizedBox(height: 12),
          ],
          
          // Salary
          if (salary.isNotEmpty) ...[
            pw.Row(
              children: [
                pw.Text(
                  'Salary Range: ',
                  style: pw.TextStyle(
                    fontSize: 10,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.grey900,
                  ),
                ),
                pw.Expanded(
                  child: pw.Text(
                    salary,
                    style: pw.TextStyle(fontSize: 9, color: PdfColors.grey800),
                  ),
                ),
              ],
            ),
            pw.SizedBox(height: 12),
          ],
          
          // Skills Required
          if (skills.isNotEmpty) ...[
            pw.Text(
              'Skills Required:',
              style: pw.TextStyle(
                fontSize: 11,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.grey900,
              ),
            ),
            pw.SizedBox(height: 6),
            ...skills.take(6).map((skill) => pw.Padding(
              padding: const pw.EdgeInsets.only(left: 12, bottom: 4),
              child: pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('• ', style: pw.TextStyle(fontSize: 9, color: PdfColors.indigo)),
                  pw.Expanded(
                    child: pw.Text(
                      skill,
                      style: pw.TextStyle(fontSize: 9, color: PdfColors.grey800),
                    ),
                  ),
                ],
              ),
            )),
            if (skills.length > 6)
              pw.Padding(
                padding: const pw.EdgeInsets.only(left: 12, top: 2),
                child: pw.Text(
                  '...and ${skills.length - 6} more',
                  style: pw.TextStyle(
                    fontSize: 8,
                    fontStyle: pw.FontStyle.italic,
                    color: PdfColors.grey600,
                  ),
                ),
              ),
            pw.SizedBox(height: 12),
          ],
          
          // Education Path
          if (path.isNotEmpty) ...[
            pw.Text(
              'Suggested Education Path:',
              style: pw.TextStyle(
                fontSize: 11,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.grey900,
              ),
            ),
            pw.SizedBox(height: 6),
            ...path.take(4).map((step) => pw.Padding(
              padding: const pw.EdgeInsets.only(left: 12, bottom: 4),
              child: pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('• ', style: pw.TextStyle(fontSize: 9, color: PdfColors.indigo)),
                  pw.Expanded(
                    child: pw.Text(
                      step,
                      style: pw.TextStyle(fontSize: 9, color: PdfColors.grey800),
                    ),
                  ),
                ],
              ),
            )),
            if (path.length > 4)
              pw.Padding(
                padding: const pw.EdgeInsets.only(left: 12, top: 2),
                child: pw.Text(
                  '...and ${path.length - 4} more steps',
                  style: pw.TextStyle(
                    fontSize: 8,
                    fontStyle: pw.FontStyle.italic,
                    color: PdfColors.grey600,
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }

  PdfColor _getMatchColorPdf(int percentage) {
    if (percentage >= 80) return PdfColors.green;
    if (percentage >= 60) return PdfColors.orange;
    return PdfColors.blue;
  }

  String _titleCase(String value) {
    if (value.isEmpty) return value;
    return value[0].toUpperCase() + value.substring(1);
  }
}
