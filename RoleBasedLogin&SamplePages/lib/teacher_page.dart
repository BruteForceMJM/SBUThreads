import 'package:flutter/material.dart';

class TeacherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('داشبورد استاد'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'اینجا باید به عنوان داشبورد استاد تکمیل بشه',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
