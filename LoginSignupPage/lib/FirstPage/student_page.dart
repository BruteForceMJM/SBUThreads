import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'student_home_page.dart';
import 'student_tasks_page.dart';
import 'student_classes_page.dart';
import 'student_news_page.dart';
import 'student_to_do_list_page.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    StudentHomePage(),
    StudentNewsPage(),
    StudentClassesPage(),
    StudentTasksPage(),
    StudentToDoListPage(),
  ];

  void _onItemTapped(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _pages[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('صفحه اصلی'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.pink,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blue[900],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          _onItemTapped(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_pencil),
            label: 'کارا',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.speaker_2),
            label: 'خبرا',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book),
            label: 'کلاسا',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.time),
            label: 'تسکا',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'سرا',
          ),
        ],
      ),
    );
  }
}