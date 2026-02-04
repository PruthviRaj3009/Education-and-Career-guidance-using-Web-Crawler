import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

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
    final percentage = maxScore == 0
        ? 0
        : ((totalScore / maxScore) * 100).round();
    final document = pw.Document();

    document.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          pw.Text('Career Guidance Report',
              style: pw.TextStyle(
                fontSize: 22,
                fontWeight: pw.FontWeight.bold,
              )),
          pw.SizedBox(height: 12),
          pw.Text('Top Category: ${_titleCase(topCategory)}'),
          pw.Text('Top Interests: ${topCategories.map(_titleCase).join(', ')}'),
          pw.Text('Overall Score: $percentage%'),
          pw.SizedBox(height: 12),
          pw.Text('Score Summary',
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
              )),
          pw.SizedBox(height: 8),
          ...scores.entries.map(
            (entry) => pw.Text('${_titleCase(entry.key)}: ${entry.value}'),
          ),
          pw.SizedBox(height: 16),
          pw.Text('Recommended Careers',
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
              )),
          pw.SizedBox(height: 8),
          pw.Bullet(
            text: recommendedCareers.join('\n'),
          ),
          pw.SizedBox(height: 16),
          pw.Text('Career Details',
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
              )),
          pw.SizedBox(height: 8),
          ...recommendedDetails.map((detail) => _detailSection(detail)),
        ],
      ),
    );

    return document.save();
  }

  pw.Widget _detailSection(Map<String, dynamic> detail) {
    final skills = (detail['skills'] as List<String>? ?? []).join('\n');
    final path = (detail['path'] as List<String>? ?? []).join('\n');

    return pw.Container(
      margin: const pw.EdgeInsets.only(bottom: 12),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(detail['title'] ?? '',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 4),
          pw.Text('Salary: ${detail['salary'] ?? ''}'),
          pw.SizedBox(height: 4),
          if (skills.isNotEmpty) pw.Text('Skills:\n$skills'),
          pw.SizedBox(height: 4),
          if (path.isNotEmpty) pw.Text('How to Become:\n$path'),
        ],
      ),
    );
  }

  String _titleCase(String value) {
    if (value.isEmpty) return value;
    return value[0].toUpperCase() + value.substring(1);
  }
}
