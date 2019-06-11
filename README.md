# intent

A simple flutter plugin to deal with Android Intents, written with :heart:.

Show some :heart: by putting :star:

## what does it do ?
- `intent` is your one stop solution for handling different Android Intents from flutter app.
- It provides an easy to use *Dart* API, which can be used to launch different kind of Android Activities
- You can view / create documents
- Pick document(s) from Document Tree
- Open default Assist Activity
- Perform a Web Search
- Request definition of a certain string to default Assist Activity
- Open image for editing / viewing
- Share text / multimedia to another activity
- Send Email to specific user, while also setting `CC` & `BCC`
- Share multiple documents at a time
- Sync system content
- Translate text
- Set Wallpaper
- Open any `URL`
- Open Dialer for calling a specific number

## how to use it ?
Well make sure, you include `intent` in your `pubspec.yaml`.

### Define a Term :
```dart
Intent()
        ..setAction(Action.ACTION_DEFINE)
        ..putExtra(Extra.EXTRA_TEXT, "json")
        ..startActivity().catchError((e) => print(e));
```
### Show Desired Application Info :
Make sure you address app using its unique package id.
```dart
Intent()
        ..setAction(Action.ACTION_SHOW_APP_INFO)
        ..putExtra(Extra.EXTRA_PACKAGE_NAME, "com.whatsapp")
        ..startActivity().catchError((e) => print(e));
```
### Show Application Preference Activity :
```dart
Intent()
        ..setAction(Action.ACTION_APPLICATION_PREFERENCES)
        ..startActivity().catchError((e) => print(e));
```
### Launch Application Error Reporting Activity :
```dart
Intent()
        ..setAction(Action.ACTION_APP_ERROR)
        ..startActivity().catchError((e) => print(e));
```
### Launch Default Assist Activity :
```dart
Intent()
        ..setAction(Action.ACTION_ASSIST)
        ..startActivity().catchError((e) => print(e));
```
### Report Bug :
```dart
Intent()
        ..setAction(Action.ACTION_BUG_REPORT)
        ..startActivity().catchError((e) => print(e));
```
### View a URI :
```dart
Intent()
        ..setAction(Action.ACTION_VIEW)
        ..setData(Uri(scheme: "tel", path: "123"))
        ..startActivity().catchError((e) => print(e));
```
Which activity to be launched, depends upon type of URI passed. 

If you pass a `mailto` URI, it'll open email app or in case of passing `tel` URI, opens dialer up or in case of `http`/ `https` URI, opens browser up.

```dart
Intent()
        ..setAction(Action.ACTION_VIEW)
        ..setData(Uri(scheme: "mailto", path: "someone@example.com"))
        ..startActivity().catchError((e) => print(e));
```
