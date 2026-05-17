import 'package:app_social_login/pages/splash_screen.page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social login with notigication',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(primary: Color(0xFFf9f4ec)),
        scaffoldBackgroundColor: const Color(0xFFf9f4ec),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.green),
      ),
      home: const SplashScreenPage(),
    );
  }
}
