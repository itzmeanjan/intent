import 'package:flutter/services.dart';

class Intent {
  Intent() {
    this._category = [];
    this._flag = [];
    this._extra = {};
  }

  static const MethodChannel _channel = const MethodChannel('intent');

  String _action;
  String _type;
  Uri _data;
  List<String> _category;
  List<int> _flag;
  Map<String, dynamic> _extra;

  /// adds category for this intent
  ///
  /// Supported values can be found in Category class
  addCategory(String category) => this._category.add(category);

  /// sets flags for intent
  ///
  /// Get possible flag values from Flag class
  addFlag(int flag) => this._flag.add(flag);

  /// puts extra data, to be sent along with intent
  putExtra(String extra, dynamic data) => this._extra[extra] = data;

  /// sets what action this intent is supposed to do
  ///
  /// Possible values can be found in Action class
  setAction(String action) => this._action = action;

  /// sets data type or mime-type
  setType(String type) => this._type = type;

  /// sets data, on which intent will perform selected action
  setData(Uri data) => this._data = data;

  /// You'll most likely use this method.
  ///
  /// Will invoke an activity using platform channel, while passing all parameters and setting them in intent
  Future<void> startActivity({bool createChooser: false}) {
    Map<String, dynamic> parameters = {};
    if (_action != null) parameters['action'] = _action;
    if (_type != null) parameters['type'] = _type;
    if (_data != null) parameters['data'] = _data.toString();
    if (_category.isNotEmpty) parameters['category'] = _category;
    if (_flag.isNotEmpty) parameters['flag'] = _flag;
    if (_extra.isNotEmpty) parameters['extra'] = _extra;
    parameters['chooser'] = createChooser;
    return _channel.invokeMethod('startActivity', parameters);
  }

  Future<List<String>> startActivityForResult({bool createChooser: false}) {
    Map<String, dynamic> parameters = {};
    if (_action != null) parameters['action'] = _action;
    if (_type != null) parameters['type'] = _type;
    if (_data != null) parameters['data'] = _data.toString();
    if (_category.isNotEmpty) parameters['category'] = _category;
    if (_flag.isNotEmpty) parameters['flag'] = _flag;
    if (_extra.isNotEmpty) parameters['extra'] = _extra;
    parameters['chooser'] = createChooser;
    return _channel
        .invokeMethod('startActivityForResult', parameters)
        .then((data) => List<String>.from(data));
  }
}
