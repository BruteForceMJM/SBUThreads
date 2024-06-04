import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StudentClassesPage extends StatelessWidget {
  const StudentClassesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(CupertinoIcons.plus_app, color: Colors.blue),
          onPressed: () {},
        ),
        title: Text('کلاس‌ها'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                'ترم بهار 1403',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(CupertinoIcons.add),
              label: Text('افزودن کلاس'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildClassCard(
                    context,
                    title: 'برنامه‌سازی پیشرفته',
                    instructor: 'دکتر علی اکبری',
                    units: 3,
                    remainingTasks: 4,
                    topStudent: 'علی علوی',
                  ),
                  _buildClassCard(
                    context,
                    title: 'برنامه‌سازی پیشرفته',
                    instructor: 'دکتر علی اکبری',
                    units: 3,
                    remainingTasks: 4,
                    topStudent: 'علی علوی',
                  ),
                  _buildClassCard(
                    context,
                    title: 'برنامه‌سازی پیشرفته',
                    instructor: 'دکتر علی اکبری',
                    units: 3,
                    remainingTasks: 4,
                    topStudent: 'علی علوی',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.pink,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blue[900],
        currentIndex: 2,
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

  Widget _buildClassCard(BuildContext context, {required String title, required String instructor, required int units, required int remainingTasks, required String topStudent}) {
    return Card(
      color: Colors.pink,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(CupertinoIcons.book, color: Colors.white, size: 24),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'استاد: $instructor',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Icon(CupertinoIcons.book, color: Colors.white, size: 20),
                SizedBox(width: 5),
                Text(
                  'تعداد واحد: $units',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Icon(CupertinoIcons.list_bullet, color: Colors.white, size: 20),
                SizedBox(width: 5),
                Text(
                  'تکالیف باقی‌مانده: $remainingTasks',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Icon(CupertinoIcons.star, color: Colors.white, size: 20),
                SizedBox(width: 5),
                Text(
                  'دانشجوی ممتاز این هفته: $topStudent',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}