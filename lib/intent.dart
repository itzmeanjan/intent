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
  Future<void> startActivity({bool createChooser: false}) =>
      _channel.invokeMethod('startActivity', <String, dynamic>{
        'category': _category.isEmpty ? null : _category,
        'flag': _flag.isEmpty ? null : _flag,
        'extra': _extra.isEmpty ? null : _extra,
        'action': _action,
        'type': _type,
        'data': _data.toString(),
        'chooser': createChooser,
      });
}
