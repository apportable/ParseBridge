package com.parsebridge;

import com.apportable.utils.ThreadUtils;
import com.parse.ParseTwitterUtils;
import com.parse.ParseUser;
import android.content.Context;
import android.util.Log;
import com.parse.LogInCallback;
import com.parse.SaveCallback;

public class ParseBridgeTwitterUtilsShim {

private static final String TAG = "ParseBridgeTwitterUtilsShim";

public static void logIn(final Context context, final LogInCallback callback)
{
    ThreadUtils.runOnUiThread(new Runnable() {
        @Override
        public void run() {
            Log.d(TAG, "logIn");
            ParseTwitterUtils.logIn(context, callback);
        }
    });
}

public static void link(final ParseUser user, final Context context, final SaveCallback callback)
{
    ThreadUtils.runOnUiThread(new Runnable() {
        @Override
        public void run() {
            Log.d(TAG, "link");
            ParseTwitterUtils.link(user, context, callback);
        }
    });
}

}