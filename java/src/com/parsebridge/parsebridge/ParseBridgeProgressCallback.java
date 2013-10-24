package com.parsebridge;

import java.lang.Integer;
import com.parse.ProgressCallback;

public class ParseBridgeProgressCallback extends ProgressCallback {
	public native void done(Integer percentDone);
	public ParseBridgeProgressCallback() {}
}