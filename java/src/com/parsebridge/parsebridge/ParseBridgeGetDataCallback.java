package com.parsebridge;

import com.parse.ParseException;
import com.parse.GetDataCallback;

public class ParseBridgeGetDataCallback extends GetDataCallback {
	public native void done(byte[] data, ParseException ex);
	public ParseBridgeGetDataCallback() {}
}