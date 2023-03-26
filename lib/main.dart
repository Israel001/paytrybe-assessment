import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paytrybe/screens/get_started.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paytrybe',
      home: AnimatedSplashScreen(
        duration: 1000,
        splash: Image.asset("assets/Logo.png"),
        nextScreen: GetStarted(key: key),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: const Color.fromRGBO(247, 249, 253, 1),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
