import 'package:flutter/material.dart';
import 'package:projekt_lab_mobilne/screens/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(padding: const EdgeInsets.symmetric(horizontal: sidePadding),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.chevron_left, color: titleColor),
                    Text('Back', style: TextStyle(fontSize: textFontSize, color: titleColor)),
                  ],),),
              const SizedBox(height: 40),
              const Text('Sign Up', style: TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.bold, color: titleColor)),
            ],),),),);
  }
}