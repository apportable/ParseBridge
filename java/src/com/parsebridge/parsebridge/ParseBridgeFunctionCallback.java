package com.parsebridge;
 
import com.parse.ParseException;
import com.parse.FunctionCallback;

public class ParseBridgeFunctionCallback<T> extends FunctionCallback {
	public native void done(Object object, ParseException ex);
	public ParseBridgeFunctionCallback() {}
}

