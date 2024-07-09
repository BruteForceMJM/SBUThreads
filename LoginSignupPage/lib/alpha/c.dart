import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_page/FirstPage/Pallete.dart';

import '../FirstPage/second_edition_student_classes_page.dart';
import '../FirstPage/second_edition_student_home_page.dart';
import '../FirstPage/second_edition_student_info_page.dart';
import '../FirstPage/second_edition_student_news_page.dart';
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
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> _infoList = [];

  void _openDialog() {
    final _titleController = TextEditingController();
    final _deadlineController = TextEditingController();
    final _explanationController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('جزئیات تمرین'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    Text('عنوان: '),
                    Expanded(
                      child: TextField(
                        controller: _titleController,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text('مهلت: '),
                    Expanded(
                      child: TextField(
                        controller: _deadlineController,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text('توضیحات: '),
                TextFormField(
                  controller: _explanationController,
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
                    'deadline': _deadlineController.text,
                    'explanation': _explanationController.text,
                  });
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
        backgroundColor: Colors.blueAccent,
        title: const Center(child: Text('تمرینات')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: _openDialog,
              child: Text('افزودن تمرین'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _infoList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('عنوان: ${_infoList[index]['title']}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('مهلت: ${_infoList[index]['deadline']}'),
                          Text('توضیحات: ${_infoList[index]['explanation']}'),
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
                        width: 15,
                        height: 0,
                      ),
                      IconButton(
                        onPressed: () {
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
                      const SizedBox(
                        width: 15,
                      ),
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
                            color: Colors.black,
                            size: 30,
                          )),
                      const SizedBox(
                        width: 15,
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
                        width: 15,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const StudentNewsPageSection2()));
                          },
                          icon: const Icon(
                            CupertinoIcons.news_solid,
                            color: Colors.black,
                            size: 30,
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_business,
                            color: Colors.white,
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
                        width: 33,
                      ),
                      Text('حسابا',
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      SizedBox(
                        width: 30,
                      ),
                      Text('کارا',
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      SizedBox(
                        width: 35,
                      ),
                      Text('کلاسا',
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      SizedBox(
                        width: 35,
                      ),
                      Text('خبرا',
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      SizedBox(
                        width: 26,
                      ),
                      Text('تمرینا',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
