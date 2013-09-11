package com.parsebridge;

import android.app.Application;
import android.util.Log;
import android.os.Bundle;

import com.apportable.utils.MetaData;

import com.parse.Parse;

public class ParseApplication {
    public void onCreate(Application application) {
        Log.i("APPLICATION", "ParseBridge subApp onCreate");

        Bundle metaData = MetaData.getMetaData();
        final String applicationId = metaData.getString("com.parsebridge.parseApplicationId");
        final String clientKey = metaData.getString("com.parsebridge.parseClientKey");

        Parse.initialize(application, applicationId, clientKey);
    }
}
