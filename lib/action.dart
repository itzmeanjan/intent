class Action {
  /// gets a list of available apps
  static const String ACTION_ALL_APPS = "android.intent.action.ALL_APPS";

  /// lets adjust application preference
  static const String ACTION_APPLICATION_PREFERENCES =
      "android.intent.action.APPLICATION_PREFERENCES";

  /// helps in error reporting
  static const String ACTION_APP_ERROR = "android.intent.action.APP_ERROR";

  /// launches google app by default, which can provide user assistance
  static const String ACTION_ASSIST = "android.intent.action.ASSIST";
  static const String ACTION_ATTACH_DATA = "android.intent.action.ATTACH_DATA";

  /// lets user report bug
  static const String ACTION_BUG_REPORT = "android.intent.action.BUG_REPORT";

  /// lets call a number, opens dialer
  ///
  /// not all app possesses calling permission, so to stay on safe side,
  /// you may be interested in using DIAL action
  static const String ACTION_CALL = "android.intent.action.CALL";

  /// this one will simply open an activity, where user can place a call
  ///
  /// mostly it'll be opening default phone app installed
  static const String ACTION_CALL_BUTTON = "android.intent.action.CALL_BUTTON";

  /// requires carrier privilege, opens default activity for modifying carrier setting
  static const String ACTION_CARRIER_SETUP =
      "android.intent.action.CARRIER_SETUP";

  /// creates a new document
  static const String ACTION_CREATE_DOCUMENT =
      "android.intent.action.CREATE_DOCUMENT";

  /// creates app shortcut
  static const String ACTION_CREATE_SHORTCUT =
      "android.intent.action.CREATE_SHORTCUT";

  /// displays specified data to user
  ///
  /// this is the mostly performed action on data
  ///
  /// you may be passing a URL, and it'll open list of eligible candidate apps, which can help you in viewing that URL
  static const String ACTION_VIEW = "android.intent.action.VIEW";

  /// quickly opens default assist app, and finds definition for queried text
  static const String ACTION_DEFINE = "android.intent.action.DEFINE";

  /// a certain Uri to be deleted, which is to be specified using data field
  static const String ACTION_DELETE = "android.intent.action.DELETE";

  /// for opening dialer with a number pre filled, you'll be mostly using this action
  static const String ACTION_DIAL = "android.intent.action.DIAL";

  /// lets you edit data, specified using Uri
  static const String ACTION_EDIT = "android.intent.action.EDIT";

  /// opens file picker, gets you content of specified types
  ///
  /// can be opened for getting images/ videos/ music etc.
  static const String ACTION_GET_CONTENT = "android.intent.action.GET_CONTENT";

  /// you can create new contact using this action
  static const String ACTION_INSERT = "android.intent.action.INSERT";
  static const String ACTION_INSERT_OR_EDIT =
      "android.intent.action.INSERT_OR_EDIT";
  static const String ACTION_MAIN = "android.intent.action.MAIN";

  /// opens a document, specified using Uri
  static const String ACTION_OPEN_DOCUMENT =
      "android.intent.action.OPEN_DOCUMENT";

  /// opens whole document tree, using default file manager activity
  static const String ACTION_OPEN_DOCUMENT_TREE =
      "android.intent.action.OPEN_DOCUMENT_TREE";
  static const String ACTION_PASTE = "android.intent.action.PASTE";

  /// will be made to work in future releases
  static const String ACTION_PICK = "android.intent.action.PICK";

  /// power usage summy displaying activity
  static const String ACTION_POWER_USAGE_SUMMARY =
      "android.intent.action.POWER_USAGE_SUMMARY";

  /// processes text
  static const String ACTION_PROCESS_TEXT =
      "android.intent.action.PROCESS_TEXT";
  static const String ACTION_QUICK_VIEW = "android.intent.action.QUICK_VIEW";

  /// search for a certain term, put as EXTRA_TEXT
  static const String ACTION_SEARCH = "android.intent.action.SEARCH";

  /// share text/ document/ multimedia
  static const String ACTION_SEND = "android.intent.action.SEND";

  /// send to a certain user, denoted by data URI
  static const String ACTION_SENDTO = "android.intent.action.SENDTO";

  /// send multiple documents at a time
  static const String ACTION_SEND_MULTIPLE =
      "android.intent.action.SEND_MULTIPLE";

  /// set wallpaper activity
  static const String ACTION_SET_WALLPAPER =
      "android.intent.action.SET_WALLPAPER";

  /// opens app info displaying activity
  static const String ACTION_SHOW_APP_INFO =
      "android.intent.action.SHOW_APP_INFO";

  /// synchronize app data with backend
  static const String ACTION_SYNC = "android.intent.action.SYNC";
  static const String ACTION_SYSTEM_TUTORIAL =
      "android.intent.action.SYSTEM_TUTORIAL";

  /// translate data passed with intent
  static const String ACTION_TRANSLATE = "android.intent.action.TRANSLATE";
  static const String ACTION_VOICE_COMMAND =
      "android.intent.action.VOICE_COMMAND";

  /// perform a web search using default search activity
  static const String ACTION_WEB_SEARCH = "android.intent.action.WEB_SEARCH";

  /// intent to capture image, using default camera activity
  static const String ACTION_IMAGE_CAPTURE =
      "android.media.action.IMAGE_CAPTURE";
}
