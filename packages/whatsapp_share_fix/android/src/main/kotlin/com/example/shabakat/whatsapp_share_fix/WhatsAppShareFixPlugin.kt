package com.example.shabakat.whatsapp_share_fix

import android.app.Activity
import android.content.ClipData
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import androidx.core.content.FileProvider
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.io.File

class WhatsAppShareFixPlugin : FlutterPlugin, MethodChannel.MethodCallHandler, ActivityAware {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context
    private var activity: Activity? = null

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        context = binding.applicationContext
        channel = MethodChannel(binding.binaryMessenger, "whatsapp_share_fix")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        activity = null
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "isInstalled" -> {
                val packageName = call.argument<String>("package")
                if (packageName.isNullOrEmpty()) {
                    result.error("invalid_args", "package is required", null)
                    return
                }
                result.success(isPackageInstalled(packageName))
            }

            "sharePdf" -> {
                val phone = call.argument<String>("phone")
                val filePath = call.argument<String>("filePath")
                val packageName = call.argument<String>("package")
                val text = call.argument<String>("text")

                if (phone.isNullOrEmpty() || filePath.isNullOrEmpty() || packageName.isNullOrEmpty()) {
                    result.error("invalid_args", "phone, filePath, and package are required", null)
                    return
                }

                try {
                    sharePdf(phone, filePath, packageName, text)
                    result.success(null)
                } catch (e: Exception) {
                    result.error("share_failed", e.message, null)
                }
            }

            else -> result.notImplemented()
        }
    }

    private fun isPackageInstalled(packageName: String): Boolean {
        return try {
            context.packageManager.getPackageInfo(packageName, 0)
            true
        } catch (_: PackageManager.NameNotFoundException) {
            false
        }
    }

    private fun sharePdf(
        phone: String,
        filePath: String,
        packageName: String,
        text: String?,
    ) {
        val host = activity ?: throw IllegalStateException("Activity is not available")

        val file = File(filePath)
        if (!file.exists()) {
            throw IllegalStateException("File does not exist: $filePath")
        }

        val authority = "${host.packageName}.provider"
        val uri: Uri = FileProvider.getUriForFile(host, authority, file)

        val intent = Intent(Intent.ACTION_SEND).apply {
            type = "application/pdf"
            setPackage(packageName)
            putExtra(Intent.EXTRA_STREAM, uri)
            putExtra("jid", "$phone@s.whatsapp.net")
            if (!text.isNullOrEmpty()) {
                putExtra(Intent.EXTRA_TEXT, text)
            }
            clipData = ClipData.newUri(host.contentResolver, "invoice", uri)
            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
        }

        host.grantUriPermission(
            packageName,
            uri,
            Intent.FLAG_GRANT_READ_URI_PERMISSION,
        )

        host.startActivity(intent)
    }
}
