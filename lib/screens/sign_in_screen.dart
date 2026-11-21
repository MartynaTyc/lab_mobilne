import 'package:flutter/material.dart';
import 'package:projekt_lab_mobilne/screens/sign_up_screen.dart';

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

  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius),
    borderSide: const BorderSide(color: borderColor, width: borderWidth,),);


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

              const SizedBox(height: fieldToForgot),

              const Align( alignment: Alignment.centerRight, child: Text('Forget Password ?',
                  style: TextStyle( fontSize: textFontSize, fontWeight: FontWeight.bold, color: titleColor,),),),

              const SizedBox(height: forgotToButton),
              SizedBox(
                width: double.infinity,
                height: buttonHeight,
                child: ElevatedButton(
                  onPressed: () {},
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
