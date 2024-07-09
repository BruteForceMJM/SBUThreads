import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> _infoList = [];

  void _openDialog() {
    final _titleController = TextEditingController();
    final _deadlineController = TextEditingController();
    final _explanationController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('جزئیات تمرین'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    Text('عنوان: '),
                    Expanded(
                      child: TextField(
                        controller: _titleController,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text('مهلت: '),
                    Expanded(
                      child: TextField(
                        controller: _deadlineController,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text('توضیحات: '),
                TextFormField(
                  controller: _explanationController,
                  maxLines: 3,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('ذخیره'),
              onPressed: () {
                setState(() {
                  _infoList.add({
                    'title': _titleController.text,
                    'deadline': _deadlineController.text,
                    'explanation': _explanationController.text,
                  });
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تمرینات'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: _openDialog,
              child: Text('افزودن تمرین'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _infoList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('عنوان: ${_infoList[index]['title']}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('مهلت: ${_infoList[index]['deadline']}'),
                          Text('توضیحات: ${_infoList[index]['explanation']}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
