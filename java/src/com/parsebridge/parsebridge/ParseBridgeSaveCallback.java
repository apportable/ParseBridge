package com.parsebridge;
 
import com.parse.ParseException;
import com.parse.SaveCallback;

public class ParseBridgeSaveCallback extends SaveCallback {
	public native void done(ParseException ex);
	public ParseBridgeSaveCallback() {}
}
