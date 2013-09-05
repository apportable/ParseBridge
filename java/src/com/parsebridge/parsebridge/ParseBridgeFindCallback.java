package com.parsebridge;
 
import java.util.List;
import com.parse.ParseException;
import com.parse.FindCallback;
import com.parse.ParseObject;

public class ParseBridgeFindCallback<T extends ParseObject> extends FindCallback {
	public native void done(List objects, ParseException ex);
	public ParseBridgeFindCallback() {}
}
