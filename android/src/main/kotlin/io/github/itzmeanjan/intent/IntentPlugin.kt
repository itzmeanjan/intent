package io.github.itzmeanjan.intent

import android.app.Activity
import android.content.Intent
import android.net.Uri
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import io.flutter.view.FlutterView

class IntentPlugin(private val registrar: Registrar, private val flutterView: FlutterView, private val activity: Activity): MethodCallHandler {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "intent")
      channel.setMethodCallHandler(IntentPlugin(registrar, registrar.view(), registrar.activity()))
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when(call.method){
      "startActivity" -> {
        val intent = Intent()
        call.argument<String>("action")?.apply {
          intent.action = this
        }
        call.argument<String>("type")?.apply {
          intent.type = this
        }
        call.argument<String>("data")?.apply {
          intent.data = Uri.parse(this)
        }
        call.argument<Map<String, String>>("extra")?.apply {
          this.entries.forEach {
            intent.putExtra(it.key, it.value)
          }
        }
        call.argument<List<Int>>("flag")?.forEach {
          intent.addFlags(it)
        }
        call.argument<List<String>>("category")?.forEach {
          intent.addCategory(it)
        }
        activity.startActivity(intent)
      }
      else -> result.notImplemented()
    }
  }
}
