import 'package:flutter/material.dart';

class ConsoleCodesScreen extends StatelessWidget {
  const ConsoleCodesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Console Codes'),
        backgroundColor: const Color(0xFF2C3E50),
      ),
      body: const Center(
        child: Text(
          'Console Codes bo\'limi\n(Keyingi bosqichda to\'ldiramiz)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}