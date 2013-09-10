package com.parsebridge;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.os.Bundle;

import org.json.JSONObject;
import org.json.JSONException;

import com.apportable.activity.VerdeActivity;
import com.apportable.Lifecycle;

import java.lang.reflect.*;
import java.util.Set;
import java.util.Iterator;

/*

2013/09/09 - https://www.parse.com/docs/push_guide#receiving/Android

<receiver android:name="com.parsebridge.ParseReceiverIntent">
<intent-filter>
  <action android:name="com.example.AppIdentifier" />
</intent-filter>
</receiver>

*/

public class ParseReceiverIntent extends BroadcastReceiver {

    private static final String TAG = "ParseReceiverIntent";

    private static native void forwardRemoteNotification(String payload);

    @Override
    public void onReceive(Context context, Intent intent) {
        Log.d(TAG, "onReceive ctx:"+context+" intent:"+intent);
        try {
            String action = intent.getAction();
            String channel = intent.getExtras().getString("com.parse.Channel");
            String payload = intent.getExtras().getString("com.parse.Data");
            JSONObject message = new JSONObject(payload);

            // isBackground defaults to false before the application is created
            if (!Lifecycle.isNativeApplicationStarted() || Lifecycle.isInBackground()) {
                // if app is backgrounded, Parse will automagically deliver notification to system
                // tray list, so we don't need to do anything here
            } else {
                // only receives notification if package exists and is in foreground
                ParseReceiverIntent.forwardRemoteNotification(payload);
            }
        } catch (JSONException e) {
            Log.d(TAG, "JSONException: " + e.getMessage());
        } catch (NullPointerException ex) {
            Log.e(TAG, " caught exception processing message and failing silently to prevent force close.", ex);
        } catch (Exception ex) {
            Log.e(TAG, " caught exception processing message and failing silently to prevent force close.", ex);
        }
    }

    private void logPushExtras(Intent intent) {
        Set<String> keys = intent.getExtras().keySet();
        for (String key : keys) {
            Log.d(TAG, "Push Notification Extra: ["+key+" : " + intent.getStringExtra(key) + "]");
        }
    }
}
