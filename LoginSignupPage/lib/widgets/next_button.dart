import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_page/FirstPage/Pallete.dart';
import 'package:login_signup_page/FirstPage/Signup.dart';
import 'package:login_signup_page/FirstPage/SignupPage.dart';

class NextButton extends StatelessWidget {
  final String label;
  final double horizontalPadding;
  final String situation;

  const NextButton({
    super.key,
    required this.label,
    this.horizontalPadding =100,
    required this.situation
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){
      Navigator.push(context,
      MaterialPageRoute(builder: (context)=>SignupPage(situation: situation,)));
    },
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 30 , horizontal: horizontalPadding),
          shape:  RoundedRectangleBorder(
            side: const BorderSide(
                color: Pallete.borderColor,
                width: 5
            ),
            borderRadius: BorderRadius.circular(30),
          )
      ), child: Text(label ,
        style: const TextStyle(
            color: Pallete.whiteColor,
            fontSize: 20
        ),),
    );
  }
}