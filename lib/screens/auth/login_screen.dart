import 'package:emosense/widgets/google_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';
import 'login_email_screen.dart';
import 'firebase_auth_methods.dart';
import '/widgets/auth_icon_button.dart';
import '/widgets/or_divider_widget.dart';
import 'package:flutter/gestures.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void onGoogleSignIn() async {
    context.read<FirebaseAuthMethods>().signInWithGoogle(context);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF2C3836),
              Color(0xFF000000),
            ],
            stops: [0.1, 0.9],
            transform: GradientRotation(
                -13.63 * 3.14 / 180), // Convert degrees to radians
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              SvgPicture.asset(
                'assets/images/bhai.svg',
                width: screenWidth * 0.1,
                height: screenHeight * 0.1,
              ),
              const SizedBox(height: 100),
              AuthIconButton(
                  labelText: 'Sign in with Google',
                  isSvg: false,
                  icon: Icons.g_mobiledata,
                  onPress: onGoogleSignIn),
              const SizedBox(height: 15),
              const OrDivider(),
              AuthIconButton(
                labelText: 'Sign in with Email',
                isSvg: false,
                icon: Icons.email,
                onPress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const EmailPasswordLogin();
                    },
                  ));
                },
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: "Sign up now",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 25, 168, 184),
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return EmailPasswordSignup();
                            },
                          ));
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
