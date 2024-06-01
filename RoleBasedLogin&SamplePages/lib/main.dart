import 'package:flutter/material.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'admin_page.dart';
import 'student_home_page.dart';
import 'student_news_page.dart';
import 'student_classes_page.dart';
import 'student_tasks_page.dart';
import 'student_to_do_list_page.dart';
import 'student_page.dart';

void main() {
  runApp(EduPulseApp());
}

class EduPulseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EduPulse',
      theme: ThemeData(
        fontFamily: 'IRANSansX',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          button: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InitialPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/admin': (context) => AdminPage(),
        '/student': (context) => StudentPage(),
        '/home': (context) => StudentHomePage(),
        '/news': (context) => StudentNewsPage(),
        '/classes': (context) => StudentClassesPage(),
        '/tasks': (context) => StudentTasksPage(),
        '/todo': (context) => StudentToDoListPage(),
      },
    );
  }
}

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ادیوپالس',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text('ورود'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Text('ثبت نام'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
