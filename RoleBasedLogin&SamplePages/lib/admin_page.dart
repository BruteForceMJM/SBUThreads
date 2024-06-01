import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('داشبورد ادمین'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'اینجا باید به عنوان داشبورد ادمین تکمیل بشه',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
