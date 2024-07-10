// main.dart
import 'package:flutter/material.dart';
import '../FirstPage/second_edition_student_practices_page.dart';
import 'e.dart';
import 'f.dart';
import 'g.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> _practiceDialogs = [];
  final List<Map<String, String>> _workDialogs = [];

  void addPracticeDialog(List<Map<String, String>> dialogs) {
    setState(() {
      _practiceDialogs.clear();
      _practiceDialogs.addAll(dialogs);
    });
  }

  void addWorkDialog(List<Map<String, String>> dialogs) {
    setState(() {
      _workDialogs.clear();
      _workDialogs.addAll(dialogs);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LatestDialogsPage(
                    page1Dialogs: _practiceDialogs,
                    page2Dialogs: _workDialogs,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentPracticesPageEdition2(
                      addDialogInfo: addPracticeDialog,
                    ),
                  ),
                );
              },
              child: Text('Go to Practices Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentWorkSpacePageEdition2(
                      addDialogInfo: addWorkDialog,
                    ),
                  ),
                );
              },
              child: Text('Go to Work Space Page'),
            ),
          ],
        ),
      ),
    );
  }
}
