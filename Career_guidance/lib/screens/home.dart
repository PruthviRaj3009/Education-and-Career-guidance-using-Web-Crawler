import 'package:flutter/material.dart';
import 'package:careerguidance/screens/aboutus.dart';
import 'package:careerguidance/screens/privacyP.dart';
import 'package:careerguidance/screens/rating_page.dart';
import 'package:careerguidance/screens/support_screen.dart';
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

                          setState(() {
                            isDeleting = true;
                          });

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
                            if (mounted) {
                              setState(() {
                                isDeleting = false;
                              });
                            }
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SupportScreen()),
                    );
                  }),
              _createDrawerItem(
                  icon: Icons.support,
                  text: 'Team Members',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TeamScreen()),
                    );
                  }),
              _createDrawerItem(
                icon: Icons.privacy_tip,
                text: 'Privacy Policy',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CopyrightNoticePage()),
                ),
              ),
              _createDrawerItem(
                icon: Icons.explicit_rounded,
                text: 'About Us',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsScreen()),
                ),
              ),
              _createDrawerItem(
                icon: Icons.sentiment_satisfied,
                text: 'Rate Us',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RateScreen()),
                ),
              ),
              _createDrawerItem(
                icon: Icons.feedback,
                text: 'Feedback',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RateScreen()),
                ),
              ),
              _createDrawerItem(
                icon: Icons.settings,
                text: 'Settings',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()),
                ),
              ),
              //_createDrawerItem(
              // icon: Icons.share,
              //text: 'Share',
              // onTap: () => Navigator.pop(context)),
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
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                  Image.asset(
                    "assets/home.jpg",
                    height: 300,
                    width: 400,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.purple, Colors.blue],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      height: 350,
                      width: double.infinity,
                      child: Column(children: [
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AppInfoScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              shadowColor: Colors.black.withOpacity(0.2),
                              backgroundColor: Colors.white,
                            ),
                            child: Column(children: [
                              Image.asset(
                                "assets/info.jpg",
                                height: 50.0,
                                width: 50.0,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "App Info",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ])),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AppFeaturesScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            shadowColor: Colors.black.withOpacity(0.2),
                            backgroundColor: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/features.jpg",
                                height: 50.0,
                                width: 50.0,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "App Features",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const QuizScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            shadowColor: Colors.black.withOpacity(0.2),
                            backgroundColor: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/quiz.jpg",
                                height: 50.0,
                                width: 50.0,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "Start Quiz",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]))
                ]))));
  }

  ListTile _createDrawerItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }
}
