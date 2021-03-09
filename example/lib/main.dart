import 'package:flutter/material.dart';
import 'package:intent/intent.dart' as android_intent;
import 'package:intent/action.dart' as android_action;
import 'dart:async' show StreamController;
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late MyAppDataModel _myAppDataModel;

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
                      ? snapshot.data!.isNotEmpty
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.file(
                                File(snapshot.data![0]),
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width * .75,
                                height:
                                    MediaQuery.of(context).size.height * .35,
                              ),
                            )
                          : Center()
                      : CircularProgressIndicator(),
                ),
              ),
              RaisedButton(
                color: Colors.cyanAccent,
                elevation: 16,
                onPressed: () => android_intent.Intent()
                  ..setAction(android_action.Action.ACTION_IMAGE_CAPTURE)
                  ..startActivityForResult().then(
                    (data) => print(data),
                    onError: (e) => print(e.toString()),
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
