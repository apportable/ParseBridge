package com.parsebridge;
 
import com.parse.ParseException;
import com.parse.RequestPasswordResetCallback;

public class ParseBridgeRequestPasswordResetCallback extends RequestPasswordResetCallback {
	public native void done(ParseException ex);
	public ParseBridgeRequestPasswordResetCallback() {}
}
