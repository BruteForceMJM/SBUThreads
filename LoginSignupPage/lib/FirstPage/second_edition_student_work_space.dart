import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../FirstPage/Pallete.dart';
import '../FirstPage/second_edition_student_classes_page.dart';
import '../FirstPage/second_edition_student_home_page.dart';
import '../FirstPage/second_edition_student_info_page.dart';
import '../FirstPage/second_edition_student_news_page.dart';
import '../FirstPage/second_edition_student_practices_page.dart';
import '../FirstPage/second_edition_student_work_space.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StudentWorkPageEdit(),
    );
  }
}

class StudentWorkPageEdit extends StatefulWidget {
  const StudentWorkPageEdit({super.key});

  @override
  _StudentWorkPageEditState createState() => _StudentWorkPageEditState();
}

class _StudentWorkPageEditState extends State<StudentWorkPageEdit> {
  final List<Map<String, dynamic>> _infoList = [];
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _deadlineDateController = TextEditingController();
  final _deadlineHourController = TextEditingController();
  final _explanationController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _deadlineDateController.dispose();
    _deadlineHourController.dispose();
    _explanationController.dispose();
    super.dispose();
  }

  void _openDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('جزئیات تمرین'),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildTextFormField(_titleController, 'عنوان', 'لطفاً عنوان را وارد کنید'),
                  SizedBox(height: 8),
                  _buildDateFormField(_deadlineDateController, 'تاریخ مهلت', 'لطفاً تاریخ مهلت را وارد کنید'),
                  SizedBox(height: 8),
                  _buildTimeFormField(_deadlineHourController, 'ساعت مهلت', 'لطفاً ساعت مهلت را وارد کنید'),
                  SizedBox(height: 8),
                  _buildTextFormField(_explanationController, 'توضیحات', 'لطفاً توضیحات را وارد کنید', maxLines: 3),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('ذخیره'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    _infoList.add({
                      'title': _titleController.text,
                      'deadlineDate': _deadlineDateController.text,
                      'deadlineHour': _deadlineHourController.text,
                      'explanation': _explanationController.text,
                      'isCompleted': false,
                    });
                    send(_titleController.text, _deadlineDateController.text, _deadlineHourController.text, _explanationController.text);
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextFormField(TextEditingController controller, String label, String validationMessage, {int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationMessage;
        }
        return null;
      },
    );
  }

  Widget _buildDateFormField(TextEditingController controller, String label, String validationMessage) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      onTap: () async {
        FocusScope.of(context).requestFocus(FocusNode());
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          controller.text = formattedDate;
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationMessage;
        }
        return null;
      },
    );
  }

  Widget _buildTimeFormField(TextEditingController controller, String label, String validationMessage) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      onTap: () async {
        FocusScope.of(context).requestFocus(FocusNode());
        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (pickedTime != null) {
          controller.text = pickedTime.format(context);
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationMessage;
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      appBar: AppBar(
        backgroundColor: Pallete.backgroundColor,
        title: const Center(
          child: Text('کارها', style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold
          ),),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _openDialog,
            child: Text('افزودن تمرین'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _infoList.length,
              itemBuilder: (context, index) {
                return _buildInfoCard(_infoList[index], index);
              },
            ),
          ),
          _buildBottomNavigationBar(),
        ],
      ),
    );
  }

  Widget _buildInfoCard(Map<String, dynamic> info, int index) {
    return Card(
      color: info['isCompleted'] ? Colors.green : Colors.blue,
      shadowColor: Colors.white,
      child: ListTile(
        title: Text('عنوان: ${info['title']}', style: TextStyle(color: Colors.white)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('تاریخ مهلت: ${info['deadlineDate']}', style: TextStyle(color: Colors.white)),
            Text('ساعت مهلت: ${info['deadlineHour']}', style: TextStyle(color: Colors.white)),
            Text('توضیحات: ${info['explanation']}', style: TextStyle(color: Colors.white)),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.check, color: Colors.white),
          onPressed: () {
            setState(() {
              _infoList[index]['isCompleted'] = !_infoList[index]['isCompleted'];
            });
          },
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      color: Colors.blueAccent,
      height: 83,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 20),
              _buildNavBarIcon(CupertinoIcons.house_fill, StudentHomePageEdit(), Colors.black),
              SizedBox(width: 20),
              _buildNavBarIcon(Icons.account_circle, StudentInfoPageEdit(), Colors.black),
              SizedBox(width: 20),
              _buildNavBarIcon(Icons.task_rounded, StudentWorkPageEdit(), Colors.white),
              SizedBox(width: 20),
              _buildNavBarIcon(Icons.add_chart_rounded, StudentClassPageEdit(), Colors.black),
              SizedBox(width: 20),
              _buildNavBarIcon(CupertinoIcons.news_solid, StudentNewsPageSection2(), Colors.black),
              SizedBox(width: 20),
              _buildNavBarIcon(Icons.add_business, StudentPracticesPageEdition(), Colors.black),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('سرا', style: TextStyle(color: Colors.black, fontSize: 18)),
              Text('حسابا', style: TextStyle(color: Colors.black, fontSize: 18)),
              Text('کارا', style: TextStyle(color: Colors.white, fontSize: 18)),
              Text('کلاسا', style: TextStyle(color: Colors.black, fontSize: 18)),
              Text('خبرا', style: TextStyle(color: Colors.black, fontSize: 18)),
              Text('تمرینا', style: TextStyle(color: Colors.black, fontSize: 18)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavBarIcon(IconData icon, Widget page, Color color) {
    return IconButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      icon: Icon(icon, color: color, size: 30),
    );
  }

  void send(String title, String date, String hour, String description) async {
    String request = "work/$title/$date/$hour/$description\u0000";
    await Socket.connect("10.0.2.2", 8000).then((serverSocket) {
      serverSocket.write(request);
      serverSocket.flush();
      serverSocket.listen((response) {
        print(String.fromCharCodes(response));
      });
    });
  }
}
