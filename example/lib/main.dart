import 'package:flutter/material.dart';
import 'package:intent/intent.dart';
import 'package:intent/action.dart';
import 'package:intent/extra.dart';
import 'package:intent/category.dart';
import 'package:intent/flag.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Plugin Example App',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.cyanAccent,
        ),
        body: Center(
          child: RaisedButton(
            color: Colors.cyanAccent,
            elevation: 16,
            onPressed: () => Intent()
              ..setAction(Action.ACTION_TRANSLATE)
              ..putExtra(Extra.EXTRA_TEXT, "I Love Computers")
              ..startActivity().catchError((e) => print(e)),
            child: Text('Intent'),
          ),
        ),
      ),
    );
  }
}
