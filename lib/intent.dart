import 'package:flutter/services.dart';

class Intent {
  Intent() {
    this._category = [];
    this._flag = [];
    this._extra = {};
    this._typeInfo = {};
  }

  static const MethodChannel _channel = const MethodChannel('intent');

  String? _action;
  String? _type;
  String? _package;
  Uri? _data;
  List<String>? _category;
  List<int>? _flag;
  Map<String, dynamic>? _extra;
  Map<String, String>? _typeInfo;

  /// Adds category for this intent
  ///
  /// Supported values can be found in Category class
  addCategory(String category) => this._category!.add(category);

  /// Sets flags for intent
  ///
  /// Get possible flag values from Flag class
  addFlag(int flag) => this._flag!.add(flag);

  /// Aims to handle type information for extra data attached
  /// encodes type information as string, passed through PlatformChannel,
  /// and finally gets unpacked in platform specific code ( Kotlin )
  ///
  /// TypedExtra class holds predefined constants ( type information ),
  /// consider using those
  putExtra(String extra, dynamic data, {String? type}) {
    this._extra![extra] = data;
    if (type != null) this._typeInfo![extra] = type;
  }

  /// Sets what action this intent is supposed to do
  ///
  /// Possible values can be found in Action class
  setAction(String action) => this._action = action;

  /// Sets data type or mime-type
  setType(String type) => this._type = type;

  /// Explicitly sets package information using which
  /// Intent to be resolved, preventing chooser from showing up
  setPackage(String package) => this._package = package;

  /// Sets data, on which intent will perform selected action
  setData(Uri data) => this._data = data;

  /// You'll most likely use this method.
  ///
  /// Will invoke an activity using platform channel, while passing all parameters and setting them in intent
  ///
  /// *Now supports setting specific package name, which asks Android to
  /// resolve this Intent using that package, provided it's available*
  Future<void> startActivity({bool createChooser: false}) {
    Map<String, dynamic> parameters = {};

    if (_action != null) parameters['action'] = _action;
    if (_type != null) parameters['type'] = _type;
    if (_package != null) parameters['package'] = _package;
    if (_data != null) parameters['data'] = _data.toString();
    if (_category!.isNotEmpty) parameters['category'] = _category;
    if (_flag!.isNotEmpty) parameters['flag'] = _flag;
    if (_extra!.isNotEmpty) parameters['extra'] = _extra;
    if (_typeInfo!.isNotEmpty) parameters['typeInfo'] = _typeInfo;

    parameters['chooser'] = createChooser;

    return _channel.invokeMethod('startActivity', parameters);
  }

  /// When you're interested in obtaining some result
  /// from intent, then this method needs to be called. Returns
  /// a future, which will be resolved if platform call gets
  /// successful, otherwise results into error.
  Future<List<String>> startActivityForResult({bool createChooser: false}) {
    Map<String, dynamic> parameters = {};

    if (_action != null) parameters['action'] = _action;
    if (_type != null) parameters['type'] = _type;
    if (_package != null) parameters['package'] = _package;
    if (_data != null) parameters['data'] = _data.toString();
    if (_category!.isNotEmpty) parameters['category'] = _category;
    if (_flag!.isNotEmpty) parameters['flag'] = _flag;
    if (_extra!.isNotEmpty) parameters['extra'] = _extra;
    if (_typeInfo!.isNotEmpty) parameters['typeInfo'] = _typeInfo;

    parameters['chooser'] = createChooser;

    return _channel
        .invokeMethod('startActivityForResult', parameters)
        .then((data) => List<String>.from(data));
  }
}
