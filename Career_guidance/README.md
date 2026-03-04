# 🎓 Career Guidance App

A comprehensive Flutter mobile application powered by Google Gemini AI that helps users discover their ideal career path through personalized assessments, AI-powered chatbot guidance, and detailed career exploration tools.

![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?style=flat&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?style=flat&logo=dart)
![Firebase](https://img.shields.io/badge/Firebase-Enabled-FFCA28?style=flat&logo=firebase)
![Gemini AI](https://img.shields.io/badge/Gemini-2.5%20Flash-4285F4?style=flat&logo=google)

---

## 📱 About The Project

Career Guidance is a modern, intuitive mobile application designed to help students and professionals make informed career decisions. By combining AI-powered conversations, comprehensive career assessments, and expert guidance, the app provides personalized recommendations tailored to each user's unique strengths, interests, and goals.

### ✨ Key Features

- **🤖 AI-Powered Chatbot**: Get instant career advice through intelligent conversations powered by Google Gemini 2.5 Flash
- **📝 Career Assessment Quiz**: Take comprehensive quizzes to identify strengths, interests, and career goals
- **🔍 Career Exploration**: Explore various career paths with detailed information and achievement roadmaps
- **📊 Personalized Recommendations**: Receive tailored career suggestions based on quiz results and interests
- **👥 Expert Team Access**: Connect with career guidance professionals
- **⚙️ Theme Customization**: Light/Dark mode support with system preference sync
- **🔐 Secure Authentication**: Firebase authentication for user accounts
- **📱 Modern UI/UX**: Material Design 3 compliant interface with responsive layouts

---

## 🎯 App Screens Overview

### 🏠 **Home Screen**
- Dashboard with quick access to all features
- Featured career paths
- Recent quiz results
- Quick access to AI chatbot

### 💬 **AI Chatbot (Gemini Integration)**
- Real-time conversation with Gemini 2.5 Flash AI
- Context-aware responses
- Career-specific guidance
- Message history
- Typing indicators

### 📋 **Career Quiz**
- Interactive assessment questions
- Multiple categories (interests, skills, personality)
- Progress tracking
- Detailed results with visualizations
- PDF report generation

### 🌟 **Features Screen**
- Overview of app capabilities
- Feature descriptions with icons
- Quick navigation to each feature

### ℹ️ **About & Info**
- App information and version
- Developer details
- Privacy policy and terms
- Permissions overview

### 👤 **Team**
- Meet the development team
- Contact information
- Professional profiles
- Social links

### ⚙️ **Settings**
- Theme selection (Light/Dark/System)
- Account management
- Notifications preferences
- App information

### 📞 **Support**
- Contact support team
- FAQs
- Help documentation
- Feedback submission

---

## 🛠️ Technologies Used

### **Frontend**
- **Flutter** 3.0+ - Cross-platform UI framework
- **Dart** 3.0+ - Programming language
- **Material Design 3** - Modern UI components

### **Backend & Services**
- **Firebase Core** - Backend infrastructure
- **Firebase Auth** - User authentication
- **Google Generative AI** (Gemini 2.5 Flash) - AI chatbot functionality

### **State Management**
- **Provider** - State management solution
- **ChangeNotifier** - Reactive updates

### **UI Components**
- **Dash Chat 2** - Chat interface
- **Pie Chart** - Data visualization
- **Custom Widgets** - Reusable components

### **Utilities**
- **HTTP** - API requests
- **Shared Preferences** - Local data storage
- **Path Provider** - File system access
- **PDF** - Document generation
- **Share Plus** - Social sharing
- **URL Launcher** - External links

---

## 📂 Project Structure

```
lib/
├── config/               # Configuration files
│   └── api_keys.sample.dart
├── models/              # Data models
│   └── chat_message_model.dart
├── providers/           # State management
│   └── chat_provider.dart
├── screens/             # UI screens
│   ├── aboutus.dart
│   ├── admin_page.dart
│   ├── appfeature.dart
│   ├── appinfo.dart
│   ├── contact_support.dart
│   ├── faq_screen.dart
│   ├── finalpage.dart
│   ├── gptpage.dart     # AI Chatbot
│   ├── help_documentation.dart
│   ├── home.dart
│   ├── login.dart
│   ├── privacyP.dart
│   ├── quizscreen.dart
│   ├── rating_page.dart
│   ├── settings.dart
│   ├── signup.dart
│   ├── submitbutton.dart
│   ├── support_screen.dart
│   ├── team.dart
│   └── terms_of_service.dart
├── services/            # Business logic
│   ├── auth_service.dart
│   ├── chat_service.dart
│   ├── file_manager_service.dart
│   ├── pdf_report_service.dart
│   └── user_repository.dart
├── theme/               # App theming
│   ├── app_theme.dart
│   └── theme_controller.dart
├── utils/               # Utility functions
│   └── email_helper.dart
├── firebase_options.dart
└── main.dart            # Entry point
```

---

## 🚀 Getting Started

### Prerequisites

Before running the app, ensure you have the following installed:

- **Flutter SDK** (3.0 or higher) - [Install Flutter](https://docs.flutter.dev/get-started/install)
- **Dart SDK** (3.0 or higher) - Included with Flutter
- **Android Studio** or **VS Code** with Flutter extensions
- **Xcode** (for iOS development on macOS)
- **Firebase account** - [Firebase Console](https://console.firebase.google.com/)
- **Google AI Studio account** - [Get Gemini API Key](https://makersuite.google.com/app/apikey)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/career-guidance-app.git
   cd career-guidance-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure API Keys**
   
   Create `lib/config/api_keys.dart` from the sample:
   ```bash
   cp lib/config/api_keys.sample.dart lib/config/api_keys.dart
   ```
   
   Edit `lib/config/api_keys.dart` and add your Gemini API key:
   ```dart
   class ApiKeys {
     static const String geminiApiKey = 'YOUR_GEMINI_API_KEY_HERE';
   }
   ```
   
   Get your Gemini API key from: https://makersuite.google.com/app/apikey

4. **Configure Firebase**
   
   - Create a Firebase project in the [Firebase Console](https://console.firebase.google.com/)
   - Add your Android and/or iOS app to the Firebase project
   - Download and place configuration files:
     - **Android**: `google-services.json` → `android/app/`
     - **iOS**: `GoogleService-Info.plist` → `ios/Runner/`
   - Run FlutterFire configuration:
     ```bash
     flutterfire configure
     ```

5. **Run the app**
   ```bash
   # For development
   flutter run
   
   # For specific device
   flutter run -d <device_id>
   
   # Release build
   flutter run --release
   ```

---

## 🤖 AI Chatbot Integration

### Gemini 2.5 Flash Model

The app uses **Google's Gemini 2.5 Flash** model for AI-powered career guidance conversations.

**Configuration:**
```dart
GenerativeModel(
  model: 'gemini-2.5-flash',
  apiKey: ApiKeys.geminiApiKey,
  generationConfig: GenerationConfig(
    temperature: 0.7,
    topK: 40,
    topP: 0.95,
    maxOutputTokens: 2048,
  ),
)
```

**Features:**
- Context-aware conversations
- Career-specific knowledge
- Safety filters enabled
- Conversation history support (20 messages)
- Error handling and retry logic

**Logging:**
The chatbot includes comprehensive logging:
- `[ChatPage]` - UI interactions
- `[ChatService]` - Service layer operations
- `[API]` - API requests/responses
- `[Error]` - Error tracking

---

## 📝 Quiz Feature

The career assessment quiz helps users identify their:
- **Interests** - What they enjoy doing
- **Skills** - What they're good at
- **Personality** - Their work style preferences
- **Goals** - Career aspirations

**Features:**
- Multiple choice questions
- Category-based assessment
- Progress tracking
- Visual results with charts
- PDF report export
- Share results

---

## 🎨 Theme System

The app supports three theme modes:

1. **Light Mode** - Bright, clean interface
2. **Dark Mode** - Easy on the eyes
3. **System** - Follows device theme

**Color Palette:**
- Primary: Indigo (#6366F1)
- Secondary: Purple (#8B5CF6)
- Tertiary: Cyan (#06B6D4)

All themes follow Material Design 3 guidelines.

---

## 📊 Logging & Debugging

The app includes comprehensive logging for debugging:

```
[AppInit] Starting Career Guidance App...
[AppInit] Flutter bindings initialized
[AppInit] Initializing Firebase...
[AppInit] ✅ Firebase initialized successfully
[ChatPage] User message received: "Hello"
[ChatService] Sending message to Gemini API...
[ChatService] ✅ Response received from Gemini API
[Navigation] Navigating to QuizScreen
[Quiz] User selected answer index: 2
[Error] Network error: No internet connection
```

**Log Prefixes:**
- `[AppInit]` - Application initialization
- `[Auth]` - Authentication events
- `[Navigation]` - Screen navigation
- `[ChatPage]` - Chat UI events
- `[ChatService]` - Chat service operations
- `[API]` - API calls
- `[Quiz]` - Quiz interactions
- `[Settings]` - Settings changes
- `[Error]` - Error messages

---

## 🔐 Security & Privacy

- **API Keys**: Never committed to repository (in `.gitignore`)
- **Firebase Auth**: Secure user authentication
- **Data Privacy**: User data stored securely in Firebase
- **HTTPS**: All API communications encrypted
- **Safety Filters**: AI responses filtered for inappropriate content

---

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 👨‍💻 Development Team

**INNOVATE SPHERE VENTURE BY BRANDKART**

- **Tanishka Pramod Rakte** - Backend Development, ML Algorithms
- **Prathamesh Dnyaneshwar Pawar** - Full-stack Development
- **Kunal Vitthal Shinde** - Database & Web Technologies

**Contact:** pruthvirajpawr12.pdp@gmail.com

---

## 📄 License

This project is developed by INNOVATE SPHERE VENTURE. All rights reserved.

---

## 📞 Support

For support, email us at:
- **Email**: pruthvirajpawr12.pdp@gmail.com
- **Package**: com.innovatesphere.careerguidance

---

## 🙏 Acknowledgments

- [Flutter Team](https://flutter.dev) for the amazing framework
- [Google AI](https://ai.google.dev) for Gemini AI technology
- [Firebase](https://firebase.google.com) for backend infrastructure
- Material Design 3 for design guidelines

---

## 📚 Useful Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Gemini API Documentation](https://ai.google.dev/docs)
- [Firebase Documentation](https://firebase.google.com/docs)
- [Material Design 3](https://m3.material.io/)

---

**Made with ❤️ by the INNOVATE SPHERE Team**

*Last Updated: March 2026*
