import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:share_plus/share_plus.dart';

import '../services/file_manager_service.dart';
import '../services/pdf_report_service.dart';

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

  static const Map<String, List<String>> careerByCategory = {
    'technology': [
      'Robotics Engineer',
      'Software Engineer',
      'App Developer',
      'Data Scientist',
    ],
    'creative': [
      'Graphic Designer',
      'Game Developer',
      'Content Creator',
      'UX Designer',
    ],
    'business': [
      'Project Manager',
      'Business Analyst',
      'Product Manager',
      'Entrepreneur',
    ],
    'social': [
      'Social Worker',
      'Counselor',
      'Community Manager',
      'Teacher',
    ],
    'leadership': [
      'Team Lead',
      'Operations Manager',
      'HR Manager',
      'Consultant',
    ],
    'research': [
      'Research Analyst',
      'Data Scientist',
      'Lab Scientist',
      'Policy Analyst',
    ],
    'sports': [
      'Sports Coach',
      'Fitness Trainer',
      'Sports Analyst',
      'Physiotherapist',
    ],
  };

  static const Map<String, Map<String, dynamic>> careerDetails = {
    'Robotics Engineer': {
      'salary':
          'Average salary of ₹7,28,897 for robotics software engineers and ₹6,50,000 for automation engineers. Typical salary range of £27,500 to £55,000 per year in the UK.',
      'skills': [
        'Strong programming skills in languages like Python, C++, Java',
        'Knowledge of robotics frameworks and libraries like ROS',
        'Understanding of electronics, mechanics, and control systems',
        'Proficiency in computer vision, Linux, PLC programming',
        'Solid math background, especially in algebra, geometry, statistics',
        'Practical problem-solving abilities and creative thinking',
        'Effective communication skills to present designs to stakeholders'
      ],
      'path': [
        "Complete a bachelor's degree in robotics engineering, mechatronics, computer science, or a related field",
        'Gain practical experience through internships or projects while studying',
        "Consider a master's degree for advanced skills and research opportunities",
        'Join professional associations like Engineers Australia for networking and continuous learning',
        'Start as a robotics technician or junior engineer and work your way up'
      ]
    },
    'Game Developer': {
      'salary':
          'Average salary of 116,189 per year in the US. Typical salary range of 65,000 to 214,000 in the US. Average salary of ₹6,15,000 per year in India. Salaries vary based on experience level, company size, and location.',
      'skills': [
        'Strong programming skills in languages like C#, Java, C++, JavaScript',
        'Knowledge of game engines like Unity and Unreal',
        'Proficiency in 2D/3D art, animation, and visual effects',
        'Understanding of game design principles and user experience',
        'Problem-solving abilities and creativity to design engaging gameplay'
      ],
      'path': [
        "Complete a bachelor's degree in computer science, game development, or a related field",
        'Gain practical experience through internships, game jams, and personal projects',
        'Build a strong portfolio showcasing your programming and game design skills',
        "Consider a master's degree for advanced skills and research opportunities",
        'Start as a junior game developer and work your way up to senior and lead roles',
        'Stay updated with the latest technologies, trends, and best practices in the industry'
      ]
    },
    'Environmental Engineer': {
      'salary':
          'Junior environmental engineers earn around ₹2.5 lakhs per year, while senior environmental engineers can earn up to ₹9.6 lakhs annually.',
      'skills': [
        'Environmental compliance',
        'Project management',
        'Consulting'
      ],
      'path': [
        "Pursue a bachelor's degree in environmental engineering or related field after 10+2 education",
        'Gain practical experience through internships and projects',
        'Consider postgraduate studies for specialization',
        'Develop skills in environmental compliance, project management, and consulting.'
      ]
    },
    'Biomedical Engineer': {
      'salary':
          'Entry-level biomedical engineers earn around ₹3.5 lakhs per year, with experienced professionals earning up to ₹20 lakhs annually.',
      'skills': ['Biomedical devices', 'Problem solving', 'Research mindset'],
      'path': [
        'Complete 10+2 education with a focus on PCM or PCB.',
        'Enroll in a B.Tech, B.E., or B.Sc. program in biomedical engineering',
        "Pursue higher qualifications like a master's degree or PhD for career advancement",
        'Continuously improve skills and stay updated with advancements in the field.'
      ]
    },
    'Social Entrepreneur': {
      'salary':
          'Earnings can vary widely based on the success of the social enterprise.',
      'skills': ['Impact strategy', 'Leadership', 'Fundraising'],
      'path': [
        'Identify a social issue or cause you are passionate about.',
        'Develop a business plan for a social enterprise that addresses the identified issue.',
        'Seek mentorship and guidance from experienced social entrepreneurs.',
        'Start small, test your ideas, and gradually scale up your social enterprise.'
      ]
    },
  };

  Map<String, double> get chartData {
    final Map<String, double> data = {};
    widget.scores.forEach((key, value) {
      if (value > 0) {
        data[key] = value.toDouble();
      }
    });
    return data;
  }

  List<String> get recommendedCareers {
    final Set<String> results = {};
    for (final category in widget.topCategories) {
      results.addAll(careerByCategory[category] ?? []);
    }
    return results.toList();
  }

  List<Map<String, dynamic>> get recommendedDetails {
    return recommendedCareers
        .where((career) => careerDetails.containsKey(career))
        .map((career) => {
              'title': career,
              ...careerDetails[career]!,
            })
        .toList();
  }

  Future<void> _generateAndShareReport() async {
    if (_isGenerating) return;

    setState(() {
      _isGenerating = true;
    });

    try {
      await _fileManagerService.deleteOldReports();
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

      await Share.shareXFiles(
        [XFile(file.path)],
        text: 'Career guidance report',
      );

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('PDF generated successfully.')),
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to generate PDF.')),
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
    final chartColors = [
      const Color(0xFF2563EB),
      const Color(0xFF9333EA),
      const Color(0xFF14B8A6),
      const Color(0xFFF97316),
      const Color(0xFF64748B),
      const Color(0xFF10B981),
    ];

    final percentage = widget.maxScore == 0
        ? 0
        : ((widget.totalScore / widget.maxScore) * 100).round();

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
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          title: const Text(
            'Your Career Options',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          backgroundColor: const Color(0xFF1E2A38),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Career Options',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10),
                Text(
                  'Top Category: ${widget.topCategory[0].toUpperCase()}${widget.topCategory.substring(1)}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 6),
                Text(
                  'Overall Score: $percentage%',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: recommendedCareers.length,
                      itemBuilder: (context, index) {
                        return Text("- ${recommendedCareers[index]}");
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "* Your top interests are ${widget.topCategories.join(', ')}. Consider careers that align with these strengths.",
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton.icon(
                    onPressed: _isGenerating ? null : _generateAndShareReport,
                    icon: const Icon(Icons.download),
                    label:
                        Text(_isGenerating ? 'Generating...' : 'Download PDF'),
                  ),
                ),
                const SizedBox(height: 12),
                if (chartData.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: PieChart(
                      dataMap: chartData,
                      animationDuration: const Duration(milliseconds: 2000),
                      chartType: ChartType.ring,
                      chartRadius: 180,
                      ringStrokeWidth: 30,
                      centerText: "Career Scores",
                      colorList: chartColors,
                      chartValuesOptions: const ChartValuesOptions(
                        showChartValuesInPercentage: false,
                        showChartValues: false,
                      ),
                      legendOptions: const LegendOptions(
                        legendPosition: LegendPosition.bottom,
                        legendShape: BoxShape.rectangle,
                        showLegends: false,
                      ),
                    ),
                  ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: chartData.keys.length,
                    itemBuilder: (context, index) {
                      final category = chartData.keys.elementAt(index);
                      final color = chartColors[index % chartColors.length];
                      return Row(
                        children: [
                          Container(height: 12, width: 12, color: color),
                          const SizedBox(width: 5),
                          Text(category),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recommendedDetails.length,
                  itemBuilder: (context, index) {
                    final career = recommendedDetails[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            career['title'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Salary: ${career['salary']}",
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Required Skills:",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: (career['skills'] as List<String>)
                                  .map((skill) => Text("• $skill"))
                                  .toList(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "How to Become:",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: (career['path'] as List<String>)
                                  .map((step) => Text("• $step"))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
