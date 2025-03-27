import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nightlyfe/services/avatar_custom.dart';
import 'package:nightlyfe/sign-in.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get user => _auth.currentUser;
  bool _passwordVisible = false;

  // Logout function
  void _signOut() async {
    await _auth.signOut();
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings / Account',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, fontFamily: 'BebasNeue'),
        ),
        backgroundColor: const Color(0xFF4a0404),
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFF292929)),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Account',
              style: TextStyle(fontSize: 30, color: Colors.white, fontFamily: 'PressStart2P'),
            ),
            const SizedBox(height: 20),
            AvatarCustom(),
            const SizedBox(height: 20),
            Container(
              height: 1.5,
              color: Colors.deepOrange,
            ),
            Theme(
              data: ThemeData(
                expansionTileTheme: ExpansionTileThemeData(
                  iconColor: Colors.deepOrange,
                ),
              ),
              child: ExpansionTile(
                title: const Text(
                  'Personal details',
                  style: TextStyle(fontSize: 15, color: Colors.white, fontFamily: 'PressStart2P'),
                ),
                children: [
                  Row(
                    children: [
                      const Text(
                        'Email:',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        user?.email ?? 'No email',
                        style: const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        'Joined in:',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        user?.metadata.creationTime?.toString() ?? 'Unknown',
                        style: const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        'Password:',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      Stack(
                        children: [
                          Text(
                            _passwordVisible ? '●●●●●●●●●●' : '●●●●●●●●●●',
                            style: const TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Positioned(
                            right: 0,
                            child: IconButton(
                              icon: _passwordVisible ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const Spacer(), //LOGOUT BUTTON AT THE BOTTOM
            Center(
              child: ElevatedButton(
                onPressed: _signOut,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Log Out',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
