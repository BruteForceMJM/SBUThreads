import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter InAppWebView Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WebPage(),
    );
  }
}

class WebPage extends StatefulWidget {
  const WebPage({super.key});

  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SBU Website'),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse('https://news.sbu.ac.ir/'),
        ),
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        onLoadStart: (controller, url) {
          print('Started loading: $url');
        },
        onLoadStop: (controller, url) async {
          print('Finished loading: $url');
        },
        onProgressChanged: (controller, progress) {
          print('Progress: $progress%');
        },
      ),
    );
  }
}
