import 'package:flutter/material.dart';
import 'package:week3/screens/age.dart';
import 'package:week3/screens/area.dart';
import 'package:week3/screens/BMI.dart';
import 'package:week3/screens/currency.dart';

import 'package:week3/screens/friendship.dart';
import 'package:week3/screens/length.dart';
import 'package:week3/screens/splash.dart';
import 'package:week3/screens/temperature.dart';

import 'package:week3/screens/time.dart';
import 'package:week3/screens/time1.dart';
import 'package:week3/screens/volume.dart';
import 'package:week3/screens/weight.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> categories = [
    {"name": "Friendship", "img": "images/friendship.png", "route": const FriendshipCalculator()},
    {"name": "Currency USD", "img": "images/currency.png", "route": const CurrencyConverter()},
    {"name": "Temperature", "img": "images/temperature.png", "route": const Temperature()},
    {"name": "BMI", "img": "images/bmi.png", "route": const BMIScreen()},
    {"name": "Length", "img": "images/length.png", "route": const Length()},
    {"name": "Temperature Kelvin", "img": "images/temperature.png", "route": const TemperatureKelvin()},
    {"name": "Area", "img": "images/area.png", "route": const AreaConverter()},
    {"name": "Volume", "img": "images/volume.png", "route": const VolumeConverter()},
    {"name": "Weight", "img": "images/weight.png", "route": const WeightConverter()},
    {"name": "Time Belgium", "img": "images/time.png", "route": const TimeBelgiumConverter()},
    {"name": "Age", "img": "images/age.png", "route": const AgeCalculator()},
    {"name": "Currency Pound", "img": "images/currency.png", "route": const CurrencyPoundConverter()},
    {"name": "Time", "img": "images/time.png", "route": const TimeConverter()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[50],
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu, color: Colors.blue[400]),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to",
              style: TextStyle(color: Colors.blue[600], fontSize: 16),
            ),
            Text(
              "Multi Calculator",
              style: TextStyle(color: Colors.blue[700], fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 80),
            Text(
              "Category",
              style: TextStyle(fontSize: 18, color: Colors.blue[600]),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.9,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => categories[index]["route"]),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            categories[index]["img"],
                            width: 50,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            categories[index]["name"],
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}