package com.parsebridge;

import com.apportable.utils.ThreadUtils;
import com.parse.ParseTwitterUtils;
import android.content.Context;
import android.util.Log;
import com.parse.LogInCallback;
import com.parsebridge.ParseBridgeLogInCallback;

public class ParseBridgeTwitterUtilsShim {

  private static final String TAG = "ParseBridgeTwitterUtilsShim";

public static void logIn(final Context context, final LogInCallback callback)
  {
    ThreadUtils.runOnUiThread(new Runnable() {
        @Override
        public void run() {
            Log.d(TAG, "login");
            ParseTwitterUtils.logIn(context, callback);
      }
    });
  }
}