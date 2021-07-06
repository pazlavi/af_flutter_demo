package com.appsflyer.afexample1

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {

    override fun onNewIntent(intent : Intent){
        setIntent(intent)
        super.onNewIntent(intent)
    }


}
