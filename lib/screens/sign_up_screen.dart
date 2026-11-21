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
  final usernameController = TextEditingController();
  final emailController = TextEditingController();

  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius),
    borderSide: const BorderSide(color: borderColor, width: borderWidth),
  );

  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  bool hidePassword = true;
  bool hideConfirm = true;

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

              const SizedBox(height: titleToField),
              SizedBox(
                height: fieldHeight,
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: const TextStyle(color: hintColor),
                    prefixIcon: const Icon(Icons.person_outline),
                    prefixIconColor: titleColor,
                    contentPadding: EdgeInsets.zero,
                    enabledBorder: border,
                    focusedBorder: border,),),),

              const SizedBox(height: fieldToField),
              SizedBox(
                height: fieldHeight,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: const TextStyle(color: hintColor),
                    prefixIcon: const Icon(Icons.mail_outline),
                    prefixIconColor: titleColor,
                    contentPadding: EdgeInsets.zero,
                    enabledBorder: border,
                    focusedBorder: border,),),),

              const SizedBox(height: fieldToField),
              SizedBox(
                height: fieldHeight,
                child: TextField(
                  controller: passwordController,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: hintColor),
                    prefixIcon: const Icon(Icons.lock_outline),
                    prefixIconColor: titleColor,

                    suffixIcon: IconButton(
                      icon: Icon(hidePassword ? Icons.visibility_off : Icons.visibility, color: titleColor),
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                        },),
                    contentPadding: EdgeInsets.zero,
                    enabledBorder: border,
                    focusedBorder: border,),),),

              const SizedBox(height: fieldToField),
              SizedBox(
                height: fieldHeight,
                child: TextField(
                  controller: confirmController,
                  obscureText: hideConfirm,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    hintStyle: const TextStyle(color: hintColor),
                    prefixIcon: const Icon(Icons.lock_outline),
                    prefixIconColor: titleColor,
                    suffixIcon: IconButton(
                      icon: Icon(hideConfirm ? Icons.visibility_off : Icons.visibility, color: titleColor),
                      onPressed: () {
                        setState(() {
                          hideConfirm = !hideConfirm;
                        });
                      },),
                    contentPadding: EdgeInsets.zero,
                    enabledBorder: border,
                    focusedBorder: border,),),),

              const SizedBox(height: forgotToButton),
              SizedBox(
                width: double.infinity,
                height: buttonHeight,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: buttonColor, foregroundColor: Colors.white, elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),),
                  child: const Text('Sign Up', style: TextStyle(fontSize: textFontSize, fontWeight: FontWeight.bold)),),),

              const SizedBox(height: 120),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Already have an account ? ', style: TextStyle(fontSize: textFontSize, color: titleColor)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Sign In', style: TextStyle(fontSize: textFontSize, fontWeight: FontWeight.bold, color: titleColor)),),
                  ],),),

              const SizedBox(height: 24),
            ],),),),);
  }
}