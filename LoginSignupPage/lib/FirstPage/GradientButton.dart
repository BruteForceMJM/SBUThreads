import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_page/FirstPage/Pallete.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:  BoxDecoration(
          gradient: const LinearGradient(colors: [
            Pallete.gradient1,
            Pallete.gradient2,
            Pallete.gradient3,
          ],
            begin: Alignment.bottomLeft
          ),

          borderRadius: BorderRadius.circular(10)
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(400, 60),
              backgroundColor:Colors.transparent,
          ),
          child: const Text(
            'ورود',
            style: TextStyle(
              color: Pallete.whiteColor,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),

        ),
    );
  }
}
