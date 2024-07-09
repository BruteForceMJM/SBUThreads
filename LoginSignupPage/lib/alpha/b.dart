import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Profile',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: UserProfilePage(),
    );
  }
}

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink,
        toolbarHeight: 0, // This hides the default AppBar
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.pink,
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Icon(
                    Icons.account_circle,
                    size: 100,
                    color: Colors.white,
                  ),
                  SizedBox(height: 8),
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
            SizedBox(height: 16),
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
                      Divider(),
                      UserInfoRow(
                        label: 'ترم جاری',
                        value: 'بهار 1403-1402',
                      ),
                      Divider(),
                      UserInfoRow(
                        label: 'تعداد واحد',
                        value: '16',
                      ),
                      Divider(),
                      UserInfoRow(
                        label: 'معدل کل',
                        value: '18.64',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
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
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
                onPressed: () {
                  // Handle delete account action
                },
                child: Center(
                  child: Text(
                    'حذف حساب کاربری',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
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
