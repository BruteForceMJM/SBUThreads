import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_signup_page/FirstPage/second_edition_student_home_page.dart';
import 'package:login_signup_page/FirstPage/student_home_page.dart';
import 'package:login_signup_page/FirstPage/student_page.dart';
import 'package:login_signup_page/FirstPage/tacher_page.dart';

import 'Pallete.dart';
import 'login_screen.dart';

class SiignupPage extends StatefulWidget{
  @override
  _SignupPageState createState() => _SignupPageState();
}
class _SignupPageState extends State<SiignupPage>{

  final _formKey = GlobalKey<FormState>();
  String _username='';
  String _password='';
  String _confirmPasswrod='';
  String _role='student';

  String _log="";
  final TextEditingController _controllerUsername =TextEditingController(text: "");
  final TextEditingController _controllerPassword=TextEditingController(text: "");


  bool _isInvisiblePassword=true;
  void _changeInvisibilityState(){
    setState(() {
      _isInvisiblePassword =!_isInvisiblePassword;
    });
  }
  bool _isInvisibleConfirmPassword=true;
  void _changeConfirmVisibility(){
    _isInvisibleConfirmPassword=!_isInvisibleConfirmPassword;
  }

  bool _validateRole(String username) {
    if (username == 'admin') return false;
    if (username.length == 9 && RegExp(r'^\d+$').hasMatch(username)) {
      return true;
    }
    return false;
  }

  bool _validatePassword(String password) {
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\W).+$');
    return regex.hasMatch(password);
  }

  void _signup() {
    send(_controllerUsername.text, _controllerPassword.text);
    if(_log == 'error'){
      const Text('Error');
    }else{
      if (_formKey.currentState!.validate()) {
        if (_role == 'student') {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>const StudentHomePageEdit()));
        } else if (_role == 'teacher') {
          Navigator.push(context,MaterialPageRoute(builder: (context) => TeacherPage()));
        }
      }
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
                const Text(
                  'ثبت نام',
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
                    child: Form(
                      key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _controllerUsername,
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
                              controller: _controllerPassword,
                              decoration:  InputDecoration(
                                suffixIcon: IconButton(onPressed: (){
                                  setState(() {
                                    _changeInvisibilityState();
                                  });
                                },
                                  icon: Icon(
                                      _isInvisiblePassword ? Icons.visibility : Icons.visibility_off,
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
                              obscureText: _isInvisiblePassword,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              obscureText: _isInvisiblePassword,
                              decoration: InputDecoration(
                                hintText: 'Confirm Password',
                                suffixIcon: IconButton(onPressed: (){
                                  setState(() {
                                    _changeInvisibilityState();
                                  });
                                },
                                    icon: Icon(_isInvisiblePassword? Icons.visibility : Icons.visibility_off)),
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
                              onChanged: (value) => _confirmPasswrod=value,
                              validator: (value) {
                                if(_confirmPasswrod != _password){
                                  return 'رمز عبور ها یکسان نیستند';
                                }
                                return null;
                              },
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
                            const SizedBox(
                              height: 160,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    Pallete.gradient1,
                                    Pallete.gradient2,
                                    Pallete.gradient3,
                                  ], begin: Alignment.bottomLeft),
                                  borderRadius: BorderRadius.circular(10)),
                              child: ElevatedButton(
                                onPressed: _signup,
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(400, 60),
                                  backgroundColor: Colors.transparent,
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
                        )
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

  send(String userName,String password) async{
    String request = "signup/$userName/$password\u0000";
    await Socket.connect("10.0.2.2", 8000).then((serverSocket){
      serverSocket.write(request);
      serverSocket.flush();
      serverSocket.listen((response) {
        print(String.fromCharCodes(response));
        _log += String.fromCharCodes(response);
      });
    });

  }

}