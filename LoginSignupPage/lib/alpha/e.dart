// import statements
import 'package:flutter/material.dart';

import 'g.dart';

class StudentPracticesPageEdition2 extends StatefulWidget {
  final Function addDialogInfo;

  StudentPracticesPageEdition2({required this.addDialogInfo});

  @override
  State<StudentPracticesPageEdition2> createState() =>
      _StudentPracticesPageEdition2State();
}

class _StudentPracticesPageEdition2State
    extends State<StudentPracticesPageEdition2> {

  final List<Map<String, String>> _infoList = [];

  void _openDialog() {
    final _formKey = GlobalKey<FormState>();
    final _titleController = TextEditingController();
    final _deadlineDateController = TextEditingController();
    final _deadlineHourController = TextEditingController();
    final _explanationController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('جزئیات تمرین'),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(labelText: 'عنوان'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفاً عنوان را وارد کنید';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _deadlineDateController,
                    decoration: InputDecoration(labelText: 'مهلت'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفاً مهلت را وارد کنید';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _deadlineHourController,
                    decoration: InputDecoration(labelText: 'ساعت'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفاً ساعت را وارد کنید';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _explanationController,
                    decoration: InputDecoration(labelText: 'توضیحات'),
                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفاً توضیحات را وارد کنید';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('ذخیره'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    _infoList.add({
                      'title': _titleController.text,
                      'deadlineDate': _deadlineDateController.text,
                      'deadlineHour': _deadlineHourController.text,
                      'explanation': _explanationController.text,
                    });
                    if (_infoList.length > 3) {
                      _infoList.removeAt(0); // Keep only the latest 3
                    }
                  });
                  widget.addDialogInfo(_infoList);
                  Navigator.of(context).pop();
                }
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
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LatestDialogsPage(
                    page1Dialogs: _infoList,
                    page2Dialogs: [], // To be populated by Page 2
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _openDialog,
            child: Text('افزودن تمرین'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _infoList.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.blue,
                  shadowColor: Colors.white,
                  child: ListTile(
                    title: Text('عنوان: ${_infoList[index]['title']}',
                        style: TextStyle(color: Colors.white)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('مهلت: ${_infoList[index]['deadlineDate']}',
                            style: TextStyle(color: Colors.white)),
                        Text('ساعت: ${_infoList[index]['deadlineHour']}',
                            style: TextStyle(color: Colors.white)),
                        Text('توضیحات: ${_infoList[index]['explanation']}',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
