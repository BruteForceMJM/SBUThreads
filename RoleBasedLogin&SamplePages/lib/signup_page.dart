import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  String _confirmPassword = '';
  String _role = 'student';

  bool _validateRole(String username) {
    if (username == 'admin') return false;
    if (username.length == 9 && RegExp(r'^\d+$').hasMatch(username))
      return true;
    return false;
  }

  bool _validatePassword(String password) {
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\W).+$');
    return regex.hasMatch(password);
  }

  void _signup() {
    if (_formKey.currentState!.validate()) {
      if (_role == 'student') {
        Navigator.pushNamed(context, '/student');
      } else if (_role == 'teacher') {
        Navigator.pushNamed(context, '/teacher');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ثبت نام'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(CupertinoIcons.person_crop_circle,
                  size: 100, color: Colors.blueAccent),
              SizedBox(height: 20),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: 'نام کاربری',
                  prefixIcon: Icon(CupertinoIcons.person),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onChanged: (value) => _username = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'لطفا نام کاربری خود را وارد کنید';
                  }
                  if (!_validateRole(value)) {
                    return 'نام کاربری وارد شده صحیح نیست';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: 'رمز عبور',
                  prefixIcon: Icon(CupertinoIcons.lock),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                obscureText: true,
                onChanged: (value) => _password = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'لطفا رمز عبور خود را وارد کنید';
                  }
                  if (!_validatePassword(value)) {
                    return 'رمز عبور باید شامل حداقل یک حرف خاص و بزرگ باشد';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: 'تایید رمز عبور',
                  prefixIcon: Icon(CupertinoIcons.lock),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                obscureText: true,
                onChanged: (value) => _confirmPassword = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'لطفا رمز عبور خود را تایید کنید';
                  }
                  if (value != _password) {
                    return 'رمز عبور ها یکسان نیستند';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField(
                value: _role,
                decoration: InputDecoration(
                  labelText: 'نقش',
                  prefixIcon: Icon(CupertinoIcons.group),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                items: [
                  DropdownMenuItem(child: Text('دانشجو'), value: 'student'),
                  DropdownMenuItem(child: Text('استاد'), value: 'teacher'),
                ],
                onChanged: (value) {
                  setState(() {
                    _role = value!;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signup,
                child: Text('ثبت نام'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
