import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:emosense/screens/auth/login_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height: screenHeight * 0.1),
                Image.asset(
                  'assets/images/bhai.png',
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.5,
                ),

                //get started button :
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Image.asset(
                    'assets/images/get_started.png',
                    width: screenWidth * 0.7,
                    height: screenHeight * 0.7,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
