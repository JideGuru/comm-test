import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kommunicate_flutter_plugin/kommunicate_flutter_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kommunicate Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Kommunicate'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool loading  = false;
  Future<dynamic> openSupportChat() async {
    setState(() {
      loading = true;
    });
    try {
      dynamic conversationObject = {
        'appId': '3f6bf602fd1400003e1abc3f69a3b1ceb',
      };
      dynamic result = await KommunicateFlutterPlugin.buildConversation(conversationObject);
      print("Conversation builder success : " + result.toString());
      setState(() {
        loading = false;
      });
    } on Exception catch (e) {
      print("Conversation builder error occurred : " + e.toString());
      setState(() {
        loading = false;
      });
    }
  }


//  Future<dynamic> openSupportChat() async {
//    try {
//      dynamic user = {
//        'userId' : 'reytum',
//        'password': 'reytum'
//      };
//      dynamic convObject = {
//        'appId': '22823b4a764f9944ad7913ddb3e43cae1',
//        'kmUser': jsonEncode(user)
//      };
//      dynamic result =
//      await KommunicateFlutterPlugin.buildConversation(convObject);
//
//      dynamic chatContext = {
//        'key': 'value',
//        'objKey': {
//          'objKey1' : 'objValue1',
//          'objKey2' : 'objValue2'
//        }
//      };
//
//      KommunicateFlutterPlugin.updateChatContext(chatContext);
//
//      print("Conversation builder success : " + result.toString());
//    } on Exception catch (e) {
//      print("Conversation builder error occurred : " + e.toString());
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Testing kommunicate',
            ),
          ],
        ),
      ),
      floatingActionButton: loading
          ? CircularProgressIndicator()
          : FloatingActionButton(
        onPressed: ()=>openSupportChat(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
