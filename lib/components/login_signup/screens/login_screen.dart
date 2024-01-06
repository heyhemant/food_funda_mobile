import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Container(
            color: Colors.white,
            child:const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("What's your phone number?", style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF171A1F),
                  fontFamily: 'Lexend',
                ),)
              ],
            )
            );
      }
    );
  }
}
