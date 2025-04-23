import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeBelgiumConverter extends StatefulWidget {
  const TimeBelgiumConverter({super.key});

  @override
  State<TimeBelgiumConverter> createState() => _TimeBelgiumState();
}

class _TimeBelgiumState extends State<TimeBelgiumConverter> {
  final TextEditingController _timeController = TextEditingController();
  String _convertedTime = "Pakistan Time: ";

  void _convertTime() {
    try {
      DateFormat format = DateFormat("HH:mm");
      DateTime belgiumTime = format.parse(_timeController.text);

      DateTime pakistanTime = belgiumTime.add(const Duration(hours: 4));

      setState(() {
        _convertedTime = "Pakistan Time: ${format.format(pakistanTime)}";
      });
    } catch (e) {
      setState(() {
        _convertedTime = "Invalid time format!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text("Time Converter"),
        backgroundColor: Colors.blue[700],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue[100],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Center(
                  child: TextField(
                    controller: _timeController,
                    keyboardType: TextInputType.datetime,
                    cursorColor: Colors.blue[800],
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      hintText: 'Enter Belgium Time (HH:mm)',
                      hintStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue[200],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Center(
                  child: Text(
                    _convertedTime,
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
            backgroundColor: Colors.blue[700],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          child: const Text('Convert Time', style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}