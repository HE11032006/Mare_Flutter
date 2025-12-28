import 'package:flutter/material.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MareApp());
}

class MareApp extends StatelessWidget {
  const MareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

child: MaterialApp(
title: 'Mare',
debugShowCheckedModeBanner: false,
theme: AppTheme.lightTheme,
home: showOnboarding ? const OnboardingScreen() : const HomeScreen(),
),



