import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_page/FirstPage/Pallete.dart';
import 'package:login_signup_page/FirstPage/second_edition_student_classes_page.dart';
import 'package:login_signup_page/FirstPage/second_edition_student_home_page.dart';
import 'package:login_signup_page/FirstPage/second_edition_student_work_space.dart';
import 'package:login_signup_page/FirstPage/student_news_page.dart';

void main(){
  runApp(const Qwerty());
}
class Qwerty extends StatelessWidget{
  const Qwerty({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentNewsPageSecondEdition(),
    );
  }

}
class StudentNewsPageSecondEdition extends StatelessWidget {
  const StudentNewsPageSecondEdition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Pallete.backgroundColor,
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Pallete.backgroundColor,
              ),
            ),
            const SizedBox(height: 700,),
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
                                        const StudentWorkPageEdit()));
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
                        onPressed: () {
                          Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => const StudentClassPageEdit()));
                        },
                        icon: const Icon(
                          Icons.add_chart_rounded,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      IconButton(
                          onPressed: () {

                          },
                          icon: const Icon(
                            CupertinoIcons.news_solid,
                            color: Colors.white,
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
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      SizedBox(
                        width: 48,
                      ),
                      Text('خبرا',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
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
