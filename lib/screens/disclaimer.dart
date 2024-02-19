import 'package:flutter/material.dart';
import '/screens/home_screen.dart'; // Import your HomeScreen file

class Disclaimer extends StatefulWidget {
  const Disclaimer({Key? key}) : super(key: key);

  @override
  _DisclaimerState createState() => _DisclaimerState();
}

class _DisclaimerState extends State<Disclaimer> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    double scwidth = MediaQuery.of(context).size.width;
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
              -13.63 * 3.14 / 180, // Convert degrees to radians
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child:
                  Image.asset('assets/images/bhai.png', width: scwidth * 0.3),
            ),
            Text('I need a few permissions',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            SizedBox(height: 50),
            Image.asset('assets/images/disc.png', width: scwidth * 0.8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                  activeColor: Colors.blueAccent, // Neon blue color
                ),
                SizedBox(
                  height: 80,
                ),
                Text(
                  'I agree to the above',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: _isChecked
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    }
                  : null,
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
