import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task2/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    const loadingDuration = Duration(seconds: 3);
    const updateInterval = Duration(milliseconds: 50);

    Timer.periodic(updateInterval, (Timer timer) {
      setState(() {
        _progress += updateInterval.inMilliseconds / loadingDuration.inMilliseconds;
        if (_progress >= 1.0) {
          timer.cancel();
          _navigateToHome();
        }
      });
    });
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => MyHomePage(title: "Calculator"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo.png', // Replace with your splash screen image
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            const Text(
              "Welcome to Calculator",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: LinearProgressIndicator(
          value: _progress,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          backgroundColor: Colors.blue[100],
          minHeight: 10,
        ),
      ),
    );
  }
}