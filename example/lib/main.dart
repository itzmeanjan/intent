import 'package:flutter/material.dart';
import 'package:intent/intent.dart';
import 'package:intent/action.dart';
import 'package:intent/extra.dart';
import 'package:intent/category.dart';
import 'package:intent/flag.dart';
import 'dart:async' show StreamController;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MyAppDataModel _myAppDataModel;

  @override
  void initState() {
    _myAppDataModel = MyAppDataModel();
    _myAppDataModel.inputClickState.add([]);
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<List<String>>(
                initialData: [],
                stream: _myAppDataModel.outputResult,
                builder: (context, snapshot) => Padding(
                      padding: EdgeInsets.only(
                        left: 8,
                        right: 8,
                        top: 12,
                        bottom: 24,
                      ),
                      child: snapshot.hasData
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: snapshot.data
                                  .map((item) => Padding(
                                        child: Text('Item :: $item'),
                                        padding: EdgeInsets.only(
                                          top: 8,
                                          bottom: 8,
                                          left: 3,
                                          right: 3,
                                        ),
                                      ))
                                  .toList(),
                            )
                          : CircularProgressIndicator(),
                    ),
              ),
              RaisedButton(
                color: Colors.cyanAccent,
                elevation: 16,
                onPressed: () => Intent()
                  ..setAction(Action.ACTION_PICK)
                  ..setData(Uri.parse('content://contacts'))
                  ..setType("vnd.android.cursor.dir/phone_v2")
                  ..startActivityForResult().then(
                    (data) => _myAppDataModel.inputClickState.add(data),
                    onError: (e) =>
                        _myAppDataModel.inputClickState.add([e.toString()]),
                  ),
                child: Text('Intent'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyAppDataModel {
  StreamController<List<String>> _streamController =
      StreamController<List<String>>.broadcast();

  Sink<List<String>> get inputClickState => _streamController;

  Stream<List<String>> get outputResult =>
      _streamController.stream.map((data) => data);

  dispose() => _streamController.close();
}
