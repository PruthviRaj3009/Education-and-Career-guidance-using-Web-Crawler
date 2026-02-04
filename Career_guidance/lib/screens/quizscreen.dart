import 'package:flutter/material.dart';
import 'package:careerguidance/screens/finalpage.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Map<String, dynamic>> questions = [
    {
      'question':
          'I believe in working hard to achieve my goals, even when faced with challenges.',
      'type': 'boolean',
      'category': 'leadership',
      'selected': null,
      'required': true,
    },
    {
      'question':
          'It\'s more important to me to be (respected for my expertise, admired for my creativity, appreciated for my teamwork skills, known for my independence). Explain your choice (one line).',
      'type': 'options',
      'category': 'leadership',
      'options': [
        'respected for my expertise',
        'admired for my creativity',
        'appreciated for my teamwork skills',
        'known for my independence'
      ],
      'categoryScores': {
        'respected for my expertise': 'research',
        'admired for my creativity': 'creative',
        'appreciated for my teamwork skills': 'social',
        'known for my independence': 'business',
      },
      'selected': null,
      'required': true,
    },
    {
      'question':
          'When faced with a problem, I typically (analyze the situation logically, brainstorm creative solutions, seek advice from others, try different approaches until I find one that works).',
      'type': 'options',
      'category': 'research',
      'options': [
        'analyze the situation logically',
        'brainstorm creative solutions',
        'seek advice from others',
        'try different approaches until I find one that works'
      ],
      'categoryScores': {
        'analyze the situation logically': 'research',
        'brainstorm creative solutions': 'creative',
        'seek advice from others': 'social',
        'try different approaches until I find one that works': 'technology',
      },
      'selected': null,
      'required': true,
    },
    {
      'question':
          'Rate yourself on your ability to learn new concepts quickly (1 = Slow learner, 5 = Quick learner).',
      'type': 'scale',
      'category': 'research',
      'min': 1,
      'max': 5,
      'selected': null,
      'required': true,
    },
    {
      'question':
          'I prefer learning environments that are (teacher-centered with lectures, discussion-based with group work, hands-on with practical activities, independent with self-study).',
      'type': 'options',
      'category': 'social',
      'options': [
        'teacher-centered with lectures',
        'discussion-based with group work',
        'hands-on with practical activities',
        'independent with self-study'
      ],
      'categoryScores': {
        'teacher-centered with lectures': 'research',
        'discussion-based with group work': 'social',
        'hands-on with practical activities': 'technology',
        'independent with self-study': 'business',
      },
      'selected': null,
      'required': true,
    },
    {
      'question':
          'I enjoy taking on challenging academic projects that require research and critical thinking.',
      'type': 'boolean',
      'category': 'research',
      'selected': null,
      'required': true,
    },
    {
      'question':
          'In one sentence, what do you enjoy doing most in your free time?',
      'type': 'short_answer',
      'category': 'creative',
      'selected': null,
      'required': true,
    },
    {
      'question':
          'I find myself drawn to activities that involve (working with technology, creating art or music, helping others in need, competing in sports or games, analyzing data and solving puzzles). Choose up to 2.',
      'type': 'multi_choice',
      'category': 'creative',
      'options': [
        'working with technology',
        'creating art or music',
        'helping others in need',
        'competing in sports or games',
        'analyzing data and solving puzzles'
      ],
      'categoryScores': {
        'working with technology': 'technology',
        'creating art or music': 'creative',
        'helping others in need': 'social',
        'competing in sports or games': 'sports',
        'analyzing data and solving puzzles': 'research',
      },
      'selected': <String>[],
      'required': true,
      'maxSelections': 2,
    },
    {
      'question':
          'Have you participated in any recent projects or activities outside of school that you found particularly engaging? (One line)',
      'type': 'short_answer',
      'category': 'leadership',
      'selected': null,
      'required': true,
    },
    {
      'question': 'I am open to relocating for the right career opportunity.',
      'type': 'boolean',
      'category': 'leadership',
      'selected': null,
      'required': true,
    },
    {
      'question':
          'I would thrive in a work environment that is (fast-paced and constantly changing, stable and predictable, highly collaborative, independent with limited supervision).',
      'type': 'options',
      'category': 'business',
      'options': [
        'fast-paced and constantly changing',
        'stable and predictable',
        'highly collaborative',
        'independent with limited supervision'
      ],
      'categoryScores': {
        'fast-paced and constantly changing': 'business',
        'stable and predictable': 'research',
        'highly collaborative': 'social',
        'independent with limited supervision': 'technology',
      },
      'selected': null,
      'required': true,
    },
    {
      'question':
          'How important is financial security to you in your future career (1 = Not important, 5 = Very important)?',
      'type': 'scale',
      'category': 'business',
      'min': 1,
      'max': 5,
      'selected': null,
      'required': true,
    },
    {
      'question':
          'I find myself more productive when working (independently on individual tasks, collaboratively as part of a team, on a variety of different projects, on a single project from start to finish).',
      'type': 'options',
      'category': 'leadership',
      'options': [
        'independently on individual tasks',
        'collaboratively as part of a team',
        'on a variety of different projects',
        'on a single project from start to finish'
      ],
      'categoryScores': {
        'independently on individual tasks': 'business',
        'collaboratively as part of a team': 'social',
        'on a variety of different projects': 'creative',
        'on a single project from start to finish': 'research',
      },
      'selected': null,
      'required': true,
    },
    {
      'question':
          'I am motivated by the prospect of making a real difference in the world through my work.',
      'type': 'boolean',
      'category': 'social',
      'selected': null,
      'required': true,
    },
    {
      'question':
          'What is one skill you are constantly working on improving? (One line)',
      'type': 'short_answer',
      'category': 'research',
      'selected': null,
      'required': true,
    },
    {
      'question':
          'I am most satisfied when I can (use my imagination to come up with creative solutions, learn new things and expand my knowledge base, help others achieve their goals, achieve tangible results and see my work come to life).',
      'type': 'options',
      'category': 'creative',
      'options': [
        'use my imagination to come up with creative solutions',
        'learn new things and expand my knowledge base',
        'help others achieve their goals',
        'achieve tangible results and see my work come to life'
      ],
      'categoryScores': {
        'use my imagination to come up with creative solutions': 'creative',
        'learn new things and expand my knowledge base': 'research',
        'help others achieve their goals': 'social',
        'achieve tangible results and see my work come to life': 'business',
      },
      'selected': null,
      'required': true,
    },
    {
      'question':
          'Have you considered careers in fields like (engineering, design, social work, entrepreneurship, healthcare, etc.)? Choose all that apply.',
      'type': 'multi_choice',
      'category': 'technology',
      'options': [
        'engineering',
        'design',
        'social work',
        'entrepreneurship',
        'healthcare',
        'etc.'
      ],
      'categoryScores': {
        'engineering': 'technology',
        'design': 'creative',
        'social work': 'social',
        'entrepreneurship': 'business',
        'healthcare': 'social',
        'etc.': 'research',
      },
      'selected': <String>[],
      'required': true,
      'maxSelections': 2,
    },
    {
      'question':
          'I am interested in learning more about career paths that are not commonly considered.',
      'type': 'boolean',
      'category': 'creative',
      'selected': null,
      'required': true,
    },
    {
      'question':
          'Imagine you have unlimited resources. What kind of work would you dedicate your time to? (One line)',
      'type': 'short_answer',
      'category': 'creative',
      'selected': null,
      'required': true,
    },
    {
      'question':
          'What is one subject you find most challenging and why? (One line)',
      'type': 'short_answer',
      'category': 'research',
      'selected': null,
      'required': true,
    },
    {
      'question':
          'Describe a skill you possess that others might not know about. (One line)',
      'type': 'short_answer',
      'category': 'creative',
      'selected': null,
      'required': true,
    },
    {
      'question':
          'I learn best by (reading textbooks, listening to lectures, participating in discussions, working on hands-on projects).',
      'type': 'options',
      'category': 'research',
      'options': [
        'reading textbooks',
        'listening to lectures',
        'participating in discussions',
        'working on hands-on projects'
      ],
      'categoryScores': {
        'reading textbooks': 'research',
        'listening to lectures': 'research',
        'participating in discussions': 'social',
        'working on hands-on projects': 'technology',
      },
      'selected': null,
      'required': true,
    },
    {
      'question':
          'When explaining a complex concept to others, I prefer to use (visual aids like diagrams, real-world examples, step-by-step instructions, storytelling).',
      'type': 'options',
      'category': 'creative',
      'options': [
        'visual aids like diagrams',
        'real-world examples',
        'step-by-step instructions',
        'storytelling'
      ],
      'categoryScores': {
        'visual aids like diagrams': 'creative',
        'real-world examples': 'business',
        'step-by-step instructions': 'research',
        'storytelling': 'creative',
      },
      'selected': null,
      'required': true,
    },
    {
      'question':
          'I am comfortable working in a fast-paced environment with tight deadlines.',
      'type': 'boolean',
      'category': 'business',
      'selected': null,
      'required': true,
    },
    {
      'question':
          'How important is a good work-life balance to you (1 = Not important, 5 = Very important)?',
      'type': 'scale',
      'category': 'social',
      'min': 1,
      'max': 5,
      'selected': null,
      'required': true,
    },
    {
      'question':
          'I would prefer a job that offers (opportunities for travel, a chance to work remotely, flexible work hours, a clear career advancement path). Choose up to 2.',
      'type': 'multi_choice',
      'category': 'business',
      'options': [
        'opportunities for travel',
        'a chance to work remotely',
        'flexible work hours',
        'a clear career advancement path'
      ],
      'categoryScores': {
        'opportunities for travel': 'social',
        'a chance to work remotely': 'technology',
        'flexible work hours': 'business',
        'a clear career advancement path': 'leadership',
      },
      'selected': <String>[],
      'required': true,
      'maxSelections': 2,
    },
    {
      'question':
          'It is important to me that my work aligns with my personal values and ethics.',
      'type': 'boolean',
      'category': 'social',
      'selected': null,
      'required': true,
    },
    {
      'question':
          'I am willing to stand up for what I believe in, even if it means going against the majority opinion.',
      'type': 'boolean',
      'category': 'leadership',
      'selected': null,
      'required': true,
    },
    {
      'question':
          'In a team setting, I find myself naturally (taking initiative and leading the project, providing support and offering different perspectives, following instructions and completing assigned tasks, mediating disagreements and finding compromises).',
      'type': 'options',
      'category': 'leadership',
      'options': [
        'taking initiative and leading the project',
        'providing support and offering different perspectives',
        'following instructions and completing assigned tasks',
        'mediating disagreements and finding compromises'
      ],
      'categoryScores': {
        'taking initiative and leading the project': 'leadership',
        'providing support and offering different perspectives': 'social',
        'following instructions and completing assigned tasks': 'research',
        'mediating disagreements and finding compromises': 'social',
      },
      'selected': null,
      'required': true,
    },
    {
      'question':
          'Describe a situation where you had to make a difficult decision. How did you approach it? (One line)',
      'type': 'short_answer',
      'category': 'leadership',
      'selected': null,
      'required': true,
    },
    {
      'question':
          'When faced with a problem, I typically (analyze the data and logic first, consider all possible solutions before acting, seek input from others, trust my gut instinct).',
      'type': 'options',
      'category': 'research',
      'options': [
        'analyze the data and logic first',
        'consider all possible solutions before acting',
        'seek input from others',
        'trust my gut instinct'
      ],
      'categoryScores': {
        'analyze the data and logic first': 'research',
        'consider all possible solutions before acting': 'business',
        'seek input from others': 'social',
        'trust my gut instinct': 'creative',
      },
      'selected': null,
      'required': true,
    },
    {
      'question':
          'I am comfortable adapting to new situations and learning new things throughout my career.',
      'type': 'boolean',
      'category': 'research',
      'selected': null,
      'required': true,
    },
    {
      'question':
          'I stay up-to-date on current trends and developments in the fields that interest me by (reading industry publications, attending workshops and conferences, networking with professionals, taking online courses).',
      'type': 'options',
      'category': 'research',
      'options': [
        'reading industry publications',
        'attending workshops and conferences',
        'networking with professionals',
        'taking online courses'
      ],
      'categoryScores': {
        'reading industry publications': 'research',
        'attending workshops and conferences': 'leadership',
        'networking with professionals': 'business',
        'taking online courses': 'technology',
      },
      'selected': null,
      'required': true,
    },
    {
      'question':
          'Are there any specific career fields you find particularly interesting? Choose all that apply (e.g., science, arts, business, technology, education, etc.).',
      'type': 'multi_choice',
      'category': 'technology',
      'options': [
        'science',
        'arts',
        'business',
        'technology',
        'education',
        'etc.'
      ],
      'categoryScores': {
        'science': 'research',
        'arts': 'creative',
        'business': 'business',
        'technology': 'technology',
        'education': 'social',
        'etc.': 'leadership',
      },
      'selected': <String>[],
      'required': true,
      'maxSelections': 2,
    },
    {
      'question':
          'What kind of work environment are you most interested in (e.g., working outdoors, working in an office, working in a creative studio, working in a laboratory, etc.)? Choose up to 2.',
      'type': 'multi_choice',
      'category': 'technology',
      'options': [
        'working outdoors',
        'working in an office',
        'working in a creative studio',
        'working in a laboratory'
      ],
      'categoryScores': {
        'working outdoors': 'sports',
        'working in an office': 'business',
        'working in a creative studio': 'creative',
        'working in a laboratory': 'research',
      },
      'selected': <String>[],
      'required': true,
      'maxSelections': 2,
    },
  ];

  void _selectOption(int questionIndex, dynamic option) {
    setState(() {
      questions[questionIndex]['selected'] = option;
    });
  }

  void _toggleMultiChoice(int questionIndex, String option) {
    final selected =
        (questions[questionIndex]['selected'] as List<String>?) ?? <String>[];
    final maxSelections = questions[questionIndex]['maxSelections'] as int? ?? 2;

    setState(() {
      if (selected.contains(option)) {
        selected.remove(option);
      } else {
        if (selected.length < maxSelections) {
          selected.add(option);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('You can select up to $maxSelections options.'),
            ),
          );
        }
      }
      questions[questionIndex]['selected'] = selected;
    });
  }

  bool _isAnswered(Map<String, dynamic> question) {
    final selected = question['selected'];
    if (question['type'] == 'short_answer') {
      return selected != null && selected.toString().trim().isNotEmpty;
    }
    if (question['type'] == 'multi_choice') {
      return selected is List && selected.isNotEmpty;
    }
    return selected != null;
  }

  Map<String, int> _calculateScores() {
    final Map<String, int> scores = {};

    for (final question in questions) {
      final category = question['category'] as String?;
      if (category == null) continue;

      final selected = question['selected'];
      if (selected == null) continue;

      if (question['type'] == 'boolean') {
        scores[category] = (scores[category] ?? 0) + (selected == true ? 2 : 0);
      } else if (question['type'] == 'scale') {
        scores[category] = (scores[category] ?? 0) + (selected as int);
      } else if (question['type'] == 'short_answer') {
        scores[category] = (scores[category] ?? 0) + 1;
      } else if (question['type'] == 'multi_choice') {
        final mapping = question['categoryScores'] as Map<String, String>?;
        for (final option in (selected as List<String>)) {
          final mappedCategory = mapping?[option] ?? category;
          scores[mappedCategory] = (scores[mappedCategory] ?? 0) + 2;
        }
      } else {
        final mapping = question['categoryScores'] as Map<String, String>?;
        final mappedCategory = mapping?[selected] ?? category;
        scores[mappedCategory] = (scores[mappedCategory] ?? 0) + 2;
      }
    }

    return scores;
  }

  List<String> _topCategories(Map<String, int> scores, int count) {
    final entries = scores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return entries.take(count).map((e) => e.key).toList();
  }

  int _calculateMaxScore() {
    var maxScore = 0;
    for (final question in questions) {
      final type = question['type'];
      if (type == 'boolean') {
        maxScore += 2;
      } else if (type == 'scale') {
        maxScore += (question['max'] as int? ?? 0);
      } else if (type == 'short_answer') {
        maxScore += 1;
      } else if (type == 'multi_choice') {
        final maxSelections = question['maxSelections'] as int? ?? 2;
        maxScore += maxSelections * 2;
      } else {
        maxScore += 2;
      }
    }
    return maxScore;
  }

  int _calculateTotalScore(Map<String, int> scores) {
    return scores.values.fold(0, (sum, value) => sum + value);
  }

  void _handleSubmit() {
    final unanswered = questions
        .where((q) => q['required'] == true)
        .where((q) => !_isAnswered(q))
        .toList();

    if (unanswered.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please answer all required questions.')),
      );
      return;
    }

    final scores = _calculateScores();
    if (scores.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to calculate your scores.')),
      );
      return;
    }

    final topCategories = _topCategories(scores, 3);
    final topCategory = topCategories.first;
    final totalScore = _calculateTotalScore(scores);
    final maxScore = _calculateMaxScore();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FinalPage(
          scores: scores,
          topCategory: topCategory,
          topCategories: topCategories,
          totalScore: totalScore,
          maxScore: maxScore,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ...questions.map((question) {
              int questionIndex = questions.indexOf(question);
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        question['question'],
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      if (question['type'] == 'boolean') ...[
                        Row(
                          children: [true, false].map((option) {
                            return Expanded(
                              child: GestureDetector(
                                onTap: () =>
                                    _selectOption(questionIndex, option),
                                child: Container(
                                  color: question['selected'] == option
                                      ? Colors.blue.withOpacity(0.5)
                                      : Colors.transparent,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10.0),
                                  child: Center(
                                    child: Text(
                                      option ? 'True' : 'False',
                                      style: const TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ] else if (question['type'] == 'scale') ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                              question['max'] - question['min'] + 1, (index) {
                            int value = question['min'] + index;
                            return GestureDetector(
                              onTap: () => _selectOption(questionIndex, value),
                              child: Container(
                                color: question['selected'] == value
                                    ? Colors.blue.withOpacity(0.5)
                                    : Colors.transparent,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 12.0),
                                child: Text(
                                  value.toString(),
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                              ),
                            );
                          }),
                        ),
                      ] else if (question['type'] == 'short_answer') ...[
                        TextField(
                          onChanged: (value) =>
                              _selectOption(questionIndex, value),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Type your answer here',
                          ),
                        ),
                      ] else if (question['type'] == 'multi_choice') ...[
                        Column(
                          children: question['options'].map<Widget>((option) {
                            final selected =
                                (question['selected'] as List<String>?) ??
                                    <String>[];
                            final isSelected = selected.contains(option);
                            return GestureDetector(
                              onTap: () =>
                                  _toggleMultiChoice(questionIndex, option),
                              child: Container(
                                color: isSelected
                                    ? Colors.blue.withOpacity(0.5)
                                    : Colors.transparent,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(option,
                                          style:
                                              const TextStyle(fontSize: 16.0)),
                                    ),
                                    if (isSelected)
                                      const Icon(Icons.check,
                                          color: Colors.blue),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ] else ...[
                        Column(
                          children: question['options'].map<Widget>((option) {
                            return GestureDetector(
                              onTap: () => _selectOption(questionIndex, option),
                              child: Container(
                                color: question['selected'] == option
                                    ? Colors.blue.withOpacity(0.5)
                                    : Colors.transparent,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(option,
                                            style: const TextStyle(
                                                fontSize: 16.0))),
                                    if (question['selected'] == option)
                                      const Icon(Icons.check,
                                          color: Colors.blue),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }).toList(),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _handleSubmit,
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
