package io.github.itzmeanjan.intent

import android.app.Activity
import android.content.Intent
import android.net.Uri
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import kotlin.collections.ArrayList

class IntentPlugin(private val activity: Activity) : MethodCallHandler {
    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "intent")
            channel.setMethodCallHandler(IntentPlugin(registrar.activity()))
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "startActivity" -> {
                val intent: Intent = Intent().apply {
                    action = call.argument<String>("action")
                    data = Uri.parse(call.argument<String>("data"))
                }
                call.argument<Map<String, Any>>("extra")?.apply {
                    this.entries.forEach {
                        when (it.key) {
                            Intent.EXTRA_LOCAL_ONLY,
                            Intent.EXTRA_ALLOW_MULTIPLE, Intent.EXTRA_PROCESS_TEXT_READONLY -> intent.putExtra(it.key, it.value as Boolean)
                            Intent.EXTRA_EMAIL,
                            Intent.EXTRA_BCC,
                            Intent.EXTRA_CC, Intent.EXTRA_MIME_TYPES -> {
                                val tmp = it.value as ArrayList<*>
                                intent.putExtra(it.key, tmp.toArray(arrayOfNulls<String>(tmp.size)))
                            }
                            Intent.EXTRA_CONTENT_ANNOTATIONS -> intent.putExtra(it.key, (it.value as? ArrayList<*>)?.filterIsInstance<String>() as ArrayList<String>)
                            Intent.EXTRA_ORIGINATING_URI -> intent.putExtra(it.key, it.value as Uri)
                            Intent.EXTRA_PROCESS_TEXT, Intent.EXTRA_TEXT, Intent.EXTRA_TITLE -> {
                                if (intent.action == Intent.ACTION_WEB_SEARCH)
                                    intent.putExtra("query", it.value as CharSequence)
                                else
                                    intent.putExtra(it.key, it.value as CharSequence)
                            }
                            else -> intent.putExtra(it.key, it.value as String)

                        }
                    }
                }
                call.argument<List<Int>>("flag")?.forEach {
                    intent.addFlags(it)
                }
                call.argument<List<String>>("category")?.forEach {
                    intent.addCategory(it)
                }
                intent.type = call.argument<String>("type")
                try {
                    if (call.argument<Boolean>("chooser")!!) activity.startActivity(Intent.createChooser(intent, "Sharing"))
                    else activity.startActivity(intent)
                    //result.success(null)
                } catch (e: Exception) {
                    result.error("Error", e.toString(), null)
                }
            }
            else -> result.notImplemented()
        }
    }
}
