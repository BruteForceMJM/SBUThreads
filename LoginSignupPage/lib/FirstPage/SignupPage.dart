import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_page/FirstPage/Pallete.dart';
import 'package:login_signup_page/FirstPage/Signup.dart';
import 'GradientButton.dart';
import 'login_screen.dart';



class SignupPage extends StatelessWidget {
  final String situation;
  String _password ='';
  String _username='';
  String _role ='student';
  bool _isInvisible=true;
  SignupPage({super.key, required this.situation});


  bool _validatePassword(String password) {
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\W).+$');
    return regex.hasMatch(password);
  }

  final TextEditingController _controller =TextEditingController();
  String _message ='';
  void _checkPassword(){
    final password = _controller.text;
    final hasDigit = password.contains(RegExp(r'\d'));
    final hasLowerCase =password.contains(RegExp(r'[a-z]'));
    final hasUpperCase=password.contains(RegExp(r'[A-Z]'));
    if(hasUpperCase &&hasLowerCase&& hasDigit){
      setState(() {
        _message='رمز عبور شما مناسب است';
      });
    }else{
      _message='رمز عبور شما به اندازه کافی قوی نیست';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                if (situation == 'Signup')
                  const Text(
                    'ثبت نام',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                if (situation == 'Login')
                  const Text(
                    'ورود',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 300,
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Username',
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
                          onChanged: (value)=>_username=value,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _controller,
                          decoration:  InputDecoration(
                            suffixIcon: IconButton(onPressed: (){
                              setState(() {
                                _isInvisible=!_isInvisible;
                              });
                            },
                                icon: const Icon(
                                  CupertinoIcons.eye_fill
                                ),
                            ),
                            hintText: 'Password',
                            contentPadding: const EdgeInsets.all(20),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Pallete.borderColor,
                              ),

                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Pallete.gradient2,
                                width: 4,
                              ),
                            ),
                          ),
                          onChanged: (value)=>_password=value,
                          validator: (value) {
                            if(value==null || value.isEmpty){
                              return 'رمز عبور باید وارد شود';
                            }
                            if(!_validatePassword(value)){
                              return 'رمز عبور به اندازه کافی قوی نیست';
                            }
                            return null;
                          },
                          obscureText: _isInvisible,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (situation == 'Signup')
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              suffixIcon: IconButton(onPressed: (){},
                                  icon: const Icon(CupertinoIcons.eye_fill)),
                              contentPadding: const EdgeInsets.all(20),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Pallete.borderColor,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Pallete.gradient2,
                                  width: 4,
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: 30,
                        ),
                        DropdownButtonFormField(
                          value: _role,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Pallete.borderColor,
                                )
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Pallete.gradient2
                                )
                              ),
                              fillColor: Pallete.backgroundColor,
                              labelText: 'نقش',
                              prefixIcon: Icon(CupertinoIcons.add),
                              filled: true,

                            ),
                            items: const [
                              DropdownMenuItem(value: 'admin',child: Text('ادمین'),),
                              DropdownMenuItem(value: 'professor',child: Text('استاد'),),
                              DropdownMenuItem(value: 'student',child: Text('دانشجو'),)
                            ],
                            onChanged: (value) {
                            setState((){
                              _role=value!;
                            });
                            }),
                        if(situation=='Login')
                          const SizedBox(
                            height: 220,
                          ),
                        if(situation=='Signup')
                          const SizedBox(
                            height: 160,
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                            Pallete.gradient1,
                            Pallete.gradient2,
                            Pallete.gradient3
                          ])),
                          child: ElevatedButton(
                            onPressed: () {
                              _checkPassword();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
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
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                      ],
                    )),
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

  void setState(Null Function() param0) {}
}




