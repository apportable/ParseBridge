package com.parsebridge;

import com.parse.ParseException;
import com.parse.CountCallback;

public class ParseBridgeCountCallback extends CountCallback {
	public native void done(int count, ParseException ex);
	public ParseBridgeCountCallback() {}
}
