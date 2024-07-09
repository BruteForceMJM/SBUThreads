import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_page/FirstPage/Pallete.dart';
import 'package:login_signup_page/FirstPage/login_page.dart';
import 'package:login_signup_page/FirstPage/second_edition_student_home_page.dart';
import 'package:login_signup_page/FirstPage/second_edition_student_news_page.dart';
import 'package:login_signup_page/FirstPage/second_edition_student_work_space.dart';

void main(){
  runApp(const Xc());
}
class Xc extends StatelessWidget {
  const Xc({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentInfoPageEdit(),
    );
  }
}

class StudentInfoPageEdit extends StatefulWidget {
  const StudentInfoPageEdit({super.key});

  @override
  State<StudentInfoPageEdit> createState() => _StudentInfoPageEditState();
}

class _StudentInfoPageEditState extends State<StudentInfoPageEdit> {
  late String _username;
  late String _id;
  late String _countOfUnits;
  late String _currentSemester;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Pallete.backgroundColor,
            ),
          ),
          Container(
            color: Colors.transparent,
            child: const Column(
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  size: 100,
                  color: Colors.white,
                ),
                SizedBox(height: 8,),
                Text(
                  'تقی تقوی اصل',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'دانشجو',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    UserInfoRow(
                      label: 'شماره دانشجویی',
                      value: '4023921124',
                    ),
                    const Divider(),
                    UserInfoRow(
                      label: 'ترم جاری',
                      value: 'بهار 1403-1402',
                    ),
                    const Divider(),
                    UserInfoRow(
                      label: 'تعداد واحد',
                      value: '16',
                    ),
                    const Divider(),
                    UserInfoRow(
                      label: 'معدل کل',
                      value: '18.64',
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 180,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 4.0,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.edit),
                    title: Text('ویرایش مشخصات'),
                    onTap: () {
                      // Navigate to edit details page
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.lock),
                    title: Text('تغییر رمز عبور'),
                    onTap: () {
                      // Navigate to change password page
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              onPressed: () {
                // Handle delete account action
              },
              child: const Center(
                child: Text(
                  'حذف حساب کاربری',
                  style: TextStyle(fontSize: 18,color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 50,),
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

                      },
                      icon: const Icon(
                        Icons.account_circle,
                        color: Colors.white,
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
                        style: TextStyle(color: Colors.white, fontSize: 18)),
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
}

class UserInfoRow extends StatelessWidget {
  final String label;
  final String value;

  UserInfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}
