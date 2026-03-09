import 'package:flutter/material.dart';
import 'package:careerguidance/screens/aboutus.dart';
import 'package:careerguidance/screens/privacyP.dart';
import 'package:careerguidance/screens/rating_page.dart';
import 'package:careerguidance/screens/support_screen.dart';
import 'package:careerguidance/screens/admin_page.dart';
import 'quizscreen.dart';
import 'team.dart';
import 'appfeature.dart';
import 'appinfo.dart';
import 'login.dart';
import 'settings.dart';
import '../services/auth_service.dart';
import '../services/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _authService = const AuthService();
  final UserRepository _userRepository = const UserRepository();

  Future<void> _showDeleteAccountDialog() async {
    final passwordController = TextEditingController();
    bool isDeleting = false;

    await showDialog<void>(
      context: context,
      barrierDismissible: !isDeleting,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Delete Account?'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'This action is permanent. Your account will be removed.',
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Confirm password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed:
                      isDeleting ? null : () => Navigator.pop(dialogContext),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: isDeleting
                      ? null
                      : () async {
                          final password = passwordController.text.trim();
                          if (password.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please enter your password.')),
                            );
                            return;
                          }
                          setState(() => isDeleting = true);
                          try {
                            final user = _authService.currentUser;
                            if (user == null || user.email == null) {
                              throw FirebaseAuthException(
                                code: 'user-not-found',
                                message: 'No signed in user.',
                              );
                            }
                            await _authService.reauthenticateWithPassword(
                              email: user.email!,
                              password: password,
                            );
                            await _userRepository.deleteUserData(user.uid);
                            await _authService.deleteCurrentUser();
                            await _authService.signOut();
                            if (!mounted) return;
                            Navigator.pop(dialogContext);
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()),
                              (_) => false,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Account deleted successfully')),
                            );
                          } on FirebaseAuthException catch (e) {
                            final message = switch (e.code) {
                              'wrong-password' => 'Incorrect password.',
                              'requires-recent-login' =>
                                'Please log in again and retry.',
                              'network-request-failed' =>
                                'Network error. Please try again.',
                              _ => e.message ?? 'Unable to delete account.',
                            };
                            if (!mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(message)),
                            );
                          } catch (_) {
                            if (!mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Unable to delete account.')),
                            );
                          } finally {
                            if (mounted) setState(() => isDeleting = false);
                          }
                        },
                  child: isDeleting
                      ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Delete'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Career"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage("assets/profile.jpg"),
              ),
              accountEmail: Text(
                _authService.currentUser?.email ?? 'No email',
                style: const TextStyle(fontSize: 16.0),
              ),
              accountName: const Text(
                'Account',
                style: TextStyle(fontSize: 24.0),
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.blue],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
            _createDrawerItem(
                icon: Icons.home,
                text: 'Supporters',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SupportScreen()))),
            _createDrawerItem(
                icon: Icons.support,
                text: 'Team Members',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TeamScreen()))),
            _createDrawerItem(
              icon: Icons.privacy_tip,
              text: 'Privacy Policy',
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyScreen())),
            ),
            _createDrawerItem(
              icon: Icons.info_outline,
              text: 'About Us',
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutUsScreen())),
            ),
            _createDrawerItem(
              icon: Icons.feedback,
              text: 'Feedback',
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RateScreen())),
            ),
            _createDrawerItem(
              icon: Icons.settings,
              text: 'Settings',
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen())),
            ),
            _createDrawerItem(
                icon: Icons.delete,
                text: 'Delete Account',
                onTap: () {
                  Navigator.pop(context);
                  _showDeleteAccountDialog();
                }),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                await _authService.signOut();
                if (!mounted) return;
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                  (_) => false,
                );
              },
            ),
          ],
        ),
      ),

      // ── BODY ──────────────────────────────────────────────────────────────
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Banner Image ──
            Image.asset(
              "assets/home.jpg",
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            // ── Gradient Container — rounded on ALL 4 corners ──
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.purple, Colors.blue],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
                // ✅ Rounded on ALL sides — top and bottom
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ── Title ──
                  const Text(
                    "Explore Your Career",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ── App Info  +  App Features (side by side) ──
                  Row(
                    children: [
                      Expanded(
                        child: _menuButton(
                          assetImage: "assets/info.jpg",
                          label: "App Info",
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AdminPage()),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _menuButton(
                          assetImage: "assets/features.jpg",
                          label: "App Features",
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AppFeaturesScreen()),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // ── Start Quiz (full width) ──
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QuizScreen()),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 4,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/quiz.jpg",
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            "Start Quiz",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Reusable square menu button for the 2-column grid.
  Widget _menuButton({
    required String assetImage,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 4,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(assetImage, height: 52, width: 52),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  ListTile _createDrawerItem({
    required IconData icon,
    required String text,
    required GestureTapCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }
}
