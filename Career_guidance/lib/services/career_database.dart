import '../models/career_model.dart';

/// Comprehensive career database with detailed information
class CareerDatabase {
  static const List<CareerModel> careers = [
    // Technology Careers
    CareerModel(
      title: 'Software Engineer',
      description: 'Design, develop, and maintain software systems and applications. Work on cutting-edge technologies and solve complex problems through code.',
      matchReason: 'Your strong analytical thinking, problem-solving abilities, and logical approach make you well-suited for software development.',
      skills: [
        'Programming (Python, Java, C++)',
        'Problem-solving and algorithms',
        'Data structures',
        'Software design patterns',
        'Version control (Git)',
        'Debugging and testing',
      ],
      educationPath: [
        'B.Tech/B.E. in Computer Science or related field',
        'Build projects and contribute to open source',
        'Learn multiple programming languages',
        'Master data structures and algorithms',
        'Pursue certifications (AWS, Google Cloud, etc.)',
        'Consider M.Tech for specialization',
      ],
      salaryRange: '₹4-25 LPA (Entry to Senior level)',
      categories: ['technology', 'research'],
      basePriority: 10,
    ),
    
    CareerModel(
      title: 'Data Scientist',
      description: 'Analyze complex data sets to extract insights and drive business decisions using statistical methods, machine learning, and data visualization.',
      matchReason: 'Your analytical mindset, research skills, and ability to work with numbers align perfectly with data science.',
      skills: [
        'Python/R programming',
        'Statistics and mathematics',
        'Machine learning algorithms',
        'Data visualization (Tableau, PowerBI)',
        'SQL and databases',
        'Business intelligence',
      ],
      educationPath: [
        'B.Tech in CS/IT or B.Sc. in Statistics/Mathematics',
        'Learn Python, R, and SQL',
        'Master statistics and probability',
        'Complete ML/AI courses and certifications',
        'Build data science portfolio projects',
        'Consider M.Sc. in Data Science',
      ],
      salaryRange: '₹6-30 LPA (Entry to Senior level)',
      categories: ['technology', 'research'],
      basePriority: 9,
    ),
    
    CareerModel(
      title: 'App Developer',
      description: 'Create mobile applications for iOS and Android platforms. Transform ideas into user-friendly mobile experiences.',
      matchReason: 'Your technical skills combined with creative problem-solving make you ideal for mobile app development.',
      skills: [
        'Mobile development (Flutter, React Native, Swift, Kotlin)',
        'UI/UX principles',
        'API integration',
        'Mobile architecture patterns',
        'App testing and debugging',
        'Version control',
      ],
      educationPath: [
        'B.Tech/B.E. in Computer Science or IT',
        'Learn mobile development frameworks',
        'Master platform-specific languages',
        'Build and publish apps to app stores',
        'Stay updated with mobile trends',
        'Create strong portfolio of apps',
      ],
      salaryRange: '₹3-20 LPA (Entry to Senior level)',
      categories: ['technology', 'creative'],
      basePriority: 8,
    ),

    CareerModel(
      title: 'Robotics Engineer',
      description: 'Design, build, and program robots and automated systems. Work at the intersection of mechanical, electrical, and computer engineering.',
      matchReason: 'Your hands-on approach, technical aptitude, and interest in practical problem-solving align with robotics engineering.',
      skills: [
        'Programming (Python, C++, ROS)',
        'Electronics and circuits',
        'Mechanical design',
        'Control systems',
        'Computer vision',
        'Sensor integration',
      ],
      educationPath: [
        'B.Tech in Robotics, Mechatronics, or related field',
        'Learn robotics frameworks (ROS)',
        'Build robotics projects',
        'Gain hands-on experience with hardware',
        'Participate in robotics competitions',
        'Consider M.Tech for advanced specialization',
      ],
      salaryRange: '₹5-22 LPA (Entry to Senior level)',
      categories: ['technology'],
      basePriority: 7,
    ),

    // Creative Careers
    CareerModel(
      title: 'UX/UI Designer',
      description: 'Create intuitive and visually appealing user interfaces. Enhance user experience through research, design, and testing.',
      matchReason: 'Your creativity, attention to detail, and understanding of user needs make you perfect for UX/UI design.',
      skills: [
        'Design tools (Figma, Adobe XD, Sketch)',
        'User research methods',
        'Wireframing and prototyping',
        'Visual design principles',
        'Interaction design',
        'Usability testing',
      ],
      educationPath: [
        'Bachelor\'s in Design, HCI, or related field',
        'Master design tools and principles',
        'Build a strong design portfolio',
        'Learn user research methodologies',
        'Complete UX/UI certifications',
        'Stay updated with design trends',
      ],
      salaryRange: '₹4-18 LPA (Entry to Senior level)',
      categories: ['creative', 'technology'],
      basePriority: 8,
    ),

    CareerModel(
      title: 'Graphic Designer',
      description: 'Create visual content for brands, marketing materials, and digital media. Communicate ideas through compelling graphics.',
      matchReason: 'Your artistic vision and creative thinking abilities are well-suited for graphic design work.',
      skills: [
        'Adobe Creative Suite (Photoshop, Illustrator, InDesign)',
        'Typography and color theory',
        'Branding and identity design',
        'Layout and composition',
        'Digital illustration',
        'Motion graphics',
      ],
      educationPath: [
        'Bachelor\'s in Graphic Design or Fine Arts',
        'Master Adobe Creative Suite',
        'Build diverse design portfolio',
        'Learn branding and marketing principles',
        'Complete design certifications',
        'Develop unique design style',
      ],
      salaryRange: '₹2.5-15 LPA (Entry to Senior level)',
      categories: ['creative'],
      basePriority: 6,
    ),

    CareerModel(
      title: 'Game Developer',
      description: 'Design and program video games across various platforms. Bring interactive entertainment experiences to life.',
      matchReason: 'Your combination of creativity, technical skills, and passion for interactive experiences suits game development.',
      skills: [
        'Game engines (Unity, Unreal Engine)',
        'C#, C++, JavaScript programming',
        'Game design principles',
        '2D/3D graphics',
        'Physics and mathematics',
        'Animation and audio integration',
      ],
      educationPath: [
        'B.Tech in CS or specialized Game Development degree',
        'Master Unity or Unreal Engine',
        'Learn game design principles',
        'Build and publish games',
        'Participate in game jams',
        'Create impressive portfolio',
      ],
      salaryRange: '₹3-20 LPA (Entry to Senior level)',
      categories: ['creative', 'technology'],
      basePriority: 7,
    ),

    CareerModel(
      title: 'Content Creator',
      description: 'Produce engaging content across various platforms including video, blogs, social media, and podcasts.',
      matchReason: 'Your creativity, communication skills, and understanding of audiences make you ideal for content creation.',
      skills: [
        'Content writing and storytelling',
        'Video editing',
        'Social media marketing',
        'SEO and analytics',
        'Photography/videography',
        'Audience engagement',
      ],
      educationPath: [
        'Bachelor\'s in Journalism, Communications, or related field',
        'Learn content creation tools',
        'Build online presence and portfolio',
        'Master platform-specific strategies',
        'Study analytics and SEO',
        'Develop unique content voice',
      ],
      salaryRange: '₹2-18 LPA (varies by platform and success)',
      categories: ['creative', 'social'],
      basePriority: 6,
    ),

    // Business Careers
    CareerModel(
      title: 'Product Manager',
      description: 'Lead product development from concept to launch. Bridge technical teams, business stakeholders, and customers.',
      matchReason: 'Your leadership skills, strategic thinking, and ability to coordinate multiple aspects make you suitable for product management.',
      skills: [
        'Product strategy and roadmapping',
        'Data analysis and metrics',
        'Stakeholder management',
        'Agile/Scrum methodologies',
        'Market research',
        'Communication and presentation',
      ],
      educationPath: [
        'Bachelor\'s in Business, Engineering, or related field',
        'Gain experience in tech or business roles',
        'Learn product management frameworks',
        'Complete PM certifications (CPM, CSPO)',
        'Build strong analytical skills',
        'Consider MBA for advancement',
      ],
      salaryRange: '₹8-35 LPA (Entry to Senior level)',
      categories: ['business', 'leadership', 'technology'],
      basePriority: 9,
    ),

    CareerModel(
      title: 'Business Analyst',
      description: 'Analyze business processes and requirements to improve organizational efficiency and drive strategic decisions.',
      matchReason: 'Your analytical abilities, business acumen, and problem-solving skills align with business analysis.',
      skills: [
        'Business process modeling',
        'Requirements gathering',
        'Data analysis and SQL',
        'Documentation and reporting',
        'Stakeholder communication',
        'Process improvement methodologies',
      ],
      educationPath: [
        'Bachelor\'s in Business, IT, or related field',
        'Learn business analysis frameworks',
        'Master data analysis tools',
        'Complete BA certifications (CBAP, PMI-PBA)',
        'Gain domain knowledge',
        'Develop strong communication skills',
      ],
      salaryRange: '₹4-20 LPA (Entry to Senior level)',
      categories: ['business', 'research'],
      basePriority: 7,
    ),

    CareerModel(
      title: 'Entrepreneur',
      description: 'Start and grow your own business venture. Innovate, take calculated risks, and create value in the market.',
      matchReason: 'Your independence, creative problem-solving, and willingness to take initiative indicate entrepreneurial potential.',
      skills: [
        'Business planning and strategy',
        'Financial management',
        'Marketing and sales',
        'Leadership and team building',
        'Risk assessment',
        'Networking and relationship building',
      ],
      educationPath: [
        'Bachelor\'s in Business or relevant field',
        'Gain industry experience',
        'Learn about startups and business models',
        'Develop specific domain expertise',
        'Build network of mentors and advisors',
        'Start small projects to gain experience',
      ],
      salaryRange: 'Variable (depends on business success)',
      categories: ['business', 'leadership'],
      basePriority: 6,
    ),

    // Social & Education Careers
    CareerModel(
      title: 'Teacher/Educator',
      description: 'Educate and inspire students across various subjects and age groups. Shape the next generation through knowledge transfer.',
      matchReason: 'Your ability to explain concepts, patience, and passion for helping others learn make teaching a great fit.',
      skills: [
        'Subject matter expertise',
        'Communication and presentation',
        'Classroom management',
        'Curriculum development',
        'Student assessment',
        'Empathy and patience',
      ],
      educationPath: [
        'Bachelor\'s in Education (B.Ed) or subject + B.Ed',
        'Specialize in chosen subject area',
        'Complete teacher training program',
        'Gain classroom experience through internships',
        'Pursue M.Ed for career advancement',
        'Stay updated with educational methodologies',
      ],
      salaryRange: '₹3-12 LPA (varies by institution)',
      categories: ['social', 'leadership'],
      basePriority: 7,
    ),

    CareerModel(
      title: 'Counselor',
      description: 'Provide guidance and support to individuals facing personal, academic, or career challenges. Help people make informed decisions.',
      matchReason: 'Your empathy, listening skills, and desire to help others indicate strong counseling potential.',
      skills: [
        'Active listening',
        'Empathy and emotional intelligence',
        'Communication skills',
        'Problem-solving',
        'Ethical judgment',
        'Assessment and evaluation',
      ],
      educationPath: [
        'Bachelor\'s in Psychology or Counseling',
        'Complete M.A. in Counseling Psychology',
        'Gain supervised practical experience',
        'Obtain relevant certifications',
        'Specialize in area (career, mental health, etc.)',
        'Pursue continuous professional development',
      ],
      salaryRange: '₹3-15 LPA (depends on specialization)',
      categories: ['social'],
      basePriority: 6,
    ),

    CareerModel(
      title: 'Social Worker',
      description: 'Work with communities and individuals to address social issues and improve quality of life.',
      matchReason: 'Your compassion, teamwork abilities, and commitment to helping others suit social work.',
      skills: [
        'Case management',
        'Community outreach',
        'Crisis intervention',
        'Advocacy and policy',
        'Cultural competency',
        'Documentation and reporting',
      ],
      educationPath: [
        'Bachelor\'s in Social Work (BSW)',
        'Complete fieldwork requirements',
        'Pursue MSW for advanced positions',
        'Get licensed (if required in your region)',
        'Specialize in specific population or issue',
        'Join professional social work organizations',
      ],
      salaryRange: '₹2.5-10 LPA (Entry to Senior level)',
      categories: ['social'],
      basePriority: 6,
    ),

    // Research & Analysis
    CareerModel(
      title: 'Research Analyst',
      description: 'Conduct in-depth research and analysis across various domains. Transform data into actionable insights and recommendations.',
      matchReason: 'Your research skills, analytical thinking, and attention to detail make research analysis an excellent match.',
      skills: [
        'Research methodologies',
        'Statistical analysis',
        'Data collection and interpretation',
        'Report writing',
        'Critical thinking',
        'Domain knowledge',
      ],
      educationPath: [
        'Bachelor\'s in relevant field (Science, Business, etc.)',
        'Master research methodologies',
        'Learn statistical software (SPSS, R)',
        'Build strong analytical skills',
        'Complete research projects',
        'Consider M.Sc. or Ph.D. for specialization',
      ],
      salaryRange: '₹4-18 LPA (Entry to Senior level)',
      categories: ['research'],
      basePriority: 7,
    ),

    // Leadership & Management
    CareerModel(
      title: 'Project Manager',
      description: 'Plan, execute, and oversee projects from initiation to completion. Coordinate teams, resources, and stakeholders.',
      matchReason: 'Your organizational skills, leadership abilities, and systematic approach suit project management.',
      skills: [
        'Project planning and scheduling',
        'Risk management',
        'Team leadership',
        'Budget management',
        'Stakeholder communication',
        'Agile/Waterfall methodologies',
      ],
      educationPath: [
        'Bachelor\'s in Engineering, Business, or related field',
        'Gain experience in relevant domain',
        'Learn PM methodologies and tools',
        'Complete PMP or PRINCE2 certification',
        'Develop leadership and communication skills',
        'Consider MBA for career advancement',
      ],
      salaryRange: '₹6-25 LPA (Entry to Senior level)',
      categories: ['leadership', 'business'],
      basePriority: 8,
    ),

    CareerModel(
      title: 'HR Manager',
      description: 'Manage human resources functions including recruitment, employee relations, training, and organizational development.',
      matchReason: 'Your people skills, leadership qualities, and organizational abilities make you suitable for HR management.',
      skills: [
        'Recruitment and talent acquisition',
        'Employee relations',
        'Performance management',
        'Labor laws and compliance',
        'Training and development',
        'Conflict resolution',
      ],
      educationPath: [
        'Bachelor\'s in HR, Business, or related field',
        'Complete MBA in HR Management',
        'Learn HRIS software systems',
        'Gain certifications (SHRM-CP, PHR)',
        'Develop strong interpersonal skills',
        'Stay updated with HR trends and laws',
      ],
      salaryRange: '₹5-22 LPA (Entry to Senior level)',
      categories: ['leadership', 'social'],
      basePriority: 7,
    ),

    // Sports & Fitness
    CareerModel(
      title: 'Fitness Trainer',
      description: 'Help individuals achieve their health and fitness goals through personalized training programs and nutritional guidance.',
      matchReason: 'Your active lifestyle, interest in sports, and desire to help others improve makes fitness training ideal.',
      skills: [
        'Exercise science and anatomy',
        'Program design',
        'Nutrition basics',
        'Motivation and coaching',
        'Client assessment',
        'Safety and injury prevention',
      ],
      educationPath: [
        'Certification from recognized body (ACE, NASM, ACSM)',
        'Study anatomy and exercise physiology',
        'Gain practical experience',
        'Specialize in area (strength, yoga, etc.)',
        'Consider degree in Exercise Science',
        'Stay updated with fitness trends',
      ],
      salaryRange: '₹2-12 LPA (varies by clientele)',
      categories: ['sports'],
      basePriority: 6,
    ),

    CareerModel(
      title: 'Sports Coach',
      description: 'Train athletes and teams to improve performance. Develop strategies, provide guidance, and motivate players.',
      matchReason: 'Your competitive spirit, leadership, and passion for sports make coaching a natural fit.',
      skills: [
        'Sport-specific expertise',
        'Training program development',
        'Team management',
        'Strategy and tactics',
        'Motivation and leadership',
        'Performance analysis',
      ],
      educationPath: [
        'Bachelor\'s in Physical Education or Sports Science',
        'Gain playing experience in the sport',
        'Complete coaching certifications',
        'Start with assistant coaching roles',
        'Study game tactics and strategies',
        'Build coaching portfolio',
      ],
      salaryRange: '₹3-20 LPA (varies by sport and level)',
      categories: ['sports', 'leadership'],
      basePriority: 6,
    ),
  ];

  /// Get all careers matching specified categories
  static List<CareerModel> getCareersForCategories(List<String> categories) {
    return careers
        .where((career) =>
            career.categories.any((cat) => categories.contains(cat)))
        .toList();
  }

  /// Get career by title
  static CareerModel? getCareerByTitle(String title) {
    try {
      return careers.firstWhere((career) => career.title == title);
    } catch (e) {
      return null;
    }
  }
}
