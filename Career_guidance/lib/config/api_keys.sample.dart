/// Sample configuration file - Template for API keys
///
/// **SETUP INSTRUCTIONS:**
/// 1. Copy this file to `api_keys.dart` in the same directory
/// 2. Replace all placeholder values with your actual API keys
/// 3. NEVER commit `api_keys.dart` to version control (already in .gitignore)
///
/// **SECURITY NOTICE:**
/// - Client-side API keys in Flutter apps can be extracted by determined attackers
/// - Treat these as *public identifiers*, not secrets
/// - For sensitive operations, use a backend API with proper authentication
/// - Enable API key restrictions (domain, IP, usage limits) in your provider's console
///
/// **FIREBASE CONFIGURATION:**
/// - Firebase config is managed separately in `lib/firebase_options.dart`
/// - Generated automatically by FlutterFire CLI
/// - Do NOT duplicate Firebase keys here
///
class ApiKeys {
  // Prevent instantiation
  ApiKeys._();

  // ============================================================
  // OpenAI Configuration
  // ============================================================
  /// Your OpenAI API key
  /// Get it from: https://platform.openai.com/api-keys
  static const String openAiApiKey = 'sk-proj-XXXXXXXXXXXXXXXXXXXXXXXX';
  
  /// OpenAI API base URL
  static const String openAiBaseUrl = 'https://api.openai.com/v1';

  // ============================================================
  // Add Other API Keys Below
  // ============================================================
  
  // Example: Google Maps
  // /// Google Maps API key for Android
  // /// Get it from: https://console.cloud.google.com/apis/credentials
  // static const String googleMapsApiKeyAndroid = 'AIzaSyXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
  
  // Example: Stripe
  // /// Stripe publishable key (safe to expose in client)
  // /// Get it from: https://dashboard.stripe.com/apikeys
  // static const String stripePublishableKey = 'pk_test_XXXXXXXXXXXXXXXX';
}
