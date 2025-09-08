import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';
import 'language_selection_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // CS 1.6 Logo
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xFFFF6B35),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFF6B35).withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: const Icon(
              Icons.sports_esports,
              size: 60,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),

          // Ilova nomi
          const Text(
            'CS 1.6',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF6B35),
              letterSpacing: 2,
            ),
          ),
          const Text(
            'PRO GUIDE',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
              letterSpacing: 3,
            ),
          ),

          const SizedBox(height: 40),

          // Loading indicator
          const SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF6B35)),
              strokeWidth: 3,
            ),
          ),
        ],
      ),
      nextScreen: FutureBuilder<bool>(
        future: _checkFirstTime(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == true) {
              return const LanguageSelectionScreen();
            } else {
              return const HomeScreen();
            }
          } else {
            // Show a placeholder while waiting
            return const SizedBox.shrink();
          }
        },
      ),
      splashIconSize: 300,
      backgroundColor: const Color(0xFF1A1A1A),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      duration: 3000, // 3 soniya
    );
  }

  Future<bool> _checkFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return !(prefs.getBool('language_selected') ?? false);
  }
}
