import 'dart:async';
import 'package:flutter/services.dart';

class Intent {
  static const MethodChannel _channel = const MethodChannel('intent');

  String _action;
  String _type;
  Uri _data;
  List<String> _category;
  List<int> _flag;

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// adds category for this intent
  ///
  /// Supported values can be found in Category class
  addCategory(String category) {
    if (this._category == null)
      this._category = [category];
    else
      this._category.add(category);
  }

  /// sets flags for intent
  ///
  /// Get possible flag values from Flag class
  addFlag(int flag) {
    if (this._flag == null)
      this._flag = [flag];
    else
      this._flag.add(flag);
  }

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
  startActivity() {
    _channel.invokeMethod('startActivity', <String, dynamic>{
      'category': _category,
      'flag': _flag,
      'action': _action,
      'type': _type,
      'data': _data.toString(),
    });
  }
}
