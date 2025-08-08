package com.example.base_dialog_plugin

import android.app.AlertDialog
import android.content.Context
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** BaseDialogPlugin */
class BaseDialogPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will handle communication between Flutter and native Android
  private lateinit var channel: MethodChannel
  private var context: Context? = null

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "base_dialog_plugin")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      "getPlatformVersion" -> {
        result.success("Android ${android.os.Build.VERSION.RELEASE}")
      }
      
      "showAlertDialog" -> {
        showAlertDialog(call, result)
      }
      
      "showActionDialog" -> {
        showActionDialog(call, result)
      }
      
      else -> {
        result.notImplemented()
      }
    }
  }

  private fun showAlertDialog(call: MethodCall, result: Result) {
    val activity = currentActivity
    if (activity == null) {
      result.error("NO_ACTIVITY", "Activity not available", null)
      return
    }

    val title = call.argument<String>("title")
    val message = call.argument<String>("message")
    val buttonText = call.argument<String>("buttonText") ?: "OK"

    activity.runOnUiThread {
      AlertDialog.Builder(activity)
        .setTitle(title)
        .setMessage(message)
        .setPositiveButton(buttonText) { dialog, _ ->
          dialog.dismiss()
          result.success(true)
        }
        .setCancelable(false)
        .show()
    }
  }

  private fun showActionDialog(call: MethodCall, result: Result) {
    val activity = currentActivity
    if (activity == null) {
      result.error("NO_ACTIVITY", "Activity not available", null)
      return
    }

    val title = call.argument<String>("title")
    val message = call.argument<String>("message")
    val buttonTextLeft = call.argument<String>("buttonTextLeft") ?: "Cancel"
    val buttonTextRight = call.argument<String>("buttonTextRight") ?: "OK"

    activity.runOnUiThread {
      AlertDialog.Builder(activity)
        .setTitle(title)
        .setMessage(message)
        .setNegativeButton(buttonTextLeft) { dialog, _ ->
          dialog.dismiss()
          result.success("left")
        }
        .setPositiveButton(buttonTextRight) { dialog, _ ->
          dialog.dismiss()
          result.success("right")
        }
        .setCancelable(false)
        .show()
    }
  }

  private var currentActivity: android.app.Activity? = null

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    currentActivity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {
    currentActivity = null
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    currentActivity = binding.activity
  }

  override fun onDetachedFromActivity() {
    currentActivity = null
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
    context = null
  }
}