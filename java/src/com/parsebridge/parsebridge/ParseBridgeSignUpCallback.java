package com.parsebridge;

import com.parse.ParseUser;
import com.parse.ParseException;
import com.parse.SignUpCallback;

public class ParseBridgeSignUpCallback extends SignUpCallback {
	public native void done(ParseException ex);
	public ParseBridgeSignUpCallback() {}
}
