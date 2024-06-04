import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'student_home_page.dart';
import 'student_news_page.dart';
import 'student_classes_page.dart';
import 'student_tasks_page.dart';

class StudentToDoListPage extends StatefulWidget {
  const StudentToDoListPage({super.key});

  @override
  _StudentToDoListPageState createState() => _StudentToDoListPageState();
}

class _StudentToDoListPageState extends State<StudentToDoListPage> {
  final List<Map<String, dynamic>> _tasks = [
    {
      'time': '6:00 صبح',
      'title': 'تکلیف سیگنال‌ها و سیستم‌ها',
      'completed': true
    },
    {'time': '9:00 صبح', 'title': 'تکلیف معادلات دیفرانسیل', 'completed': true},
    {
      'time': '12:00 ظهر',
      'title': 'خواندن برای امتحان ریاضی 2',
      'completed': true
    },
    {
      'time': '4:00 عصر',
      'title': 'انجام پروژه درس برنامه‌نویسی پیشرفته',
      'completed': false
    },
    {
      'time': '6:00 عصر',
      'title': 'خواندن برای امتحان مدارهای الکتریکی',
      'completed': false
    },
  ];

  final TextEditingController _taskController = TextEditingController();
  String _selectedPeriod = 'صبح';
  int _hour = 6;
  int _minute = 0;

  void _addTask() {
    setState(() {
      _tasks.add({
        'time': '$_hour:$_minute $_selectedPeriod',
        'title': _taskController.text,
        'completed': false,
      });
    });
    _taskController.clear();
    Navigator.pop(context);
  }

  void _showAddTaskModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Icon(CupertinoIcons.square_list, color: Colors.pink, size: 30),
                SizedBox(width: 10),
                Text(
                  'افزودن کار جدید',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                labelText: 'عنوان',
                hintText: 'عنوان کار...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text('ساعت', style: TextStyle(fontSize: 16)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _buildNumberPicker(_hour, (value) {
                            setState(() {
                              _hour = value;
                            });
                          }),
                          Text(':', style: TextStyle(fontSize: 30)),
                          _buildNumberPicker(_minute, (value) {
                            setState(() {
                              _minute = value;
                            });
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text('پریود', style: TextStyle(fontSize: 16)),
                    ToggleButtons(
                      children: [Text('صبح'), Text('عصر')],
                      isSelected: [
                        _selectedPeriod == 'صبح',
                        _selectedPeriod == 'عصر'
                      ],
                      onPressed: (index) {
                        setState(() {
                          _selectedPeriod = index == 0 ? 'صبح' : 'عصر';
                        });
                      },
                      borderRadius: BorderRadius.circular(20),
                      selectedColor: Colors.white,
                      fillColor: Colors.pink,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _addTask,
                child: Text('افزودن'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberPicker(int initialValue, ValueChanged<int> onChanged) {
    return SizedBox(
      height: 50,
      child: CupertinoPicker(
        scrollController:
        FixedExtentScrollController(initialItem: initialValue),
        itemExtent: 30,
        onSelectedItemChanged: onChanged,
        children: List.generate(24, (index) => Text(index.toString())),
      ),
    );
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/news');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/classes');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/tasks');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/todo');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('کارهای امروز'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _tasks.length,
          itemBuilder: (context, index) {
            final task = _tasks[index];
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 5,
              color: task['completed'] ? Colors.pinkAccent : Colors.pink,
              child: ListTile(
                leading:
                Text(task['time'], style: TextStyle(color: Colors.white)),
                title:
                Text(task['title'], style: TextStyle(color: Colors.white)),
                trailing: Icon(
                  task['completed']
                      ? CupertinoIcons.check_mark_circled
                      : CupertinoIcons.circle,
                  color: Colors.white,
                ),
                onTap: () {
                  setState(() {
                    task['completed'] = !task['completed'];
                  });
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskModal(context),
        child: Icon(CupertinoIcons.add, size: 28),
        backgroundColor: Colors.pink,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.pink,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blue[900],
        currentIndex: 4,
        onTap: _onItemTapped,
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