import 'package:flutter/material.dart';
import 'package:food_funda_business/components/login_signup/screens/login_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   backgroundColor: const Color(0xFF6200EE),
      //   title: const Text('Flutter Demo Home Page'),
      // ),
      body:  SafeArea(child: LoginPage()),
    );
  }
}