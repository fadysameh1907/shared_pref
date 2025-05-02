import 'package:flutter/material.dart';
import 'package:shared_pref_cai/home_screen.dart';

void main() {
  runApp(const SharedPrefApp());
}

class SharedPrefApp extends StatelessWidget {
  const SharedPrefApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
