import 'package:flutter/material.dart';

class TimeConverter extends StatefulWidget {
  const TimeConverter({super.key});

  @override
  State<TimeConverter> createState() => _TimeState();
}

class _TimeState extends State<TimeConverter> {
  final TextEditingController _controller = TextEditingController();
  double _convertedTime = 0.0;

  void _convertTime() {
    double hours = double.tryParse(_controller.text) ?? 0.0;
    setState(() {
      _convertedTime = hours * 60;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.yellowAccent[100],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Center(
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      hintText: 'Enter hours',
                      hintStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.yellowAccent[400],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Center(
                  child: Text(
                    "Equivalent in minutes: $_convertedTime",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: _convertTime,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 20),
            backgroundColor: Colors.yellowAccent[700],
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          child: const Text(
            'Convert',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      ),
    );
  }
}