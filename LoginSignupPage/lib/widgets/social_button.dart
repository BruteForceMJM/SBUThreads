import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_signup_page/FirstPage/Pallete.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final String label;

  const SocialButton({super.key, required this.iconPath, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: SvgPicture.asset(
        iconPath,
        width: 20,
        color: Pallete.whiteColor,
      ),
      label: Text(
        label,
        style: const TextStyle(color: Pallete.whiteColor, fontSize: 20),
      ),
      style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 30 , horizontal: 80),
          shape: RoundedRectangleBorder(
              side: const BorderSide(
                  color: Pallete.gradient1,
                  width: 5
              ),
              borderRadius: BorderRadius.circular(30)
          )
      ),
    );
  }
}