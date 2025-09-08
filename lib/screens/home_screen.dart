import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CS 1.6 Pro Guide'),
        backgroundColor: const Color(0xFF2C3E50),
      ),
      body: const Center(
        child: Text(
          'Asosiy sahifa\n(Keyingi bosqichda to\'ldiramiz)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
