import 'package:flutter/material.dart';
import 'package:login_signup_page/widgets/next_button.dart';
import 'package:login_signup_page/widgets/social_button.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/images/signin_balls.png'),
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
                const NextButton(label: 'ورود به برنامه'),
                const SizedBox(height: 10,),
                const NextButton(label: 'ثبت نام',horizontalPadding: 125,)

              ],
            ),
          )
      ),
    );
  }
}