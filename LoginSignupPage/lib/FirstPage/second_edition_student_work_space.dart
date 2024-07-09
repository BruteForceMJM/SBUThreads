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
  final List<Map<String, String>> _infoList = [];
  String _log="" ;
  final _titleController = TextEditingController();
  final _deadlineDateController = TextEditingController();
  final _deadlineHourController = TextEditingController();
  final _explanationController = TextEditingController();
  void _openDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('جزئیات تمرین'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'عنوان',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: _deadlineDateController,
                  decoration: InputDecoration(
                    labelText: 'تاریخ مهلت',
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
                      _deadlineDateController.text = formattedDate;
                    }
                  },

                ),
                SizedBox(height: 8),
                TextField(
                  controller: _deadlineHourController,
                  decoration: InputDecoration(
                    labelText: 'ساعت مهلت',
                    border: OutlineInputBorder(),
                  ),
                  onTap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      _deadlineHourController.text = pickedTime.format(context);
                    }
                  },
                ),
                SizedBox(height: 8),
                TextField(
                  controller: _explanationController,
                  decoration: InputDecoration(
                    labelText: 'توضیحات',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('ذخیره'),
              onPressed: () {
                setState(() {
                  _infoList.add({
                    'title': _titleController.text,
                    'deadlineDate': _deadlineDateController.text,
                    'deadlineHour': _deadlineHourController.text,
                    'explanation': _explanationController.text,
                  });
                  send(_titleController.text, _deadlineDateController.text, _deadlineHourController.text, _explanationController.text);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
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
                return Card(
                  color: Colors.blue,
                  shadowColor: Colors.white,
                  child: ListTile(
                    title: Text('عنوان: ${_infoList[index]['title']}',
                        style: TextStyle(color: Colors.white)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('تاریخ مهلت: ${_infoList[index]['deadlineDate']}',
                            style: TextStyle(color: Colors.white)),
                        Text('ساعت مهلت: ${_infoList[index]['deadlineHour']}',
                            style: TextStyle(color: Colors.white)),
                        Text('توضیحات: ${_infoList[index]['explanation']}',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.blueAccent,
            height: 83,
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      height: 20,
                      width: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const StudentHomePageEdit()));
                        },
                        icon: const Icon(
                          CupertinoIcons.house_fill,
                          color: Colors.black,
                          size: 30,
                        )),
                    const SizedBox(
                      width: 20,
                      height: 0,
                    ),
                    IconButton(
                      onPressed: (){
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const StudentInfoPageEdit()));
                      },
                      icon: const Icon(
                        Icons.account_circle,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 20,),
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const StudentWorkPageEdit()));
                        },
                        icon: const Icon(
                          Icons.task_rounded,
                          color: Colors.white,
                          size: 30,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const StudentClassPageEdit()));
                      },
                      icon: const Icon(
                        Icons.add_chart_rounded,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context)=> const StudentNewsPageSection2())
                          );
                        },
                        icon: const Icon(
                          CupertinoIcons.news_solid,
                          color: Colors.black,
                          size: 30,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const StudentPracticesPageEdition()));
                        },
                        icon: const Icon(
                          Icons.add_business,
                          color: Colors.black,
                          size: 30,
                        ))
                  ],
                ),
                const Row(
                  children: [
                    SizedBox(
                      width: 33,
                    ),
                    Text('سرا',
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                    SizedBox(
                      width: 40,
                    ),
                    Text('حسابا',
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                    SizedBox(
                      width: 30,
                    ),
                    Text('کارا',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    SizedBox(
                      width: 40,
                    ),
                    Text('کلاسا',
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                    SizedBox(
                      width: 40,
                    ),
                    Text('خبرا',
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                    SizedBox(
                      width: 40,
                    ),
                    Text('تمرینا',
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  send(String title,String date, String hour ,String description)async{
    String request = "work/$title/$date/$hour/$description\u0000";
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
