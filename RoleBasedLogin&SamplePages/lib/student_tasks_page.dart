import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StudentTasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.calendar, color: Colors.purple),
          onPressed: () {},
        ),
        title: Text('کارها'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '24 فروردین 1403',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 10),
            _buildTaskCard('آز ریز - تمرین 1', '4:00 عصر'),
            _buildTaskCard('تمرین الگوریتم', '6:00 عصر'),
            _buildTaskCard('انتخاب واحد', '8:00 عصر'),
            _buildTaskCard('تکمیل آز OS', '9:00 عصر'),
            SizedBox(height: 20),
            Text(
              'کارهای انجام شده',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildCompletedTaskCard('تکمیل آز ریز - تمرین 0'),
            _buildCompletedTaskCard('بررسی فایل ها تمرین'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(CupertinoIcons.add, size: 28),
        backgroundColor: Colors.purple,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.pink,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blue[900],
        currentIndex: 3,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_pencil),
            label: 'تمرینا',
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
            label: 'کارا',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'سرا',
          ),
        ],
      ),
    );
  }

  Widget _buildTaskCard(String text, String time) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: ListTile(
        leading: Icon(CupertinoIcons.clear_circled_solid, color: Colors.red, size: 30),
        title: Text(text, style: TextStyle(fontSize: 16)),
        subtitle: Text(time, style: TextStyle(fontSize: 14, color: Colors.grey)),
        trailing: Icon(CupertinoIcons.check_mark_circled_solid, color: Colors.green, size: 30),
      ),
    );
  }

  Widget _buildCompletedTaskCard(String text) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: ListTile(
        leading: Icon(CupertinoIcons.clear_circled_solid, color: Colors.red, size: 30),
        title: Text(
          text,
          style: TextStyle(fontSize: 16, decoration: TextDecoration.lineThrough),
        ),
      ),
    );
  }
}
