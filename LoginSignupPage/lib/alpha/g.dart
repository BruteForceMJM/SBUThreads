// latest_dialogs_page.dart
import 'package:flutter/material.dart';

class LatestDialogsPage extends StatelessWidget {
  final List<Map<String, String>> page1Dialogs;
  final List<Map<String, String>> page2Dialogs;

  LatestDialogsPage({required this.page1Dialogs, required this.page2Dialogs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latest Dialogs'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: page1Dialogs.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.blue,
                  shadowColor: Colors.white,
                  child: ListTile(
                    title: Text('Page 1 - Title: ${page1Dialogs[index]['title']}',
                        style: TextStyle(color: Colors.white)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Deadline Date: ${page1Dialogs[index]['deadlineDate']}',
                            style: TextStyle(color: Colors.white)),
                        Text('Deadline Hour: ${page1Dialogs[index]['deadlineHour']}',
                            style: TextStyle(color: Colors.white)),
                        Text('Explanation: ${page1Dialogs[index]['explanation']}',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: page2Dialogs.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.blue,
                  shadowColor: Colors.white,
                  child: ListTile(
                    title: Text('Page 2 - Title: ${page2Dialogs[index]['title']}',
                        style: TextStyle(color: Colors.white)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Deadline Date: ${page2Dialogs[index]['deadlineDate']}',
                            style: TextStyle(color: Colors.white)),
                        Text('Deadline Hour: ${page2Dialogs[index]['deadlineHour']}',
                            style: TextStyle(color: Colors.white)),
                        Text('Explanation: ${page2Dialogs[index]['explanation']}',
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
