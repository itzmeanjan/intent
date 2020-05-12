## 1.0.0

* `intent` is your one stop solution for handling different Android Intents from Flutter app. 

**Enjoy :)**

## 1.1.0

* `intent` - your one stop solution for android activity, can now get you back result from launched activity
* Can pick documents/ multimedia using their default activity, and get you back a `List<String>`, which holds result.
* There might be some situation in which you want to pick multiple documents, which is why `Intent.startActivityForResult()` returns a `List<String>`.
* Most important news, `intent` can capture image using default Camera Activity and get you back path to captured image.

## 1.2.0

* Prior to this release on a single device, > 1 app could not use `intent` package, due to name conflict issue, which has been resolved by pull request submitted by [agniswarm](https://github.com/agniswarm) 
* Added platform specificness in pubspec.yaml to denote usage of package only on android platform
* Now serving `intent` on pub.dev using verified publisher

## 1.3.0

* Intent class now lets you set specific package name for resolving intent
* Assuming that, requested package is present on system, otherwise it'll simply throw PlatformException
* Thanks to PR submitted by [togiberlin](https://github.com/togiberlin) :)
* Usage can be found [here](https://github.com/itzmeanjan/intent#create-precomposed-email-)
* Thanks for using `intent` :)
