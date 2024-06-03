import 'package:flutter/material.dart';
import 'package:login_signup_page/FirstPage/Pallete.dart';
class GradientButton extends StatelessWidget {
  const GradientButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){},
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(200, 20)
    ),
    child:const Text('ورود',style: TextStyle(
      color: Pallete.whiteColor
    ),),
    );
  }
}
