import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('داشبورد ادمین'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          'اینجا باید به عنوان داشبورد ادمین تکمیل بشه',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}