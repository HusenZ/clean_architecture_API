import 'package:chat_bot/presentation/chat_home_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp._interanl();

  static MyApp instance = const MyApp._interanl();

  @override
  State<MyApp> createState() => _MyAppState();

  factory MyApp() => instance;
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData.dark(),
    );
  }
}
