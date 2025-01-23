import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase core
import 'firebase_options.dart'; // Import your Firebase config
import 'pages/login_page.dart'; // Import your login page

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Firebase is initialized before the app runs
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Initialize Firebase using the platform-specific options
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoginPage(), // This points to your login page
    );
  }
}
