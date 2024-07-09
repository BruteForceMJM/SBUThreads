import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:login_signup_page/FirstPage/Pallete.dart';
import 'package:login_signup_page/FirstPage/second_edition_student_classes_page.dart';
import 'package:login_signup_page/FirstPage/second_edition_student_home_page.dart';
import 'package:login_signup_page/FirstPage/second_edition_student_work_space.dart';
import 'package:login_signup_page/FirstPage/student_news_page.dart';

void main() {
  runApp(const Qwerty());
}

class Qwerty extends StatelessWidget {
  const Qwerty({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentNewsPageSection2(),
    );
  }
}

class StudentNewsPageSection2 extends StatefulWidget {
  const StudentNewsPageSection2({super.key});

  @override
  State<StudentNewsPageSection2> createState() => _StudentNewsPageSection2State();
}

class _StudentNewsPageSection2State extends State<StudentNewsPageSection2> {
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse('https://news.sbu.ac.ir/')),
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
              onLoadStart: (controller, url) {
                print("Started loading: $url");
              },
              onLoadStop: (controller, url) async {
                print("Stopped loading: $url");
              },
              onLoadError: (controller, url, code, message) {
                print("Error loading: $url, Code: $code, Message: $message");
              },
              onProgressChanged: (controller, progress) {
                if (progress == 100) {
                  print("Page loaded");
                }
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
                      onPressed: () {

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
                                      StudentWorkPageEdit()));
                        },
                        icon: const Icon(
                          Icons.task_rounded,
                          color: Colors.black,
                          size: 30,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      onPressed: () {},
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
                              MaterialPageRoute(builder: (context) => const StudentNewsPageSection2())
                          );
                        },
                        icon: const Icon(
                          CupertinoIcons.news_solid,
                          color: Colors.white,
                          size: 30,
                        )),
                    const SizedBox(
                      width: 20,
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
                      width: 40,
                    ),
                    Text('حسابا',
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                    SizedBox(
                      width: 30,
                    ),
                    Text('کارا',
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                    SizedBox(
                      width: 40,
                    ),
                    Text('کلاسا',
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                    SizedBox(
                      width: 40,
                    ),
                    Text('خبرا',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
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
}
