import 'package:flutter/material.dart';
import 'package:projekt_lab_mobilne/screens/sign_up_screen.dart';
import 'package:projekt_lab_mobilne/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

const Color titleColor = Color(0xFF471AA0);
const Color borderColor = Color(0xFF9747FF);
const Color buttonColor = Color(0xFFBB84E8);
const Color hintColor = Color(0x4D00000D);

const double sidePadding = 21;
const double fieldHeight = 50;
const double buttonHeight = 50;
const double borderRadius = 16;
const double borderWidth = 2;
const double logoSize = 129;

const double titleFontSize = 30;
const double textFontSize = 15;

const double topSpace = 62;
const double logoToTitle = 21;
const double titleToField = 46;
const double fieldToField = 30;
const double fieldToForgot = 40;
const double forgotToButton = 40;
const double socialSpace = 75;

//testowe dane
const String correctEmail = 'test@test.pl';
const String correctPassword = '12345678';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() {
    return _SignInScreenState();
  }
}


class _SignInScreenState extends State<SignInScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePassword = true;

  String? emailError;
  String? passwordError;

  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius),
    borderSide: const BorderSide(color: borderColor, width: borderWidth,),);


  Future<void> signIn() async {
    setState(() {
      if (emailController.text == correctEmail) {
        emailError = null;
      } else {
        emailError = 'Invalid email';
      }

      if (passwordController.text == correctPassword) {
        passwordError = null;
      } else {
        passwordError = 'Invalid password';
      }
    });

    if (emailError == null && passwordError == null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      if (!mounted) return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()),);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: sidePadding),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: topSpace), Center(child: Image.asset('assets/logo.png', width: logoSize,),),

              const SizedBox(height: logoToTitle),

              const Text('Sign in', style: TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.bold, color: titleColor,),),


              const SizedBox(height: titleToField),
              SizedBox(
                height: fieldHeight,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email or User Name',
                    hintStyle: const TextStyle(color: hintColor),
                    prefixIcon: const Icon(Icons.person_outline),
                    prefixIconColor: titleColor,
                    contentPadding: EdgeInsets.zero,
                    enabledBorder: border,
                    focusedBorder: border,),),),

              if (emailError != null)
                Text(emailError!, style: const TextStyle(fontSize: 12, color: Colors.red,),),

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
                      icon: Icon(hidePassword ? Icons.visibility_off : Icons.visibility, color: titleColor,),

                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },),
                    contentPadding: EdgeInsets.zero,
                    enabledBorder: border,
                    focusedBorder: border,),),),

              if (passwordError != null)
                Text(passwordError!, style: const TextStyle(fontSize: 12, color: Colors.red,),),

              const SizedBox(height: fieldToForgot),

              const Align( alignment: Alignment.centerRight, child: Text('Forget Password ?',
                style: TextStyle( fontSize: textFontSize, fontWeight: FontWeight.bold, color: titleColor,),),),

              const SizedBox(height: forgotToButton),
              SizedBox(
                width: double.infinity,
                height: buttonHeight,
                child: ElevatedButton(
                  onPressed: signIn,
                  style: ElevatedButton.styleFrom(backgroundColor: buttonColor, foregroundColor: Colors.white, elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius),),),
                  child: const Text('Sign in', style: TextStyle(fontSize: textFontSize, fontWeight: FontWeight.bold,),),),),

              const SizedBox(height: socialSpace),
              Center(
                child: Row(mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Don't have account ? ", style: TextStyle(fontSize: textFontSize, color: titleColor,),),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()),);
                      },
                      child: const Text('Sign Up', style: TextStyle(fontSize: textFontSize, fontWeight: FontWeight.bold, color: titleColor,),),),
                  ],),),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}