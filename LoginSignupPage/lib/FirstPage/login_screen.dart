import 'package:flutter/material.dart';
import 'package:login_signup_page/FirstPage/Signup.dart';
import 'package:login_signup_page/widgets/next_button.dart';
import 'package:login_signup_page/widgets/social_button.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 80,),
                Text('دانشجویار',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 40
                  ),),
                SizedBox(
                  height: 50,
                ),
                SocialButton(iconPath: 'assets/svgs/g_logo.svg', label: 'اتصال با گوگل'),
                SizedBox(height: 10,),
                NextButton(label: 'ورود به برنامه',situation: 'Login',),
                SizedBox(height: 10,),
                NextButton(label: 'ثبت نام',horizontalPadding: 125,situation: 'Signup',),


              ],
            ),
          )
      ),
    );
  }
}