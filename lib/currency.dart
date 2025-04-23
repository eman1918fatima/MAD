import 'package:flutter/material.dart';

class CurrencyPoundConverter extends StatefulWidget {
  const CurrencyPoundConverter({super.key});

  @override
  State<CurrencyPoundConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyPoundConverter> {
  final TextEditingController _controller = TextEditingController();
  double _convertedAmount = 0.0;
  static const double exchangeRate = 345.0;

  void _convertCurrency() {
    double pounds = double.tryParse(_controller.text) ?? 0.0;
    setState(() {
      _convertedAmount = pounds * exchangeRate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text("Currency Converter"),
        backgroundColor: Colors.blue[700],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue[100],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Center(
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.blue[800],
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      hintText: 'Enter amount in Pound',
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
                    "Equivalent in PKR: $_convertedAmount",
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: SizedBox(
          width: double.infinity, // Full width
          child: ElevatedButton(
            onPressed: _convertCurrency,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20), // Button height
              backgroundColor: Colors.blue[700], // Button color
              foregroundColor: Colors.white, // Text color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            child: const Text('Convert', style: TextStyle(fontSize: 18)),
          ),
        ),
      ),
    );
  }
}