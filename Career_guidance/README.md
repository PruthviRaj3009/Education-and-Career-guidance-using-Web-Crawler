# Career Guidance App

<<<<<<< HEAD
# Career Guidance App

=======
>>>>>>> e7a77c9 (adding ESP32 live streaming)
A Flutter-based mobile application designed to help users discover their career interests through interactive quizzes, receive personalized career recommendations, and engage with an AI-powered chatbot for guidance.

## Features

- **Firebase Authentication**: Secure login, signup, and logout functionality
- **Interactive Quiz**: Career interest assessment with multiple-choice questions
- **Results Visualization**: Pie chart display of career interests
- **Career Recommendations**: Detailed career suggestions based on quiz results
- **ChatGPT Chatbot**: AI-powered conversation for career advice (optional feature)
- **Dark Mode Support**: Toggle between light and dark themes
- **PDF Report Download**: Generate and download career assessment reports

## Tech Stack

- **Flutter**: Cross-platform mobile development framework
- **Firebase**: Backend services for authentication
- **Dart**: Programming language

### Key Packages Used

- `firebase_auth`: Handles user authentication with Firebase
- `firebase_core`: Core Firebase functionality
- `chat_gpt_sdk`: Integration with OpenAI's ChatGPT API
- `dash_chat_2`: Modern chat UI components
- `pie_chart`: Interactive pie chart visualization
- `pdf`: PDF document generation
- `path_provider`: Access to device file system paths
- `share_plus`: Share files and content
- `provider`: State management solution
- `shared_preferences`: Local data persistence
- `http`: HTTP client for API calls

## Dependencies

The project uses the following main dependencies (automatically installed via `flutter pub get`):

- `firebase_auth: ^6.1.4` - Firebase authentication
- `firebase_core: ^4.4.0` - Firebase core services
- `chat_gpt_sdk: ^3.0.7` - ChatGPT API integration
- `dash_chat_2: ^0.0.20` - Chat interface
- `pie_chart: ^5.0.0` - Pie chart visualization
- `pdf: ^3.11.0` - PDF generation
- `provider: ^6.1.2` - State management
- `shared_preferences: ^2.2.3` - Local storage

## Setup Instructions

### Prerequisites

- Flutter SDK (version 3.3.4 or higher)
- Dart SDK (included with Flutter)
- Android Studio or VS Code with Flutter extensions
- Firebase account and project

### Installation Steps

1. **Clone the repository**

   ```bash
   git clone https://github.com/your-username/career-guidance-app.git
   cd career-guidance-app
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Firebase Setup**
   - Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Enable Authentication service
   - For Android: Download `google-services.json` and place it in `android/app/`
   - For iOS: Configure iOS app and download `GoogleService-Info.plist` to `ios/Runner/`

4. **Configure Firebase**
   - Follow Firebase documentation to set up authentication methods (Email/Password)
   - Update Firebase security rules as needed

5. **Run the app**
   ```bash
   flutter run
   ```

### For ChatGPT Integration (Optional)

- Obtain an OpenAI API key
- Configure the API key in your app's environment variables or secure storage
- Ensure `chat_gpt_sdk` is properly configured in the code

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── screens/                  # UI screens
│   ├── home.dart            # Home screen
│   ├── quiz.dart            # Quiz screen
│   ├── results.dart         # Results with pie chart
│   ├── recommendations.dart # Career recommendations
│   ├── chat.dart            # ChatGPT chatbot
│   └── ...
├── services/                 # Business logic and API calls
├── theme/                    # App theming
└── utils/                    # Utility functions

android/                      # Android platform code
ios/                          # iOS platform code
assets/                       # Images and static files
```

## Screenshots

### Home Screen
<<<<<<< HEAD
![WhatsApp Image 2026-01-21 at 00 09 38 (2)](https://github.com/user-attachments/assets/1c0a21fd-e1f4-40f7-a7ff-2c3857959515)


### Quiz Interface

![WhatsApp Image 2026-01-21 at 00 09 38 (1)](https://github.com/user-attachments/assets/cb479b2b-ac6c-469b-97ef-483916ae7459)


### Results with Pie Chart



### Career Recommendations


### ChatGPT Chatbot

![WhatsApp Image 2026-01-21 at 00 09 37](https://github.com/user-attachments/assets/9618b6d4-d4ab-4662-90d1-12342e13d9ab)
=======

![Home Screen](screenshots/home.png)

### Quiz Interface

![Quiz Screen](screenshots/quiz.png)

### Results with Pie Chart

![Results Screen](screenshots/results.png)

### Career Recommendations

![Recommendations Screen](screenshots/recommendations.png)

### ChatGPT Chatbot

![Chat Screen](screenshots/chat.png)
>>>>>>> e7a77c9 (adding ESP32 live streaming)

_Note: Add actual screenshots to a `screenshots/` folder in your repository_

## Common Issues and Fixes

### Build Issues

**Minimum SDK Version Error**

```
Error: The minimum SDK version is 21, but the current version is 19
```

- Update `android/app/build.gradle`:
  ```gradle
  defaultConfig {
      minSdkVersion 21
  }
  ```

**Kotlin Version Compatibility**

- Update `android/build.gradle`:
  ```gradle
  ext.kotlin_version = '1.9.0'
  ```

**Gradle Clean**

```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
```

### Firebase Issues

**google-services.json not found**

- Ensure the file is placed in `android/app/` directory
- Check Firebase project configuration matches your app

**Authentication not working**

- Verify Firebase Authentication is enabled in console
- Check API keys and configuration

### ChatGPT Integration Issues

**API Key Error**

- Ensure OpenAI API key is properly configured
- Check API rate limits and billing

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Development Guidelines

- Follow Flutter best practices
- Write clear, concise commit messages
<<<<<<< HEAD
- Test on  Android device
=======
- Test on both Android and iOS devices
>>>>>>> e7a77c9 (adding ESP32 live streaming)
- Update documentation for new features

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Note**: This app is for educational and guidance purposes only. Always consult with career counselors or professionals for personalized advice.
<<<<<<< HEAD

=======
>>>>>>> e7a77c9 (adding ESP32 live streaming)
