import 'dart:core';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_page/FirstPage/second_edition_student_home_page.dart';
import 'package:login_signup_page/FirstPage/student_classes_page.dart';
import 'package:login_signup_page/FirstPage/student_home_page.dart';
import 'package:login_signup_page/FirstPage/student_news_page.dart';
import 'package:login_signup_page/FirstPage/student_page.dart';
import 'package:login_signup_page/FirstPage/student_tasks_page.dart';
import 'package:login_signup_page/FirstPage/student_to_do_list_page.dart';
import 'package:login_signup_page/FirstPage/tacher_page.dart';

import '../alpha/a.dart';
import 'GradientButton.dart';
import 'Pallete.dart';
import 'SignupPage.dart';
import 'admin_page.dart';
import 'login_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  String _role = 'student';
  String _log = "";
  final TextEditingController _controllerUsername =
      TextEditingController(text: "");
  final TextEditingController _controllerPassword =
      TextEditingController(text: "");

  bool _isInvisible = true;

  void _changeVisibilityStatus() {
    setState(() {
      _isInvisible = !_isInvisible;
    });
  }

  bool _validateRole(String username) {
    if (username == 'admin' && _role == 'admin') return true;
    if (username.length == 9 && RegExp(r'^\d+$').hasMatch(username)) {
      return true;
    }
    return false;
  }

  bool _validatePassword(String password) {
    if (_username == 'admin' && password == 'admin') {
      return true; // Admin specific validation
    }
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\W).+$');
    return regex.hasMatch(password);
  }

  void _login() {
    if(_log!="error"){
      if (_formKey.currentState != null) {
        if (_formKey.currentState!.validate()) {
          if (_username == 'admin' && _password == 'admin') {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AdminPage()));
          } else if (RegExp(r'^\d{9}$').hasMatch(_username)) {
            if (_role == 'student') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const StudentHomePageEdit()));
            } else if (_role == 'teacher') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TeacherPage()));
            }
            /*Navigator.pushNamed(
              context, _role == 'student' ? '/student' : '/teacher');*/
          }
        }
      }
      send(_controllerUsername.text, _controllerPassword.text);
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
                              onChanged: (value) => _username = value,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  print("Username:${_controllerUsername.text}");
                                  print("Pass:${_controllerPassword.text}");
                                  return 'لطفا نام کاربری خود را وارد کنید';
                                }
                                if (!_validateRole(value)) {
                                  print("Username:${_controllerUsername.text}");
                                  print("Pass:${_controllerPassword.text}");
                                  return 'نام کاربری وارد شده صحیح نیست';
                                }
                                //_controllerUsername.text = value;
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _controllerPassword,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _changeVisibilityStatus();
                                    });
                                  },
                                  icon: Icon(
                                    _isInvisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
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
                              onChanged: (value) => _password = value,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'رمز عبور باید وارد شود';
                                }
                                if (!_validatePassword(value)) {
                                  return 'رمز عبور به اندازه کافی قوی نیست';
                                }
                                //_controllerPassword.text = value;
                                return null;
                              },
                              obscureText: _isInvisible,
                            ),
                            const SizedBox(
                              height: 10,
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
                                  )),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Pallete.gradient2)),
                                  fillColor: Pallete.backgroundColor,
                                  labelText: 'نقش',
                                  prefixIcon: Icon(CupertinoIcons.add),
                                  filled: true,
                                ),
                                items: const [
                                  DropdownMenuItem(
                                    value: 'admin',
                                    child: Text('ادمین'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'professor',
                                    child: Text('استاد'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'student',
                                    child: Text('دانشجو'),
                                  )
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _role = value!;
                                  });
                                }),
                            const SizedBox(
                              height: 160,
                            ),
                            const SizedBox(
                              height: 10,
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
                                onPressed: _login,
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(400, 60),
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
                                    fixedSize: Size(400, 60),
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
                        ))),
              ],
            ),
          ),
        ),
      ),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Pallete.backgroundColor,
      ),
      initialRoute: '/',
      routes: {
        '/login': (context) => const LoginPage(),
        //'/signup': (context) => SignupPage(),
        '/admin': (context) => const AdminPage(),
        '/student': (context) => const StudentPage(),
        '/home': (context) => const StudentHomePage(),
        '/news': (context) => const StudentNewsPage(),
        '/classes': (context) => const StudentClassesPage(),
        '/tasks': (context) => const StudentTasksPage(),
        '/todo': (context) => const StudentToDoListPage(),
      },
    );
  }

  send(String userName, String password) async {
    String request = "login/$userName/$password\u0000";
    await Socket.connect("10.0.2.2", 8000).then((serverSocket) {
      serverSocket.write(request);
      serverSocket.flush();
      serverSocket.listen((response) {
        print(String.fromCharCodes(response));
        setState(() {
          _log += "${String.fromCharCodes(response)}\n";
        });
      });
    });
  }
}
