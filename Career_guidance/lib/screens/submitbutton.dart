import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;
class SubmittedScreen extends StatefulWidget {
  final List<Map<String, dynamic>> questions;

  const SubmittedScreen({Key? key, required this.questions}) : super(key: key);

  @override
  _SubmittedScreenState createState() => _SubmittedScreenState();
}

class _SubmittedScreenState extends State<SubmittedScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> messages = [
    'Hello! I am your career advice chatbot. How can I assist you today?',
    'Feel free to ask me any questions or seek advice on career planning.',
  ];
  Future<void> submitQuiz() async {
    //   {
    //   'question':
    //       'I am comfortable adapting to new situations and learning new things throughout my career.',
    //   'type': 'boolean',
    //   'answer': true,
    //   'selected': null,
    // },
    log("IN SUBMIT QUIZ");
    String? str = "Rk";
    final requestBody = json.encode(
      {
        "model": "gpt-4-32k",
        "messages": [
          {
            "role": "system",
            "content":
                "You are a helpful assistant that analyzes all the quiz data give that all quiz answerlike you are 10th student and then after your are career guide thae help to guide in career after analyz all the data ."
          },
          {
            "role": "user",
            "content":
                """ this is a questions analyzed all this questionther option are also avilabhe in that question, in that question the range question are also in that so analyz all this question acordind that
                 this are question are present in curly brackets. in that curly brackets  that are sub part are present in single inverted coma in that single inverted coma ther is question, there options, type of question,  "  
                 {
    'question':
        'I believe in working hard to achieve my goals, even when faced with challenges.',
    'type': 'boolean',
    'answer': true,
    
  },
  {
    'question':
        'It\'s more important to me to be (respected for my expertise, admired for my creativity, appreciated for my teamwork skills, known for my independence). Explain your choice (one line).',
    'options': [
      'respected for my expertise',
      'admired for my creativity',
      'appreciated for my teamwork skills',
      'known for my independence'
    ],
    'answer': 'respected for my expertise',
     
  },
  {
    'question':
        'When faced with a problem, I typically (analyze the situation logically, brainstorm creative solutions, seek advice from others, try different approaches until I find one that works).',
    'options': [
      'analyze the situation logically',
      'brainstorm creative solutions',
      'seek advice from others',
      'try different approaches until I find one that works'
    ],
    'answer': 'analyze the situation logically',
    
  },

  {
    'question':
        'Rate yourself on your ability to learn new concepts quickly (1 = Slow learner, 5 = Quick learner).',
    'type': 'scale',
    'min': 1,
    'max': 5,
     
  },
  {
    'question':
        'I prefer learning environments that are (teacher-centered with lectures, discussion-based with group work, hands-on with practical activities, independent with self-study).',
    'options':
      'teacher-centered with lectures',
      'discussion-based with group work',
      'hands-on with practical activities',
      'independent with self-study'
    
  },
  {
    'question':
        'I enjoy taking on challenging academic projects that require research and critical thinking.',
    'type': 'boolean',
    'answer': true,
  },

  Interests and Activities (Outside of School)
  {
    'question':
        'In one sentence, what do you enjoy doing most in your free time?',
    'type': 'short_answer',
    'answer': '',
    
  },
  {
    'question':
        'I find myself drawn to activities that involve (working with technology, creating art or music, helping others in need, competing in sports or games, analyzing data and solving puzzles). Choose up to 2.',
    'options':
      'working with technology',
      'creating art or music',
      'helping others in need',
      'competing in sports or games',
      'analyzing data and solving puzzles'
    
  },
  {
    'question':
        'Have you participated in any recent projects or activities outside of school that you found particularly engaging? (One line)',
    'type': 'short_answer',
     
  },
 
  Career Aspirations and Working Style
  {
    'question': 'I am open to relocating for the right career opportunity.',
    'type': 'boolean',
    'answer': true,
    'selected': null,
  },
  {
    'question':
        'I would thrive in a work environment that is (fast-paced and constantly changing, stable and predictable, highly collaborative, independent with limited supervision).',
    'options': 
      'fast-paced and constantly changing',
      'stable and predictable',
      'highly collaborative',
      'independent with limited supervision'
    
  },
  {
    'question':
        'How important is financial security to you in your future career (1 = Not important, 5 = Very important)?',
    'type': 'scale',
    'min': 1,
    'max': 5,
    
  },
  {
    'question':
        'I find myself more productive when working (independently on individual tasks, collaboratively as part of a team, on a variety of different projects, on a single project from start to finish).',
    'options':
      'independently on individual tasks',
      'collaboratively as part of a team',
      'on a variety of different projects',
      'on a single project from start to finish'
 
  },
    Motivational Factors and Skills
  {
    'question':
        'I am motivated by the prospect of making a real difference in the world through my work.',
    'type': 'boolean',
    
   
  },
  {
    'question':
        'What is one skill you are constantly working on improving? (One line)',
    'type': 'short_answer',
 
  },
  {
    'question':
        'I am most satisfied when I can (use my imagination to come up with creative solutions, learn new things and expand my knowledge base, help others achieve their goals, achieve tangible results and see my work come to life).',
    'options':
      'use my imagination to come up with creative solutions',
      'learn new things and expand my knowledge base',
      'help others achieve their goals',
      'achieve tangible results and see my work come to life'
 
  },
 
    Exploring Beyond Traditional Fields
  {
    'question':
        'Have you considered careers in fields like (engineering, design, social work, entrepreneurship, healthcare, etc.)? Choose all that apply.',
    'options':
      'engineering',
      'design',
      'social work',
      'entrepreneurship',
      'healthcare',
      'etc.'
 
  },
  {
    'question':
        'I am interested in learning more about career paths that are not commonly considered.',
    'type': 'boolean',
    
  },
  {
    'question':
        'Imagine you have unlimited resources. What kind of work would you dedicate your time to? (One line)',
    'type': 'short_answer',
  
  },
 Strengths and Weaknesses (One Line Answers)
  {
    'question':
        'What is one subject you find most challenging and why? (One line)',
    'type': 'short_answer',
  }
  {
    'question':
        'Describe a skill you possess that others might not know about. (One line)',
    'type': 'short_answer',
  }
  Learning and Communication (Multiple Choice)
  {
    'question':
        'I learn best by (reading textbooks, listening to lectures, participating in discussions, working on hands-on projects).',
    'options': 
      'reading textbooks',
      'listening to lectures',
      'participating in discussions',
      'working on hands-on projects'
 
  },
  {
    'question':
        'When explaining a complex concept to others, I prefer to use (visual aids like diagrams, real-world examples, step-by-step instructions, storytelling).',
    'options': 
      'visual aids like diagrams',
      'real-world examples',
      'step-by-step instructions',
      'storytelling'
  
  },
  Work Environment and Lifestyle
  {
    'question':
        'I am comfortable working in a fast-paced environment with tight deadlines.',
    'type': 'boolean',
  },
  {
    'question':
        'How important is a good work-life balance to you (1 = Not important, 5 = Very important)?',
    'type': 'scale',
    'min': 1,
    'max': 5,
  },
  {
    'question':
        'I would prefer a job that offers (opportunities for travel, a chance to work remotely, flexible work hours, a clear career advancement path). Choose up to 2.',
    'options':
      'opportunities for travel',
      'a chance to work remotely',
      'flexible work hours',
      'a clear career advancement path'
 
  },
  Values and Ethics (True/False)
  {
    'question':
        'It is important to me that my work aligns with my personal values and ethics.',
    'type': 'boolean',
  },
  {
    'question':
        'I am willing to stand up for what I believe in, even if it means going against the majority opinion.',
    'type': 'boolean',
  },
 Leadership and Teamwork
  {
    'question':
        'In a team setting, I find myself naturally (taking initiative and leading the project, providing support and offering different perspectives, following instructions and completing assigned tasks, mediating disagreements and finding compromises).',
    'options': 
      'taking initiative and leading the project',
      'providing support and offering different perspectives',
      'following instructions and completing assigned tasks',
      'mediating disagreements and finding compromises'
  },
 Problem-Solving and Decision-Making
  {
    'question':
        'Describe a situation where you had to make a difficult decision. How did you approach it? (One line)',
    'type': 'short_answer',
  },
  {
    'question':
        'When faced with a problem, I typically (analyze the data and logic first, consider all possible solutions before acting, seek input from others, trust my gut instinct).',
    'options':
      'analyze the data and logic first',
      'consider all possible solutions before acting',
      'seek input from others',
      'trust my gut instinct'
 
  },
  Adaptability and Lifelong Learning
  {
    'question':
        'I am comfortable adapting to new situations and learning new things throughout my career.',
    'type': 'boolean',
  },
  {
    
    'question':
        'I stay up-to-date on current trends and developments in the fields that interest me by (reading industry publications, attending workshops and conferences, networking with professionals, taking online courses).',
    'options': 
      'reading industry publications',
      'attending workshops and conferences',
      'networking with professionals',
      'taking online courses'
 
  },
  Career Exploration
  {
    'question':
        'Are there any specific career fields you find particularly interesting? Choose all that apply (e.g., science, arts, business, technology, education, etc.).',
    'options': 
      'science',
      'arts',
      'business',
      'technology',
      'education',
      'etc.'
  },
  {
    'question':
        'What kind of work environment are you most interested in (e.g., working outdoors, working in an office, working in a creative studio, working in a laboratory, etc.)? Choose up to 2.',
    'options':
      'working outdoors',
      'working in an office',
      'working in a creative studio',
      'working in a laboratory'
  },
".this are sole instration present in double inverted coma"after analyzed all this queation this a the 10th stander boy or girl are solving that question, solve all this question. after solving this question 
this like a your are career quide how analyzed all this question and there answer, and guide the that student, give us the chart of career option that help in that fuature.
give us the caree grapth also that help him to analyzed ther self. give him some graphicical represention also that help him to analyzed there self . also conside all the unike field that help him to there fuature. "
          """
          },
          // {
          //   "role": "user",
          //   "content": {
          //     "quiz_data":
          //         "Career Assessment Quiz: Users can take a comprehensive quiz to identify their strengths, interests, and goals"
          //   }
          // }
        ]
      },
    );
    // final response = await http.post(
    //   Uri.parse('https://api.openai.com/v1/chat/completions'),
    //   headers: {
    //     'Content-Type': 'application/json',
    //     'Authorization':
    //         'das',

    //     // 'Authorization':
    //     //     'ads',
    //   },

    //   body: requestBody,
    // );
    // log("AFTER POST METHOD");
    // // log(response.body);

    //   log(response.statusCode.toString());
    //   if (response.statusCode == 200) {
    //     // Quiz submitted successfully
    //     var data = json.decode(response.body);
    //     log(data['choices'][0]['message']['content']);
    //     log('Quiz submitted successfully');
    //     // log(response.body);
    //   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submitted'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.questions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.questions[index]['question'].toString()),
                  subtitle: Text(
                      'Your Answer: ${widget.questions[index]['selected'] ?? 'Not Answered'}'),
                  trailing: const Icon(Icons.chat_bubble),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      await submitQuiz();
                    },
                    child: Text("datasended to algo")),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      setState(() {
                        messages.add(_controller.text);
                        _controller.clear();
                        // Here, you can implement logic to respond to user messages.
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
