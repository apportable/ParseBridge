package com.parsebridge;

import com.parse.ParseException;
import com.parse.DeleteCallback;

public class ParseBridgeDeleteCallback extends DeleteCallback {
    public native void done(ParseException ex);
    public ParseBridgeDeleteCallback() {}
}
