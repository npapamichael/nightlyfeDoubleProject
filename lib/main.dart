import 'package:firebase_core/firebase_core.dart';
import 'services/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'services/auth_service.dart';
import 'sign-in.dart';
import 'home_page.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:get/get.dart';
import 'assets/functionals/keys.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:nightlyfe/services/point_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = PublishKey;
  await Stripe.instance.applySettings();
  await PointsHandler.init();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Error initializing Firebase app: $e');
  }
  Get.put(FluttermojiController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthChecker(),
    );
  }
}

class AuthChecker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasData) {
          return const HomePage(); //IF LOGGED IN REDIRECT TO HOMEPAGE
        } else {
          return const SignInPage(); //ELSE SIGN IN
        }
      },
    );
  }
}