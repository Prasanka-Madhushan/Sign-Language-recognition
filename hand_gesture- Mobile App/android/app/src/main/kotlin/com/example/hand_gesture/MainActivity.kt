package com.example.hand_gesture

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.nio.ByteBuffer

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example/videoframes"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            // This example doesn't handle any incoming calls from Flutter.
        }
    }

    fun onFrameCaptured(frameData: ByteArray) {
        // Convert byte array to ByteBuffer because MethodChannel expects ByteBuffer for binary data
        val buffer = ByteBuffer.allocateDirect(frameData.size)
        buffer.put(frameData)
        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).invokeMethod("onFrame", buffer)
    }
}