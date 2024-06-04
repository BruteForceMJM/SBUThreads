import 'package:flutter/material.dart';
import 'package:login_signup_page/FirstPage/Signup.dart';
import 'package:login_signup_page/widgets/next_button.dart';
import 'package:login_signup_page/widgets/social_button.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 80,),
                const Text('دانشجویار',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 40
                  ),),
                const SizedBox(
                  height: 50,
                ),
                const SocialButton(iconPath: 'assets/svgs/g_logo.svg', label: 'اتصال با گوگل'),
                const SizedBox(height: 10,),
                const NextButton(label: 'ورود به برنامه',situation: 'Login',),
                const SizedBox(height: 10,),
                const NextButton(label: 'ثبت نام',horizontalPadding: 125,situation: 'Signup',),
                const SizedBox(height: 130,),
                Image.asset('assets/images/blogo.jpg',width: 150,height: 150,)


              ],
            ),
          )
      ),
    );
  }
}