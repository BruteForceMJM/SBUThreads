import 'package:flutter/material.dart';
import 'package:login_signup_page/FirstPage/Pallete.dart';
import 'package:login_signup_page/FirstPage/Signup.dart';
class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 200,),
                Text('ثبت نام', style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),),
                SizedBox(height: 20,),
                Signup(),
              ],
            ),
          ),
        ),
      ),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Pallete.backgroundColor,
      ),
    );
  }
}
void main(){
  runApp(const SignupPage());
}
