import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  String _role = 'student';

  bool _validateRole(String username) {
    if (username == 'admin' && _role == 'admin') return true;
    if (username.length == 9 && RegExp(r'^\d+$').hasMatch(username))
      return true;
    return false;
  }

  bool _validatePassword(String password) {
    if (_username == 'admin' && password == 'admin')
      return true; // Admin specific validation
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\W).+$');
    return regex.hasMatch(password);
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      if (_username == 'admin' && _password == 'admin') {
        Navigator.pushNamed(context, '/admin');
      } else if (RegExp(r'^\d{9}$').hasMatch(_username)) {
        Navigator.pushNamed(
            context, _role == 'student' ? '/student' : '/teacher');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('صفحه ورود'),
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
                  labelText: "نام کاربری",
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
                    return 'رمز عبور وارد شده صحیح نیست';
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
                  DropdownMenuItem(child: Text('ادمین'), value: 'admin'),
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
                onPressed: _login,
                child: Text('ورود'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
