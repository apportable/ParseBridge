package com.parsebridge;

import com.parse.*;

public class ParseBridgeLocationCallback extends LocationCallback {
	public native void done(ParseGeoPoint point, ParseException ex);
	public ParseBridgeLocationCallback() {}
}
