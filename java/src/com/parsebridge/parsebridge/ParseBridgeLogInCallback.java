package com.parsebridge;

import com.parse.*;

public class ParseBridgeLogInCallback extends LogInCallback {
	public native void done(ParseUser user, ParseException ex);
	public ParseBridgeLogInCallback() {}
}
