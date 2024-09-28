import 'package:date_app/screens/friendzy/frendzy.dart';
import 'package:date_app/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => const WelcomeScreen(),
                  ),
                );
              },
              child: const Text(
                'Go to welcome',
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => const Frendzy(),
                  ),
                );
              },
              child: const Text('Go to main'),
            ),
          ],
        ),
      ),
    );
  }
}
