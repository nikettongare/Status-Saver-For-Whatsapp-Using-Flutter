package com.whatsapp.status.saver.paid

import android.content.Intent
import android.net.Uri
import android.os.Build
import android.os.Parcelable
import android.os.storage.StorageManager
import android.util.Log
import androidx.annotation.NonNull
import androidx.documentfile.provider.DocumentFile
import androidx.documentfile.provider.DocumentFile.fromTreeUri
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
  private val channel = "com.iamniket"

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
      super.configureFlutterEngine(flutterEngine)
      MethodChannel(
          flutterEngine.dartExecutor.binaryMessenger,
          channel
      ).setMethodCallHandler { call, result ->
          if (call.method == "getPermission") {
              getPermission()              
          } else if (call.method == "getPath") {
              result.success(resUri)
          }else if (call.method =="listDir") {
              fetchListOfFileNames(resUri)
          }else {
              result.notImplemented()
          }
      }
  }

    private lateinit var resUri : Uri

    private fun getPermission() {
        val intent: Intent
        val storageManager = context.getSystemService(STORAGE_SERVICE) as StorageManager
        var whatsupFolder = "Android%2Fmedia%2Fcom.whatsapp%2FWhatsApp%2FMedia%2F.Statuses"
        if (Build.VERSION.SDK_INT >= 29) {
            intent = storageManager.primaryStorageVolume.createOpenDocumentTreeIntent()
            whatsupFolder =
                intent.getParcelableExtra<Parcelable>("android.provider.extra.INITIAL_URI")
                    .toString().replace("/root/", "/document/") + "%3A" + whatsupFolder
        } else {
            intent = Intent("android.intent.action.OPEN_DOCUMENT_TREE")
        }
        intent.putExtra("android.provider.extra.INITIAL_URI", Uri.parse(whatsupFolder))
        startActivityForResult(intent,1011 )
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        if (requestCode == 1011 && resultCode == -1) {
            val uri : Uri? = data?.data
                try {
                    val contentResolver = applicationContext.contentResolver
                    val takeFlags: Int = Intent.FLAG_GRANT_READ_URI_PERMISSION or
                            Intent.FLAG_GRANT_WRITE_URI_PERMISSION

                    contentResolver.takePersistableUriPermission(uri!!, takeFlags )
                   
                } catch (e: Exception) {
                    e.printStackTrace()
                }
            resUri = uri!!
        }
    }

    private fun fetchListOfFileNames(uri: Uri): ArrayList<String> {
        Log.i("uri" , uri.toString())
        val list: ArrayList<String> = ArrayList()
        val treeRoot: DocumentFile = fromTreeUri(context, uri)!!
        treeRoot.listFiles().forEach { file ->
            list.add(file.name!!)
        }
        Log.i("list info", list.toString())
        return list
    }
}