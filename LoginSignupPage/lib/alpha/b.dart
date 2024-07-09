import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> userInputs = [];

  void openDialog() async {
    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        String textFieldValue = '';

        return AlertDialog(
          title: Text('Enter Text'),
          content: TextField(
            onChanged: (value) {
              textFieldValue = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Save'),
              onPressed: () {
                Navigator.of(context).pop(textFieldValue);
              },
            ),
          ],
        );
      },
    );

    if (result != null) {
      setState(() {
        userInputs.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: openDialog,
              child: Text('Open Dialog'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: userInputs.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'User Input ${index + 1}: ${userInputs[index]}',
                        style: TextStyle(fontSize: 18),
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
