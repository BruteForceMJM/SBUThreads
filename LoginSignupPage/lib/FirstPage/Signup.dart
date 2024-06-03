import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_page/FirstPage/GradientButton.dart';
import 'package:login_signup_page/FirstPage/Pallete.dart';
import 'package:login_signup_page/FirstPage/login_screen.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 300,
        ),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Email',
                contentPadding: EdgeInsets.all(20),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Pallete.borderColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Pallete.gradient2,
                    width: 4,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
                contentPadding: EdgeInsets.all(20),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Pallete.borderColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Pallete.gradient2,
                    width: 4,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Confirm Password',
                contentPadding: EdgeInsets.all(20),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Pallete.borderColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Pallete.gradient2,
                    width: 4,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const GradientButton(),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=>const LoginScreen()));
              },
              style: ElevatedButton.styleFrom(fixedSize: const Size(200, 20)),
              child: const Text(
                'بازگشت',
                style: TextStyle(
                  color: Pallete.whiteColor,
                ),
              ),
            ),
          ],
        ));
  }
}
