package com.example.dev;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.os.Bundle;
import java.io.InputStream;
import android.util.Log;

public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "learn.droid.dev/processor";

  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine);
    new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
            .setMethodCallHandler(
                    (call, result) -> {
                      if (call.method.equals("getProcessorName")) {
                        String processorName = getProcessorName();
                        result.success(processorName);
                      } else {
                        result.notImplemented();
                      }
                    }
            );

  }

  private String getProcessorName() {
    String processorName = "";
    try {
      String[] DATA = {"/system/bin/cat", "/proc/cpuinfo"};
      ProcessBuilder processBuilder = new ProcessBuilder(DATA);
      Process process = processBuilder.start();
      InputStream inputStream = process.getInputStream();
      byte[] byteArry = new byte[1024];
      while (inputStream.read(byteArry) != -1) {
        processorName = processorName + new String(byteArry);
      }
      inputStream.close();
      if(processorName.contains("Hardware")) {
        int hardwareIndex = processorName.indexOf("Hardware");
        processorName = processorName.substring(hardwareIndex);
      }
      //Log.d("CPU_INFO", processorName);
      return processorName;
    } catch (Exception ex) {
      ex.printStackTrace();
      return "error";
    }
  }

}
