package com.parsebridge;
 
import com.parse.ParseObject;
import com.parse.ParseException;
import com.parse.GetCallback;

public class ParseBridgeGetCallback<T extends ParseObject> extends GetCallback {
	public native void done(ParseObject object, ParseException ex);
	public ParseBridgeGetCallback() {}
}
