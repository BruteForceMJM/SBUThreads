import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StudentHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.person_crop_circle, color: Colors.blueAccent),
          onPressed: () {},
        ),
        title: Text('صفحه اصلی'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'خلاصه',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: <Widget>[
                _buildSummaryCard('بهترین نمره 100', CupertinoIcons.star_fill, Colors.blue),
                _buildSummaryCard('2 تا امتحان داری', CupertinoIcons.heart_slash_fill, Colors.red),
                _buildSummaryCard('3 تا تمرین داری', CupertinoIcons.time, Colors.pink),
                _buildSummaryCard('2 تا ددلاین پرید', CupertinoIcons.timer, Colors.blueGrey),
                _buildSummaryCard('بدترین نمره 10', CupertinoIcons.down_arrow, Colors.orange),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'تسک‌های جاری',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildTaskCard('آز ریز - تمرین 1', CupertinoIcons.clear_circled_solid, CupertinoIcons.check_mark_circled_solid),
            _buildTaskCard('تست - تمرین 1', CupertinoIcons.clear_circled_solid, CupertinoIcons.check_mark_circled_solid),
            SizedBox(height: 20),
            Text(
              'کارهای انجام شده',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildCompletedCard('AP - تمرین 2'),
                _buildCompletedCard('AP - تمرین 2'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String text, IconData icon, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: color, size: 40),
            SizedBox(height: 10),
            Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCard(String text, IconData icon1, IconData icon2) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: ListTile(
        leading: Icon(icon1, color: Colors.red, size: 30),
        title: Text(text, style: TextStyle(fontSize: 16)),
        trailing: Icon(icon2, color: Colors.green, size: 30),
      ),
    );
  }

  Widget _buildCompletedCard(String text) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Text(text, style: TextStyle(fontSize: 16)),
            SizedBox(width: 10),
            Icon(CupertinoIcons.check_mark_circled_solid, color: Colors.green, size: 30),
          ],
        ),
      ),
    );
  }
}
