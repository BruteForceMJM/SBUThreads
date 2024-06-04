import 'package:flutter/material.dart';
import 'package:login_signup_page/FirstPage/Pallete.dart';
import 'package:login_signup_page/FirstPage/Signup.dart';

import 'GradientButton.dart';
import 'login_screen.dart';
class SignupPage extends StatelessWidget {
  final String situation;
  const SignupPage({super.key, required this.situation});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 200,),
                if(situation =='Signup')
                  const Text(
                    'ثبت نام', style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),),
                if(situation=='Login')
                  const Text(
                    'ورود', style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),),
                const SizedBox(height: 20,),
            ConstrainedBox(
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
                    if(situation=='Signup')
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
                      height: 220,
                    ),
                    const GradientButton(),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Pallete.gradient1,
                                Pallete.gradient2,
                                Pallete.gradient3
                              ]
                          )
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>const LoginScreen()));
                        },

                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(400, 60),
                            backgroundColor: Colors.transparent),
                        child: const Text(
                          'بازگشت',
                          style: TextStyle(
                            color: Pallete.whiteColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )

                  ],
                )
            ),
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

