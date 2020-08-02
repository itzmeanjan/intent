/// This class holds some constant strings for user accessibility,
/// so that end users don't need to hardcode type information
/// in updated `Intent.putExtra(String extra, dynamic data, {String type})`
/// method which aims to facilitate better type handling for Intent data.
///
/// Prior to it, all extra passed to Intent, were getting type casted to
/// `String`, which was bad implementation - trying to improve that
///
/// *This won't break any existing codebase*
class TypedExtra {
  /// singular type information

  static const String booleanExtra = "boolean";

  static const String byteExtra = "byte";

  static const String shortExtra = "short";

  static const String intExtra = "int";

  static const String longExtra = "long";

  static const String floatExtra = "float";

  static const String doubleExtra = "double";

  static const String charExtra = "char";

  static const String stringExtra = "String";

  /// collection types from aforementioned types

  static const String booleanListExtra = "boolean[]";

  static const String byteListExtra = "byte[]";

  static const String shortListExtra = "short[]";

  static const String intListExtra = "int[]";

  static const String longListExtra = "long[]";

  static const String floatListExtra = "float[]";

  static const String doubleListExtra = "double[]";

  static const String charListExtra = "char[]";

  static const String stringListExtra = "String[]";
}
