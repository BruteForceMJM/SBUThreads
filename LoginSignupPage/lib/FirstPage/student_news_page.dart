import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StudentNewsPage extends StatelessWidget {
  const StudentNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(CupertinoIcons.search, color: Colors.blue),
          onPressed: () {},
        ),
        title: const Text('رویدادها و اخبار'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
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
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip(context, 'اخبار', true),
                  _buildFilterChip(context, 'رویدادها', false),
                  _buildFilterChip(context, 'یادآوری‌ها', false),
                  _buildFilterChip(context, 'تولدهای امروز', false),
                  _buildFilterChip(context, 'تقدیرها', false),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'امروز (16 اردیبهشت)',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const Divider(),
            Expanded(
              child: ListView(
                children: [
                  _buildNewsCard(context, 'اطلاعیه آموزشی', 'قابل توجه دانشجویان دکترا ورودی 98 امکان حذف یک نیمسال بدون احتساب در سنوات...', 'images/university.jpg'),
                  const SizedBox(height: 10),
                  const Text(
                    'دیروز (15 اردیبهشت)',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const Divider(),
                  _buildNewsCard(context, 'اطلاعیه آموزشی', 'قابل توجه دانشجویان دکترا ورودی 98 امکان حذف یک نیمسال بدون احتساب در سنوات...', 'images/university.jpg'),
                  _buildNewsCard(context, 'اطلاعیه آموزشی', 'قابل توجه دانشجویان دکترا ورودی 98 امکان حذف یک نیمسال بدون احتساب در سنوات...', 'images/university.jpg'),
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
        currentIndex: 1,
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

  Widget _buildFilterChip(BuildContext context, String label, bool selected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: FilterChip(
        label: Text(label),
        selected: selected,
        onSelected: (bool value) {},
        selectedColor: Colors.blue,
        checkmarkColor: Colors.white,
        backgroundColor: Colors.grey[200],
      ),
    );
  }

  Widget _buildNewsCard(BuildContext context, String title, String content, String imageUrl) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        content,
                        style: const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'مطالعه بیشتر...',
                          style: TextStyle(fontSize: 14, color: Colors.white, decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(imageUrl, width: 100, height: 100, fit: BoxFit.cover),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}