import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:login_signup_page/FirstPage/Pallete.dart';
import 'package:login_signup_page/FirstPage/second_edition_student_home_page.dart';
import 'package:login_signup_page/FirstPage/second_edition_student_work_space.dart';

void main() {
  runApp(const Beta());
}

class Beta extends StatelessWidget {
  const Beta({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentClassPageEdit(),
    );
  }
}

class StudentClassPageEdit extends StatelessWidget {
  const StudentClassPageEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: Container(
        color: Pallete.backgroundColor,
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Pallete.backgroundColor,
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  ' کلاسا',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  width: 160,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Pallete.gradient1),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const UserInputClassesInfo();
                        });
                  },
                  label: const Text(
                    'افزودن کلاس',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  icon: const Icon(
                    CupertinoIcons.add,
                    color: Colors.white,
                  ),
                ),

              ],
            ),
            const SizedBox(
              height: 700,
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
                        width: 30,
                        height: 0,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                     StudentWorkPageEdit()));
                          },
                          icon: const Icon(
                            Icons.task_rounded,
                            color: Colors.black,
                            size: 30,
                          )),
                      const SizedBox(
                        width: 30,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_chart_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.news_solid,
                            color: Colors.black,
                            size: 30,
                          )),
                      const SizedBox(
                        width: 30,
                      ),
                      IconButton(
                          onPressed: () {},
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
                        width: 55,
                      ),
                      Text('کارا',
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      SizedBox(
                        width: 46,
                      ),
                      Text('کلاسا',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      SizedBox(
                        width: 48,
                      ),
                      Text('خبرا',
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      SizedBox(
                        width: 44,
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
      ),
    );
  }
}

class UserInputClassesInfo extends StatefulWidget {
  const UserInputClassesInfo({super.key});

  @override
  _UserInputClassesInfo createState() => _UserInputClassesInfo();
}

class _UserInputClassesInfo extends State<UserInputClassesInfo> {
  final TextEditingController _controller = TextEditingController(text: "");
  String _log ="";
  final _formKey = GlobalKey<FormState>();
  String _subjectCode = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('افزودن کلاس جدید'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'کد درس گلستان را وارد کنید',
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'لطفا کد درس را وارد کنید';
                }
                return null;
              },
              onSaved: (value) {
                _subjectCode = value!;
              },
              controller: _controller,
            )
          ],
        ),
      ),
      actions: [
        Text(
          _log
        ),
        Row(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      side:
                      const BorderSide(color: Pallete.gradient1, width: 5),
                      borderRadius: BorderRadius.circular(30),
                    )),
                child: const Text('بازگشت')),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.of(context).pop();
                    send(_controller.text);
                  }

                },
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(color: Pallete.gradient1, width: 5),
                      borderRadius: BorderRadius.circular(30),
                    )),
                child: const Text('افزودن کلاس')),

          ],
        ),

      ],
    );
  }

  send(String information) async{
    String request = "$information\u0000";
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
