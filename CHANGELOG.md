## 1.4.0

* Updated `androidx.core` dependency to latest version
* Added optional `type` param support for `Intent.putExtra(String extra, dynamic data, {String type})`` method
* This change is backward compatible
* Now you can specify which type this extra value to be casted into, in android platform code
* If no type information provided uses default behaviour, where it simply gets casted to `String`
* Supported extra data types are put inside `TypedExtra` class

## 1.3.4

* Activity identifier code updated in Kotlin, using 998 for handling both image & video capture Intent(s)
* Image & video temp filename format changed, using locale date format ( i.e. ddmmyyyy_HHmmss.* )
* Updated activity call back handler section, returning result from `else` block of code ( prior to it, it was out of scope of `else` block )

## 1.3.3

* Fixed sourceCompatibility & targetCompatibility issue, set to jdk1.8
* Fixed image & video capture failure issue

## 1.3.2

* Removed cover photo from Github README.md

## 1.3.1

* **Critical bug fix** - in previous release I made a big mistake by not considering `package` is a JAVA keyword, which needs to be escaped in Kotlin code
* Added `setPackage` support for `startActivityForResult` method in Intent class
* Updated Android SDK version, Kotlin version
* Thanks for being so patient :)

## 1.3.0

* Intent class now lets you set specific package name for resolving intent
* Assuming that, requested package is present on system, otherwise it'll simply throw PlatformException
* Thanks to PR submitted by [togiberlin](https://github.com/togiberlin) :)
* Usage can be found [here](https://github.com/itzmeanjan/intent#create-precomposed-email-)
* Thanks for using `intent` :)

## 1.2.0

* Prior to this release on a single device, > 1 app could not use `intent` package, due to name conflict issue, which has been resolved by pull request submitted by [agniswarm](https://github.com/agniswarm)
* Added platform specificness in pubspec.yaml to denote usage of package only on android platform
* Now serving `intent` on pub.dev using verified publisher

## 1.1.0

* `intent` - your one stop solution for android activity, can now get you back result from launched activity
* Can pick documents/ multimedia using their default activity, and get you back a `List<String>`, which holds result.
* There might be some situation in which you want to pick multiple documents, which is why `Intent.startActivityForResult()` returns a `List<String>`.
* Most important news, `intent` can capture image using default Camera Activity and get you back path to captured image.

## 1.0.0

* `intent` is your one stop solution for handling different Android Intents from Flutter app. 

**Enjoy :)**
