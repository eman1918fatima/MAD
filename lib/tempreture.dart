import 'package:flutter/material.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key});

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  final TextEditingController _controller = TextEditingController();
  double _convertedTemp = 0.0;

  void _convertTemp() {
    double celsius = double.tryParse(_controller.text) ?? 0.0;
    setState(() {
      _convertedTemp = (celsius * 9 / 5) + 32;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text("Temperature Converter"),
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
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.blue[800],
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      hintText: 'Enter temperature in ºC',
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
                    "Equivalent in Fahrenheit: $_convertedTemp",
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
          onPressed: _convertTemp,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 20),
            backgroundColor: Colors.blue[700],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          child: const Text('Convert', style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}