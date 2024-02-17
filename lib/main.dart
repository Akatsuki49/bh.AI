import 'package:emosense/firebase_options.dart';
import 'package:emosense/screens/auth/firebase_auth_methods.dart';
import 'package:emosense/screens/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
import 'package:emosense/screens/home_screen.dart'; // Import the home screen
import 'package:emosense/screens/auth/login_screen.dart'; // Import the login screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        // Other providers if any
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'EmoSense',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasData && snapshot.data != null) {
              return HomeScreen(); // If user is logged in, show home screen
            } else {
              return LandingPage(); // If user is not logged in, show login screen
            }
          },
        ),
      ),
    );
  }
}
