package com.parsebridge;
 
import com.parse.ParseException;
import com.parse.RefreshCallback;
import com.parse.ParseObject;

public class ParseBridgeRefreshCallback extends RefreshCallback {
	public native void done(ParseObject object, ParseException ex);
	public ParseBridgeRefreshCallback() {}
}
